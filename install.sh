#!/bin/sh

#
# INSTALLS
#

# update
pacman -Syu --noconfirm

# install packages
pacman -S --noconfirm nginx vim postgresql redis composer base-devel git wget yajl
pacman -S --noconfirm php php-fpm php-gd php-intl php-pgsql php-sqlite php-xsl php-geoip php-redis

#
# CONFIGURE
#

# add user "webserver"
useradd -m webserver

# postgresql
usermod -d /home/postgres postgres
mkdir /home/postgres && chown -R postgres:postgres /home/postgres
su - postgres -c "initdb --locale ru_RU.UTF-8 -E UTF8 -D '/home/postgres/data'"
