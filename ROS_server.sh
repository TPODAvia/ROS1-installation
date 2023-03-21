# cheasheet for git
#       git config --global user.name "Your Name"
#       git config --global user.email "youremail@yourdomain.com"

# Note: don't push to the main branche dirrectry
# Use 
#       git checkout -b "new-branch" 
# then 
#       git checkout "main"
#       git merge "new-branch"
# if any conflict appeared
#       git add .
#       git commit

# press
#        ^x
# then
#        "y"
# then
#        enter

# to delete branch
#   git branch -d new-branch

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl -y # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update -y

sudo apt install ros-noetic-ros-base -y

source /opt/ros/noetic/setup.bash

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y

sudo apt install build-essential git python3-pip python3-rosdep -y

sudo apt install python3-rosdep -y

sudo rosdep init
rosdep update
