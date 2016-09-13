# Source this file after installing raspbian and running raspi-config. 
# See config_howto

# Last updated Sat Feb 27 18:13:27 PST 2016
echo "updating, upgrading and installing more software....."
echo "You will be asked to confirm various steps along the way"
echo "so keep checking the screen to see if it is waiting for you."
echo "---------------- The above is ....  ----------------------"
echo "Not necessary since I've discovered the apt-get -y option."
date && apt-get -y update && apt-get -y upgrade && date
echo "Just finished updating and upgrading."
apt-get -y install iw hostapd dnsmasq apache2
# I have found that the following do not need to be installed:
# apt-get -y install python-m2crypto curl unzip php5 python-psutil

# If planning to use Pathagar, the following dependencies must be
# installed to circumnavigate missing mysql_config
#apt-get -y install libmysqlclient-dev libxml1-dev libxslt2-dev
apt-get -y install virtualenv fabric
apt-get -y install libmysqlclient-dev python-dev
apt-get -y install libxml2-dev libxslt1-dev

# The following are not essential for proper functioning
# of the server but they make my life better.
apt-get -y install vim vim-scripts git dnsutils screen
# The following are only for those who use vim and like my vim defaults.
cp .vimrc /root/
cp .vimrc /home/pi/

#Notes from Andi re Pathagar:
#1. clone this repo:
#    git clone https://github.com/PathagarBooks/pathagar.git
#2. install the following packages to circumnavigate missing mysql_config
#errors and missing libxml/xmlversion.h errors:
#    sudo apt-get install libmysqlclient-dev
#    apt-get install libxml2-dev libxslt1-dev python-dev
#3. run
#    sudo pip install -r requirements.pip
#  inside the pathagar directory
#and it finished fine.
#Andi

