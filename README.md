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


Agregar en el .bashrc:
```
source /opt/ros/melodic/setup.bash

export TURTLEBOT3_MODEL=burger
export ROS_MASTER_URI=http://192.168.1.100:11311
export ROS_HOSTNAME=192.168.1.101
```
Permisos ssh:
```
sudo systemctl enable ssh
sudo reboot
```

Permisos usb:
```
sudo usermod -a -G dialout $USER
sudo chmod a+rw /dev/ttyACM0
```
