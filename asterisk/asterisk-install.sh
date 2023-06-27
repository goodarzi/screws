#!/usr/bin/env bash 
set -e
set -x

cd /usr/src/
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
tar -xvf asterisk-20-current.tar.gz 

cd asterisk-2*/contrib/scripts/ && \
apt install aptitude && \
./install_prereq test && \
./install_prereq install

cd ../.. && ./configure && make menuselect.makeopts && make install && install-logrotate 

# groupadd --system asterisk
# useradd -s /sbin/nologin --system -g asterisk asterisk

# chown -R asterisk:asterisk /etc/asterisk
# chown -R asterisk:asterisk /run/asterisk
# chown -R asterisk:asterisk /usr/sbin/asterisk
# chown -R asterisk:asterisk /usr/lib/asterisk
# chown -R asterisk:asterisk /var/cache/asterisk
# chown -R asterisk:asterisk /var/log/asterisk
# chown -R asterisk:asterisk /var/spool/asterisk
# chown -R asterisk:asterisk /var/lib/asterisk


