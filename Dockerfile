# Installing Amazon Linux 2023
FROM amazonlinux:2023

RUN yum update -y

RUN yum install -y git bzip2 gzip tar dbus-glib wget

# Installing node/npm
RUN wget -sL https://deb.nodesource.com/setup_16.x | bash
RUN yum install -y nodejs

# Installing testing dependencies
RUN npm install -g pm2
RUN npm install -g wait-on

# Installing Java and Maven
RUN wget https://download.java.net/java/GA/jdk20.0.1/b4887098932d415489976708ad6d1a4b/9/GPL/openjdk-20.0.1_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-20.0.1_linux-x64_bin.tar.gz
RUN mv jdk-20.0.1 /opt/
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz
RUN tar -xvf apache-maven-3.9.2-bin.tar.gz
RUN mv apache-maven-3.9.2 /opt/

# Installing Google Chrome
RUN curl https://intoli.com/install-google-chrome.sh | bash

# Instaling Firefox
RUN wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64"
RUN tar xvjf FirefoxSetup.tar.bz2 -C /usr/local
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox
