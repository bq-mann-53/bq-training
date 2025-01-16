# bq-training-linux-assignment
### Add pass as an environment variable for automatic password
> #### $pass='1234'
### First create a script using nano or any other text editor
> #### nano script.sh
### Create file using touch command named linux.txt
> #### touch linux.txt 
### Enter Content using echo command in new file
> #### echo "Welcome to the Linux world">linux.txt
### Create another file with same name linux.txt using touch
> #### touch linux.txt
### Print the file permissions of current file
> #### ls -l linux.tx
### Change file permission so only owner have permission of read and write.
> #### chmod 600 linux.txt
### Again check the file permission using ls -l file_name
> #### ls -l linux.txt
### Change the current file name to linuxworld.txt
> #### mv linux.txt linuxworld.txt
### Switch to root user using sudo and use using -S so get password automatically using environment variable
> #### echo "$pass" | sudo -S
### Install apache2 server using brew command 
> #### sudo apt install apache2
### Next we start server using sudo and apachectl command and pass password automatically using env variable
> #### echo "$pass" | sudo -S apachectl start
### Check Current user using whoami command
> #### whoami
### Print the output using curl command on terminal
> #### curl http://127.0.0.1:8080 
### Run the apache server again so it will automatically start after system reboot.
> #### sudo services start apache2
### To run this script first give script execute permissions 
> #### chmod +x script.sh
### To run script use
> #### ./script.sh
