#!/bin/bash

MIRROR_URL="http://mirror.nsc.liu.se/centos-store/6.4/os/x86_64/"
MIRROR_URL_UPDATES="http://mirror.nsc.liu.se/centos-store/6.4/updates/x86_64/"

yum install -y febootstrap xz

febootstrap -i bash -i coreutils -i tar -i bzip2 -i gzip -i vim-minimal -i wget -i patch -i diffutils -i iproute -i yum centos centos64  $MIRROR_URL -u $MIRROR_URL_UPDATES
touch centos64/etc/resolv.conf
touch centos64/sbin/init

tar --numeric-owner -Jcpf centos-64.tar.xz -C centos64 .
