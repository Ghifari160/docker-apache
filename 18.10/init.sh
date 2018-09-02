#!/bin/bash

set -e
set -m

function macOS_fixPerms()
{
  if [ ! -f "/etc/g16/apache_macOS_fix" ]; then
    echo "=============================="
    echo "=  Fixing macOS Permissions  ="
    echo "=============================="

    # Reassign UID and GID in macOS
    usermod -u 1000 www-data
    groupdel staff
    groupmod -g 50 www-data

    # Reconfigure file permissions
    chown -fR www-data:www-data /

    # Store g16 metadata
    mkdir -p /etc/g16
    touch /etc/g16/apache_macOS_fix
    echo "true" > /etc/apache_macOS_fix
  fi
}

if [ "$G16_MACOS" = "yes" ]; then
  macOS_fixPerms
fi

echo "=============================="
echo "=      Staring Apache2       ="
echo "=============================="
exec /usr/sbin/apachectl -D FOREGROUND
echo "=============================="
echo "=        Ready to Use!       ="
echo "=============================="

fg
