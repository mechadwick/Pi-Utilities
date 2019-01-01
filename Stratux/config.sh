sudo apt-get update
sudo apt-get upgrade
sudo apt-get install wget git



echo "--------------------------------------"
echo " Adding Public Key for SSH to PI User"
echo "--------------------------------------"
mkdir /home/pi/.ssh/
chmod 700 /home/pi/.ssh/
chown pi:pi /home/pi/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZ8J/COJ4lDg4TO3Yd7qwKwUCPbIX0r3isAHPZULoLyfARYVXY5cYmfNpLz+YPBpqKVhC0GECOXM+TU/sRKxt01eQYA6g9CDVcypAXBiQB1ZZKAh+ZkeFHGuBIntYk0cCeHKWUeI9ZgcwhN3bRAjnOf2YxNt8gXO9P/SM69OaPQ4pB2ogMWAiGViLWSx0gPeyBeLm4TYlafLnFfNkKxMXtvmvJ3l6PIaNa0oJMnATjIGPp8nq8Q9NE0wJ9yU1gczT1Ydx2wf6HAHerK/Trw20iUt1vEsc/GBMTYV7IO/Nxrfq9zsJSc/z8u5X/U2dKg7lmx2F1mHG8iRB8WtJyr+rx Backup-Pi" > /home/pi/.ssh/authorized_keys
chmod 600 /home/pi/.ssh/authorized_keys
chown pi:pi /home/pi/.ssh/authorized_keys


echo " "
echo " "
echo "--------------------------------------"
echo "     Disabling Password Log-on"
echo "--------------------------------------"
sudo grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
sudo service ssh stop
sudo service ssh start




echo " "
echo " "
echo "--------------------------------------"
echo "          Installing Docker"
echo "--------------------------------------"
echo "curl -sSL https://get.docker.com | sh"
curl -sSL https://get.docker.com | sh



echo " "
echo " "
echo "--------------------------------------"
echo "          Installing Stratux"
echo "--------------------------------------"
cd ~
wget https://dl.google.com/go/go1.10.4.linux-armv6l.tar.gz
tar -zxvf go1.10.4.linux-armv6l.tar.gz
git clone --recursive https://github.com/cyoung/stratux
cd stratux
service stratux stop
make
make install
service stratux start
