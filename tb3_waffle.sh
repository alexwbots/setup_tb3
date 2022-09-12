echo "1. Installing ROS Noetic"
sudo apt updatesudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-ros-base
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update

echo "2. Installing ROS packages for tb3"
sudo apt-get install ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
  ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
  ros-noetic-rosserial-python ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
  ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers \
  ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3 \
  ros-noetic-usb-cam ros-noetic-visp ros-noetic-visp-auto-tracker ros-noetic-image-view \
  ros-noetic-hls-lfcd-lds-driver
  
echo "3. Parameters for tb3"
echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc
source ~/.bashrc

echo "4. Permissions for USB"
echo ""
echo "This script copies a udev rule to /etc to facilitate bringing"
echo "up the turtlebot3 usb connection."
echo ""
sudo cp `rospack find turtlebot3_bringup`/99-turtlebot3-cdc.rules /etc/udev/rules.d/
echo ""
echo "Reload rules"
echo ""
sudo udevadm control --reload-rules
sudo udevadm trigger

echo "5. Permissions for automatic internet connection"
echo "allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf">>/etc/network/interfaces
echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
echo \"network={ 
  ssid=\"ALEXANDER.-1\"
  psk=\"norecuerdo\"
  key_mgmt=WPA-PSK 
}">>/etc/wpa_supplicant/wpa_supplicant.conf

echo "6. Permissions for SSH"
#sudo apt install openssh-server
#sudo systemctl enable ssh
#sudo reboot
