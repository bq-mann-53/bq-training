#!/bin/bash

#created a file
touch linux.txt

#Enter content
echo "Welcome to the Linux world">linux.txt

#Create another file
touch linux.txt

#Print the current file permissions
ls -l linux.txt

#Change file permissions
chmod 600 linux.txt

#Again print the file permissions
ls -l linux.txt

#Changed file name to linuxworld.txt
mv linux.txt linuxworld.txt

#Switch to root user
echo "$pass" | sudo -S

#install apache2 server
brew install apache2


#start apache2 server
echo "$pass" | sudo -S apachectl start

#check current user
whoami

#curl to apache and print output
curl http://127.0.0.1:8080

#Apache run even the system gets rebooted
brew services start apache2
