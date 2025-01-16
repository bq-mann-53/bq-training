# bq-training-apache-server-customization-assignment

## Part 1

### Add pass as an environment variable for automatic password
> #### $pass='1234'
### First create a script file using nano or any other text editor
> #### nano assignment.sh
### Install Apache Service using sudo command 
> #### echo "$pass" | sudo -S apt install apache
### Used load command to make apache2 run even if we rebooted the system.
> #### sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
### Next edit the apache default html code with our code using html and Javascript.
> #### echo "$pass" | sudo -S bash -c 'cat <<EOF > /var/www/html/index.html                                      
> #### <html><body>
> #### <h1>Welcome to the advanced Linux training module</h1>
> #### <p>Learning by doing is the key to mastery.</p>
> #### <p>Timestamp:<span id="time"></span></p>
> #### </body>
> #### <script language=javascript>
> #### document.getElementById('time').innerHTML = new Date();
> #### </script>
> #### </html>
> #### EOF'
### Print output using localhost to get output on browser 
> #### http://localhost:80
### Using curl method to get output on terminal.
> #### curl http://localhost:80

## Part 2

### Configure Apache server publicly using firewalld command.
1. #### Install firewalld using sudo command
   > ##### echo "$pass" | sudo -S apt install firewalld
2. #### Start firewalld using systemctl command 
   > ##### sudo systemctl start firewalld
3. #### Make port 80 publicly accessible 
   > ##### sudo firewall-cmd --permanent --add-port=80/tcp
4. #### Reload the server after port permission changes
   > ##### sudo firewall-cmd --reload
5. #### Find out the public ip address using curl and store it in address variable 
   > ##### address=$(curl -4 ifconfig.me)
### Share public ip with team members for verification.
> #### curl $address
### Update Timestamp using linux crontab command.
1. #### Create a new file name script and add timestamp updation file in it.
   > ##### touch script.sh
   > ##### path=$(pwd script.sh)
   > ##### bash -c 'cat <<EOF > /$path/script.sh
   > ##### echo "$(date) <br>" >> /var/www/html/index.html
   > ##### EOF'
2. #### Use crontab command to run script.sh in 2 minutes
   > ##### (crontab -l 2>/dev/null; echo "*/2 * * * * /$path/script.sh") | crontab -
### Print output using public ip to get output on browser
> #### http://$address
### Print custom message on terminal using curl method
> #### curl $address
### To execute the script give executable permissions to file
> #### chmod +x assignment.sh
### To run the script 
> #### ./assignment.sh
