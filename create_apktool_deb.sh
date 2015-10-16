#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root! (ie. sudo thisscript.sh)"
    exit 1
fi

APKTOOL_VERSION=2.0.2
PACKAGE_VERSION=ubuntu1

chown root.root apktool_tmp/opt/apktool/*
chown root.root apktool_tmp/usr/share/applications/apktool.desktop
chmod 755 apktool_tmp/usr/share/applications/apktool.desktop
chmod 755 apktool_tmp/opt/apktool/apktool.desktop
chmod 755 apktool_tmp/opt/apktool/apktool
chmod 644 apktool_tmp/opt/apktool/apktool.jar
chmod 644 apktool_tmp/opt/apktool/apktool_$APKTOOL_VERSION.jar
chmod 644 apktool_tmp/opt/apktool/apktool.png

dpkg-deb -b apktool_tmp apktool-$APKTOOL_VERSION-$PACKAGE_VERSION.deb

