# File: transfer.sh

# To be run once the Rachel Content is mounted at /mnt/1/Rachel and
# /var/www/rachel directory exists

rsync -av /mnt/1/Rachel/ /var/www/rachel/
