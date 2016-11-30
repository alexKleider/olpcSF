# File: create_server.sh

# File last modified Sun Nov 27 22:17:21 PST 2016

# Before sourcing this file:
#  1: be sure it and it's dependencies are in the cwd.
#  2: have a look at hostapd.conf and modify accordingly, ESPECIALLY
#  if you plan to have more than one server operating within range
#  of each other.
#  This applies to SSID and, less critically, to the channel (6, 1, 11)
#  you plan to use.  I have been making the SSID match the hostname.

# First check that you haven't already sourced this file:

# File: testif.sh

# Test if statement regarding '...original' files.

fname='/etc/default/hostapd.original';
afirmative='yes'
if [[ -e $fname ]]; then
    echo "File with the name $fname exists."
    echo "This indicates that this script has already been run."
    echo "Are you sure you want to go ahead? Best not to!!"

    read answer 
    if [[ $answer = $afirmative ]]; then
        echo Answer provided is $answer
        echo "OK, if you say so we will go ahead!"
    else
        echo "Answer provided is ${answer} which is not ${afirmative}, so aborting."
    fi
else
    echo "File called $fname not present so safe to proceed."

# The rest of the script is with in this 'else' segment.

# Rename originals and then copy over the following:
mv /etc/default/hostapd /etc/default/hostapd.original
cp hostapd /etc/default/hostapd
# mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.original
cp hostapd.conf /etc/hostapd/hostapd.conf
mv /etc/network/interfaces /etc/network/interfaces.original
cp interfaces.tanz /etc/network/interfaces.tanz
cp interfaces.static /etc/network/interfaces.static
cp working-interfaces /etc/network/interfaces
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.original
cp dnsmasq.conf /etc/dnsmasq.conf
echo "10.10.10.10  library library.lan rachel rachel.lan" >> /etc/hosts
# Modify /etc/sysctl.conf: uncomment net.ipv4.ip_forward=1
sed -i -r "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g" /etc/sysctl.conf
# echo "Setting up the firewall rules."
# If an error concerning firewall (iptables) comes up, it's probably
# because there was no reboot after raspi-config or update.sh.
source firewall.sh
echo "The firewall rules just set and about to be saved are:"
iptables -t nat -S
iptables -S
source save.sh

# Prepare a mount point for the Rachel Content
mkdir /mnt/Rachel
chown pi:pi /mnt/Rachel
# The entry 
# 10.10.10.10  library.lan rachel.lan
# in /etc/hosts will direct wifi dhcp clients to server.
# The ultimate goal is to have
#               library.lan directed to pathagar book server
#           and rachel.lan directed to rachel content server.

# The following two directories are created to host content:
# one for the rachel content server and the other for the
# pathagar book server.
mkdir /var/www/rachel
mkdir /var/www/library
chown pi:pi /var/www/rachel
chown pi:pi /var/www/library
# If get an error about resolving host name, check that the correct
# host name appears in /etc/hosts: 127.0.1.1 <hostname>.
# The first prepares the scene for moving Rachel content onto
# the server with a command similar to the following:

# IF the Rachel site is mounted at /mnt/Rachel, the following line
# can be uncommented.
# rsync -av /mnt/Rachel/ /var/www/rachel/
# Find this command in transfer.sh which can be sourced.

# Server set up:
cp rachel-site /etc/apache2/sites-available/rachel.conf
#  cp library-site /etc/apache2/sites-available/library.conf

# The following copies an index.html file and gets the site running
# thus providing an opportunity to test that all is well before
# copying over the Rachel Content:
cp index.html /var/www/rachel/
a2ensite rachel
service apache2 reload
# Not sure why but may get the following error:
#Warning: Unit file of apache2.service changed on disk, 'systemctl
#daemon-reload' recommended.
#  A reboot will likely solve the problem.

# At this point, expect that the test site will be visible at
# rachel.lan.  Will still need to replace test site index.html
# with the full Rachel Content.

# Assuming the Rachel Content will be provided on an ext4 formatted
# USB device with LABEL=Rachel, then the following will cause it to
# be automatically mounted:
cp /etc/fstab /etc/fstab.original
echo "LABEL=Rachel /mnt/Rachel ext4 defaults 0 0" >> /etc/fstab

echo "   |vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv|"
echo "   | Might get an error:                       |"
echo "   | Warning: Unit file of apache2.service ... |"
echo "   |                                           |"
echo "   | A reboot will probably fix everything.    |"
echo "   |^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"


echo "   |vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv|"
echo "   | Before the next reboot be sure to either  |"
echo "   | 1. have attached media with LABEL=Rachel. |"
echo "   | OR                                        |"
echo "   | 2. run the clean_fstab.sh script.         |"
echo "   |                                           |"
echo "   | The transfer.sh script assumes (1) and    |"
echo "   | performs (2) for you.                     |"
echo "   |^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^|"

fi
