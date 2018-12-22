# docker build -t astbss/asterisk13:13.17.1 .
# docker run -it --name asterisk13 --rm astbss/asterisk13:13.17.1

FROM debian:stretch
LABEL maintainer="are@astbss.com"


ENV DEBIAN_FRONTEND noninteractive

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        wget nano iproute2 curl \
        bash-completion git subversion less ssh-client sudo unzip vim bzip2 openssh-server

RUN apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        build-essential \
        openssl \
        libxml2-dev \
        libncurses5-dev \
        uuid-dev \
        sqlite3 \
        libsqlite3-dev \
        pkg-config \
        libjansson-dev \
        libssl-dev 

RUN apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php7.0-cli php7.0-mysql php7.0-curl php7.0-mbstring
        
# apt-get install msmtp
# Asterisk expects /usr/sbin/sendmail to send voicemails. msmtp can connect to any smtp server
# RUN ln -s /usr/bin/msmtp /usr/sbin/sendmail

ENV ASTERISK_VERSION 13.17.1 

# wget http://dl.astbss.com/dl/asterisk-13.17.1.tar.gz
# wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-14.5.0.tar.gz
# http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${ASTERISK_VERSION}.tar.gz

RUN cd /usr/src && curl -o asterisk.tar.gz http://dl.astbss.com/dl/asterisk-${ASTERISK_VERSION}.tar.gz \
    && tar xzf asterisk.tar.gz

RUN wget --no-check-certificate  -O /tmp/pjproject-2.6.tar.bz2 http://dl.astbss.com/dl/pjproject-2.6.tar.bz2 \
    && wget --no-check-certificate  -O /tmp/pjproject-2.6.md5 http://dl.astbss.com/dl/pjproject-2.6.md5
  
WORKDIR /usr/src/asterisk-${ASTERISK_VERSION}

# Download MP3 decoder library
RUN contrib/scripts/get_mp3_source.sh

RUN ./configure --with-pjproject-bundled 
    
# Remove the native build option to prevent CPU optimise on Docker, EC2 and different VM
RUN make menuselect.makeopts \
  && menuselect/menuselect --disable BUILD_NATIVE \
    menuselect.makeopts \
  && menuselect/menuselect \
    --enable cdr_csv \
    --enable format_mp3 \
    --enable res_config_mysql \
    --enable app_mysql \
    --enable EXTRA-SOUNDS-EN-GSM \
    --enable cdr_odbc \
    --enable chan_sip \
    --enable pbx_realtime \
    --enable res_pjsip_history \
    --enable res_pjsip_registrar_expire \
    --enable app_chanisavail \
    --enable app_mp3 \
    menuselect.makeopts
    
RUN make \
    && make install

WORKDIR /

# Start cleaning up    
#RUN rm -f /tmp/pjproject* \
#    && rm -f /usr/src/asterisk.tar.gz \
#    && rm -rf /usr/src/asterisk-${ASTERISK_VERSION}

# Update max number of open files.
RUN sed -i -e 's/# MAXFILES=/MAXFILES=/' /usr/sbin/safe_asterisk \
    && sed -i 's/TTY=9/TTY=/g' /usr/sbin/safe_asterisk \
    && cp /usr/lib/php/7.0/php.ini-development /etc/php/7.0/cli/php.ini
 
    
# CMD asterisk -fvvv
# CMD /usr/sbin/safe_asterisk
