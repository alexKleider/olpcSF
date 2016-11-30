# File: clean_fstab.sh

# Get's rid of the 
# "LABEL=Rachel /mnt/Rachel ext4 defaults 0 0"
# line in /etc/fstab.


cp /etc/fstab.original /etc/fstab

# The presence of the 
# "LABEL=Rachel /mnt/Rachel ext4 defaults 0 0"
# line in /etc/fstab makes it boot into 'emergency mode' 
# unless medium with this label is on line.

