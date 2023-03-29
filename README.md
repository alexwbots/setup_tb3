# setup_tb3

http://wiki.ros.org/melodic/Installation/Ubuntu

Install ROS-BASE
```
sudo apt-get install ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc ros-noetic-rgbd-launch ros-noetic-rosserial-arduino ros-noetic-rosserial-python ros-noetic-rosserial-client ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers
```

```
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
```

```
sudo apt install ros-noetic-usb-cam ros-noetic-visp ros-noetic-visp-auto-tracker ros-noetic-image-view
```

Revisar esto para flashear el opencr:
https://emanual.robotis.com/docs/en/platform/turtlebot3/opencr_setup/

Agregar en el .bashrc:
```
source /opt/ros/noetic/setup.bash

export TURTLEBOT3_MODEL=burger
export PC_IP=$(hostname -I | awk '{print $1}')
export ROS_MASTER_URI=http://${PC_IP}:11311
export ROS_HOSTNAME=${PC_IP}
```
Permisos ssh:
```
sudo apt install openssh-server
sudo systemctl enable ssh
sudo reboot
```

Permisos usb:
```
sudo usermod -a -G dialout $USER
sudo chmod a+rw /dev/ttyACM0
```

Configuración de internet:

```
sudo nano /etc/network/interfaces
```
Copiamos el siguiente código:
```
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```
Luego:
```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```
Copiamos el siguiente código:
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="Turtlemodem"
  psk="turtlemodem"
  key_mgmt=WPA-PSK
}
```
