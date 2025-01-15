#!/bin/bash

#Part 1

#install and configure Apache2
brew install apache2

#start apache server and work after system reboot
#sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

#customize the Apache service default webpage
echo "betaque@123" | sudo -S bash -c 'cat <<EOF > /opt/homebrew/var/www/index.html    #Default location of file for port 8080
<html><body>
<h1>Welcome to the advanced Linux training module</h1>
<p>Learning by doing is the key to mastery.</p>
<p>Timestamp:<span id="time"></span></p>
</body>
<script language=javascript>
document.getElementById('time').innerHTML = new Date();
</script>
</html>
EOF'

#print output using webpage
#http://localhost:80
#using curl on terminal
curl http://localhost:80

#Part 2

#Configure Apache Server with Ngrok
brew install ngrok
ngrok config add-authtoken 2rcg5aQQRstBVuEZ3diT6ZIrxVQ_6fHeG1hfDwmQG3QpnNFe3    #for authentication
ngrok http http://localhost:80              #to make app online by replacing local ip with public ip

#Send public ip to team member for verification
# https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app

# Second way
#find public ip address using whatismyip website
# when we write public id to browser it will open a new admin page from where we do port forwarding
# Last we use that ip so open file to other users.

#Third way using firewall in ubuntu
# sudo apt install firewalld
# sudo systemctl start firewalld
# sudo systemctl status firewalld
# sudo firewall-cmd --permanent --add-port=80/tcp
# sudo firewall-cmd --reload
# sudo -4 ifconfig.me

# test using curl
# curl 54.90.166.9:80

#Update timestamp in 2 minutes using crontab
#crontab -e
#i
#*/2 * * * * /Users/mac/script.sh
#esc
#ZZ

# script.sh file
#cat <<EOF echo "$(date) <br>" >> /opt/homebrew/var/www/index.html
#EOF


#Verify using public ip
#https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app

#using curl
curl https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app
