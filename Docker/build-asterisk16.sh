#!/bin/bash

# Thanks to https://andrius.mobi/ Andrius Kairiukstis
# https://github.com/andrius/asterisk
# https://github.com/andrius/asterisk/blob/master/debian/16-current/build-asterisk.sh

PROGNAME=$(basename $0)

if test -z ${ASTERISK_VERSION}; then
  echo "${PROGNAME}: ASTERISK_VERSION required" >&2
  exit 1
fi

set -ex

# useradd --system asterisk


# Provide consistent id's for Linux system users
groupadd -r -g 500 asterisk
useradd -r -u 500 -g asterisk -M -c "Used by Asterisk" -s /bin/false asterisk
groupadd -r -g 501 astpbx
useradd -r -u 501 -g astpbx -M -c "Used by astbss.com" -s /bin/false astpbx
usermod --append -G astpbx astpbx
groupadd -r -g 502 protected
useradd -r -u 502 -g protected -M -c "Used by astbss.com" -s /bin/false protected
usermod --append -G protected protected


apt-get update -qq
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
    autoconf \
    binutils-dev \
    build-essential \
    ca-certificates \
    curl \
    file \
    libcurl4-openssl-dev \
    libedit-dev \
    libgsm1-dev \
    libogg-dev \
    libpopt-dev \
    libresample1-dev \
    libspandsp-dev \
    libspeex-dev \
    libspeexdsp-dev \
    libsqlite3-dev \
    libsrtp2-dev \
    libssl-dev \
    libvorbis-dev \
    libxml2-dev \
    libxslt1-dev \
    procps \
    portaudio19-dev \
    unixodbc \
    unixodbc-bin \
    unixodbc-dev \
    odbcinst \
    uuid \
    uuid-dev \
    xmlstarlet


apt-get purge -y --auto-remove
rm -rf /var/lib/apt/lists/*



mkdir -p /usr/src/asterisk
cd /usr/src/asterisk

curl -vsL http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${ASTERISK_VERSION}.tar.gz | tar --strip-components 1 -xz || \
curl -vsL http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz | tar --strip-components 1 -xz || \
curl -vsL http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-${ASTERISK_VERSION}.tar.gz | tar --strip-components 1 -xz

# 1.5 jobs per core works out okay
: ${JOBS:=$(( $(nproc) + $(nproc) / 2 ))}

./configure --with-resample \
            --with-pjproject-bundled \
            --with-jansson-bundled
make menuselect/menuselect menuselect-tree menuselect.makeopts

# disable BUILD_NATIVE to avoid platform issues
menuselect/menuselect --disable BUILD_NATIVE menuselect.makeopts

# enable good things
menuselect/menuselect --enable BETTER_BACKTRACES menuselect.makeopts

# enable ooh323
# menuselect/menuselect --enable chan_ooh323 menuselect.makeopts

# Support Level: deprecated, Replaced by: app_stack (GoSub)
# We are still using macros
menuselect/menuselect --enable app_macro menuselect.makeopts

# codecs
# menuselect/menuselect --enable codec_opus menuselect.makeopts
# menuselect/menuselect --enable codec_silk menuselect.makeopts

# # download more sounds
# for i in CORE-SOUNDS-EN MOH-OPSOUND EXTRA-SOUNDS-EN; do
#     for j in ULAW ALAW G722 GSM SLN16; do
#         menuselect/menuselect --enable $i-$j menuselect.makeopts
#     done
# done

# we don't need any sounds in docker, they will be mounted as volume
menuselect/menuselect --disable-category MENUSELECT_CORE_SOUNDS menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_MOH menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_EXTRA_SOUNDS menuselect.makeopts

# Ibix choices
menuselect/menuselect --enable cdr_csv menuselect.makeopts
menuselect/menuselect --enable format_mp3 menuselect.makeopts
menuselect/menuselect --enable res_config_mysql menuselect.makeopts
menuselect/menuselect --enable app_mysql menuselect.makeopts
# menuselect/menuselect --enable cdr_mysql menuselect.makeopts

menuselect/menuselect --enable app_dahdibarge menuselect.makeopts
menuselect/menuselect --enable app_dahdiras menuselect.makeopts
menuselect/menuselect --enable chan_dahdi menuselect.makeopts
menuselect/menuselect --enable codec_dahdi menuselect.makeopts

# Added 2018-07-09 for asterisk-certified-13.21-cert2
menuselect/menuselect --enable cdr_odbc menuselect.makeopts
menuselect/menuselect --enable chan_sip menuselect.makeopts
# menuselect/menuselect --enable chan_phone menuselect.makeopts
menuselect/menuselect --enable pbx_realtime menuselect.makeopts
menuselect/menuselect --enable res_pjsip_history menuselect.makeopts

# 'res_pjsip_registrar_expire' not found
# menuselect/menuselect --enable res_pjsip_registrar_expire menuselect.makeopts

menuselect/menuselect --enable app_chanisavail menuselect.makeopts

# format_mp3 - Download MP3 decoder library - Depends on subversion
contrib/scripts/get_mp3_source.sh
menuselect/menuselect --enable app_mp3 menuselect.makeopts


make -j ${JOBS} all
make install

# copy default configs
# cp /usr/src/asterisk/configs/basic-pbx/*.conf /etc/asterisk/
make samples

# set runuser and rungroup
# sed -i -E 's/^;(run)(user|group)/\1\2/' /etc/asterisk/asterisk.conf
# runuser = asterisk              ; The user to run as.
# rungroup = asterisk             ; The group to run as.

# Install opus, for some reason menuselect option above does not working
mkdir -p /usr/src/codecs/opus \
  && cd /usr/src/codecs/opus \
  && curl -vsL http://downloads.digium.com/pub/telephony/codec_opus/${OPUS_CODEC}.tar.gz | tar --strip-components 1 -xz \
  && cp *.so /usr/lib/asterisk/modules/ \
  && cp codec_opus_config-en_US.xml /var/lib/asterisk/documentation/

mkdir -p /etc/asterisk/ \
         /var/spool/asterisk/fax \
         /var/lib/asterisk/sounds

chown -R asterisk:asterisk /etc/asterisk \
                           /var/*/asterisk \
                           /usr/*/asterisk
chmod -R 750 /var/spool/asterisk

cd /
rm -rf /usr/src/asterisk \
       /usr/src/codecs

# remove *-dev packages
devpackages=`dpkg -l|grep '\-dev'|awk '{print $2}'|xargs`
DEBIAN_FRONTEND=noninteractive apt-get --yes purge \
  autoconf \
  build-essential \
  bzip2 \
  cpp \
  m4 \
  make \
  patch \
  perl \
  perl-modules \
  pkg-config \
  xz-utils \
  ${devpackages}

apt-get -y purge subversion
rm -rf /var/lib/apt/lists/*

# Some Ibix folders may be needed. will try to eliminate them in the future
mkdir -p /usr/lib/x86_64-linux-gnu/odbc
mkdir -p /var/astbss/info
mkdir -p /var/astbss/log
mkdir -p /var/log/asterisk/astbss

# exec rm -f /build-asterisk.sh
