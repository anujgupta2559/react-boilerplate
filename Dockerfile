FROM linuxmintd/mint20.3-amd64

RUN apt update

RUN apt install -y curl

# Installing node and npm
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash
RUN apt install -y nodejs
RUN apt install -y wget

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
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
RUN apt update
RUN apt install -y google-chrome-stable

# Instaling Firefox
RUN wget https://ftp.mozilla.org/pub/firefox/releases/112.0/linux-x86_64/en-US/firefox-112.0.tar.bz2
RUN tar xjf firefox-112.0.tar.bz2
RUN mv firefox /opt
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox

WORKDIR /myapp
COPY package.json .
COPY . .
# RUN npm i