# Run this script on the Docker host (not in a container!!!!)

## Update & install Docker
# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Upgrade drivers & firmware
sudo rpi-update

# Make sure that the Pi Camera is accessable true /dev/video0 after a reboot
sudo sed -i -e /'exit 0'/d /etc/rc.local
echo 'sudo modprobe bcm2835-v4l2' | sudo tee --append /etc/rc.local
echo 'exit 0' | sudo tee --append /etc/rc.local

# sudo apt-get install -y docker.io
if [ "$(systemctl is-active docker)" = "inactive" ]; then curl -fsSL get.docker.com | sh && sudo usermod -aG docker ${USER} ; fi


## Enable none root access to Docker
# Add the docker group if it's not already created
#sudo groupadd docker

# Add user PI to the Docker group
#sudo gpasswd -a ${USER} docker

# Restart Docker service
#sudo service docker restart

# Pull Raspbian Jessie to check if Docker is running okay
# sudo docker pull raspbian/jessie

# Chekck if the image has been pulled correctly
# Their should be 2 images remonlam/rpi-rasbian:jessie and ...:latest
# sudo docker images

# Remove the image
# sudo docker rmi remonlam/rpi-rasbian:latest
# sudo docker rmi remonlam/rpi-rasbian:jessie

# Create directory for Dockerfile
mkdir -p /home/pi/motion

# Download Dockerfile
wget -P /home/pi/motion https://raw.githubusercontent.com/bizarrelabs/motion/master/Dockerfile

# Run the graphical raspi-conf tool, to setup the host
echo "NOTE: don't forget to turn on the cam ;-) oh and you need to reboot"
sleep 10
sudo raspi-config
