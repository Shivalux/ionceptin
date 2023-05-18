# !/bin/bash

echo $USERNAME;
useradd $USERNAME;
passwd $USERNAME << EOF
$PASSWORD
$PASSWORD
EOF
mkdir -p /home/sharnvon/ftp;
chown sharnvon:sharnvon /home/sharnvon;
chown nobody:nogroup /home/sharnvon/ftp;
chmod 777 /home/sharnvon/ftp
echo $USERNAME | tee -a /etc/vsftpd.userlist;
echo $USERNAME | tee -a /etc/vsftpd.chroot_list;
service vsftpd status;
vsftpd /etc/vsftpd.conf;
