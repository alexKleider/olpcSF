echo "You are about to execute some configuration commands meant"
echo "to prepare a freshely imaged XO laptop for Madagascar."
echo "It loads Hanta's books into the laptop's library"
echo "It also adds biblio 10.10.10.10 in /etc/hosts (RachelPi)"
echo "  "
echo "This script must be run as root so "
echo "YOUR PROMPT SHOULD BE '#', not '$'."
echo "The script you will be running and the data you will be using"
echo "are on a USB stick that should be already plugged into your XO and"
echo "you should have by now 'cd'ed into the directory of that USB stick."
echo "If all seems to be in order:"
echo "y to continue, anything else to abort."
read -n 1 c
echo
if [[ $c == "y" ]]
then
  echo "Let us do it!"
else
  echo "Good to abort if you don't know what you are doing!"
  exit
fi
echo
echo "Now we begin the work!"
echo "##########################################"
unzip ./madabooks.zip -d /home/olpc/Library/
/usr/share/library-common/make_index.py
echo '10.10.10.10     biblio' >> /etc/hosts
echo "##########################################"
echo "That is all: I hope it went well."
echo "You might want to quit 'teminal',"
echo "                  reset the main page from list to spiral format,"
echo "              and go into the Browse activity."
echo "Hanta's Malagasy books will now be available to you after "
echo "clicking the 'Books' option on the left."
echo "If the a content server is operational, you can connect to it "
echo "by entering 'biblio' into the browser's URL window."
