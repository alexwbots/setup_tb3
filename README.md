# setup_tb3

http://wiki.ros.org/melodic/Installation/Ubuntu

Install ROS-BASE
```
sudo apt-get install ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt* ros-melodic-rviz ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers
```

```
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
```

```
sudo apt install ros-melodic-usb-cam ros-melodic-visp ros-melodic-visp-auto-tracker ros-melodic-image-view
```

Revisar esto para flashear el opencr:
https://emanual.robotis.com/docs/en/platform/turtlebot3/opencr_setup/

Agregar en el .bashrc:
```
source /opt/ros/melodic/setup.bash

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
