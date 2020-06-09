# To create this file I leveraged a live interactive terminal in docker using the OL8 distrobution
# I installed nano and copied teh below files into a bootstrap file
# nano bootstrap.sh
# ctrl + o to save
# ctrl + x to exit
# chmod +x bootstrap.sh
# sh bootstrap.sh to run file.


dnf -y update
dnf -y install @postgresql sudo
mkdir  /backups
chown -R postgres /backups
