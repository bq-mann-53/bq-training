#!/bin/bash

#Part 1

#install and configure Apache2
brew install apache2

#start apache server and work after system reboot
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

#customize the Apache service default webpage
cd /Library/WebServer/Documents    #Default location of file for port 80
sudo nano index.html.en  # file where we write our changes

#We have to edit file
<html><body>
<h1>Welcome to the advanced Linux training module</h1>
<p>Learning by doing is the key to mastery.</p>
<p>Timestamp:<span id="time"></span></p>
</body>
<script language=javascript>
document.getElementById('time').innerHTML = new Date();
</script>
</html>

#print output using webpage
http://localhost:80
#using curl on terminal
curl http://localhost:80

#Part 2

#Configure Apache Server with Ngrok
brew install ngrok
ngrok config add-authtoken 2rcg5aQQRstBVuEZ3diT6ZIrxVQ_6fHeG1hfDwmQG3QpnNFe3    #for authentication
ngrok http http://localhost:80              #to make app online by replacing local ip with public ip

#Send public ip to team member for verification
 https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app
#Second way 
#find out public ip address using https://whatismyipaddress.com/
# my ip 223.236.0.199
# open a login page for router then we add our public and private ip in advances NAT path
# Now we login in directly using private ip and port no
# 192.168.1.25:80 to use it 

#Update timestamp in 2 minutes
#document.getElementById('time').innerHTML = new Date();
#setInterval(myTimer,120000);
#function myTimer(){
 # const val = new Date();
 #var doc = document.createElement('p');
  #doc.innerHTML = "<br>";
  #document.getElementById("time").appendChild(doc);
  #document.getElementById("time").append(val);
#}

#Verify using public ip
https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app

#using curl
curl https://0448-2409-40c4-3010-ae44-978-f6ab-d0c8-edc9.ngrok-free.app
