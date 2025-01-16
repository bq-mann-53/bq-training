#!/bin/bash

#Part 1

#install and configure Apache2
echo "$pass" | sudo -S apt install apache2

#start apache server and work after system reboot
#sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

#customize the Apache service default webpage
cat '<<EOF > /var/www/html/index.html    
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

#Configure Apache Server using firewall in ubuntu

echo "$pass" | sudo -S apt install firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
sudo -4 ifconfig.me

# test public ip using curl
curl 54.90.166.9:80

#Create new file name script.sh for Timestamp
cat '<<EOF > /Users/mac/script.sh
echo "$(date) <br>" >> /var/www/html/index.html
EOF'

# Update Timestamp after 2 minutes using crontab
(crontab -l 2>/dev/null; echo "*/2 * * * * /Users/mac/script.sh") | crontab -

# test using curl
curl 54.90.166.9:80

# Using browser 
# http://54.90.166.9.80
