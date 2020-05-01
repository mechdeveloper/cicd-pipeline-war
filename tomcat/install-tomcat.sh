# Step 1: Install OpenJDK

sudo apt update

sudo apt install default-jdk -y

# Step 2: Create Tomcat User
# First, create a new tomcat group:

sudo groupadd tomcat

# Next, create a new tomcat user. We’ll make this user a member of the tomcat group, 
# with a home directory of /opt/tomcat (where we will install Tomcat), 
# and with a shell of /bin/false (so nobody can log into the account):
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Step 3: Install Tomcat
cd /tmp

curl -O http://mirror.23media.de/apache/tomcat/tomcat-8/v8.5.30/bin/apache-tomcat-8.5.30.tar.gz

sudo mkdir /opt/tomcat

sudo tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1

# Step 4: Update Permissions
cd /opt/tomcat

sudo chgrp -R tomcat /opt/tomcat

sudo chmod -R g+r conf

sudo chmod g+x conf

sudo chown -R tomcat webapps/ work/ temp/ logs/

# Step 5: Create a systemd Service File
# /usr/lib/jvm/java-1.8.0-openjdk-amd64
# JAVA_HOME
# /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre

cp tomcat.service /etc/systemd/system/tomcat.service

cat /etc/systemd/system/tomcat.service 

sudo systemctl daemon-reload

sudo systemctl start tomcat
# sudo systemctl status tomcat

# Step 6: Adjust the Firewall and Test the Tomcat Server
sudo ufw allow 8080

curl http://localhost:8080

sudo systemctl enable tomcat

