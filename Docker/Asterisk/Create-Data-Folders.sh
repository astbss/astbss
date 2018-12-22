#!/bin/bash

mkdir -p /var/docpbx1/etc_asterisk
mkdir -p /var/docpbx1/lib_asterisk
mkdir -p /var/docpbx1/spool_asterisk
mkdir -p /var/docpbx1/agi-bin
mkdir -p /var/docpbx1/db_data

cd /var/docpbx1
if [ ! -d /var/docpbx1/astpbx ]; then
  svn checkout http://svn.astbss.com/svn7/pbx/trunk13 astpbx --username=root --password pbx2009 --no-auth-cache
  echo "Checkout astpbx"
else
  svn update --username=root --password pbx2009 --no-auth-cache
  echo "Updated astpbx"
fi

if [ ! -d /var/docpbx1/astpbx/uptodate ]; then
  svn checkout http://svn.astbss.com/svn7/pbx/uptodate --username=root --password pbx2009 --no-auth-cache
  echo "Checkout astpbx/uptodate"
else
  cd /var/docpbx1/astpbx/uptodate
  svn update --username=root --password pbx2009 --no-auth-cache
  echo "Updated astpbx/uptodate"
fi

ls -lah /var/docpbx1
