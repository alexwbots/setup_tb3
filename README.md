# setup_tb3

http://wiki.ros.org/melodic/Installation/Ubuntu

Install ROS-BASE

sudo apt-get install ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt* ros-melodic-rviz ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers

sudo apt install ros-melodic-dynamixel-sdk ros-melodic-turtlebot3-msgs ros-melodic-turtlebot3

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
