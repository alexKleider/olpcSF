# File: transfer.sh

# To be run once the Rachel Content is mounted at /mnt/Rachel and
# /var/www/rachel directory exists

rsync -av --delete /mnt/Rachel/ /var/www/rachel/
# cp /etc/fstab.original /etc/fstab

# The presence of the 
# "LABEL=Rachel /mnt/Rachel ext4 nofail 0 0"
# line in /etc/fstab makes it easy to provide updates to the content,
# so we keep the modified fstab file as is.

