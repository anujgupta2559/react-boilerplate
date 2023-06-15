FROM amazonlinux:2023

RUN yum update

RUN yum install -y git bzip2 tar dbus-glib wget

# Installing node/npm
RUN wget -sL https://deb.nodesource.com/setup_18.x | bash
RUN yum install -y nodejs

# Installing testing dependencies
RUN npm install -g pm2
RUN npm install -g wait-on

# Installing Java and Maven
RUN wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
RUN mv jdk-13.0.1 /opt/
RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xvf apache-maven-3.6.3-bin.tar.gz
RUN mv apache-maven-3.6.3 /opt/

# Installing Google Chrome
RUN curl https://intoli.com/install-google-chrome.sh | bash

# Instaling Firefox
RUN wget https://ftp.mozilla.org/pub/firefox/releases/112.0/linux-x86_64/en-US/firefox-112.0.tar.bz2
RUN tar xvjf firefox-112.0.tar.bz2 -C /usr/local
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox