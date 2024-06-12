#!/bin/bash

# This script will setup my personal files and libraries on a new Ubuntu machine
#! Install this file in the home directory

# Update the system
echo "Updating the System"
sudo apt-get update
sudo apt-get upgrade

# Install the necessary system packages
echo "Installing system packages"
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt install python3-pip

# Install VS Code
echo "Installing VS Code"
sudo snap install --classic code

# Install MySQL
echo "Installing MySQL server and MySQL Workbench"
sudo apt install mysql-server-8.0
sudo systemctl start mysql.service
sudo snap install mysql-workbench-community

# Install GitHub Desktop
echo "Installing GitHub Desktop"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/kontr0x/github-desktop-install/main/installGitHubDesktop.sh)"

# Export .local bin directory to the PATH
export PATH=$PATH:/home/student/.local/bin

# Install the necessary python packages
echo "Installing python packages"
pip install streamlit
pip install mysql-connector-python

# Clone repositories
echo "Cloning ITM111 Grading Repository"
cd Desktop/
git clone https://github.com/NicholasBoss/itm111grading
cd

# Create some new aliases and add them to the .bashrc file
echo "Creating new aliases"
echo "" >> .bashrc
echo "# Personal Aliases" >> .bashrc
echo "alias vi='vim'" >> .bashrc
echo "alias python='python3'" >> .bashrc
echo "alias move='mv /home/student/Downloads/*.sql /home/student/Desktop/itm111grading/v1/tempgrades/'" >> .bashrc
echo "alias check_temp='ls /home/student/Desktop/itm111grading/v1/tempgrades/'" >> .bashrc
echo "" >> .bashrc

# Create a new alias for the grading script
echo "alias run6='python /home/student/Desktop/itm111grading/v1/week06hw_v1_check.py'" >> .bashrc
echo "alias run7='python /home/student/Desktop/itm111grading/v1/week07hw_v1_check.py'" >> .bashrc
echo "alias run8='python /home/student/Desktop/itm111grading/v1/week08hw_v1_check.py'" >> .bashrc
echo "alias run9='python /home/student/Desktop/itm111grading/v1/week09hw_v1_check.py'" >> .bashrc
echo "alias run10='python /home/student/Desktop/itm111grading/v1/week10hw_v1_check.py'" >> .bashrc
echo "alias run11='python /home/student/Desktop/itm111grading/v1/week11hw_v1_check.py'" >> .bashrc
echo "alias run12='python /home/student/Desktop/itm111grading/v1/week12hw_v1_check.py'" >> .bashrc

# Source the .bashrc file
source .bashrc

echo "Basic Setup Complete"

echo "Please run the following commands to complete the setup for MySQL:"
echo "1. sudo mysql. This will open the MySQL shell. Run the following commands:"
echo "   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'C4nGet1n!';"
echo "Close the MySQL shell by typing 'quit;'."
echo "2. sudo mysql_secure_installation. Follow the prompts to secure the MySQL installation."
echo "3. mysql -u root -p. Enter the password you set in step 1 to login to the MySQL shell."
echo "   Run the following commands:"
echo "      GRANT ALL ON *.* TO 'root'@'localhost';"
echo "      CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';"

echo "Setup Complete"