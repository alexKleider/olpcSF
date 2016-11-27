# These lines are in create_server.sh
# so this file: fstab.sh, is only for use on a Pi
# that was updated before addition of these lines.
cp /etc/fstab /etc/fstab.original
echo "LABEL=Rachel /mnt/Rachel ext4 defaults 0 0" >> /etc/fstab


