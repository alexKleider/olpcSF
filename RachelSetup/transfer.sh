# File: transfer.sh

# To be run once the Rachel Content is mounted at /mnt/Rachel and
# /var/www/rachel directory exists

rsync -av /mnt/Rachel/ /var/www/rachel/
cp /etc/fstab.original /etc/fstab

# The presence of the 
# "LABEL=Rachel /mnt/Rachel ext4 defaults 0 0"
# line in /etc/fstab makes it boot into 'emergency mode' 
# so we want to get rid of it before rebooting.

