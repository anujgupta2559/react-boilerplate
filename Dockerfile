# Installing Amazon Linux 2023
FROM amazonlinux:2023

RUN yum update -y

RUN yum install -y git bzip2 tar dbus-glib wget

# Installing node/npm
RUN wget -sL https://deb.nodesource.com/setup_16.x | bash \
    && yum install -y nodejs

# Installing testing dependencies
RUN npm install -g pm2 wait-on

# Installing Java and Maven
RUN wget https://download.java.net/java/GA/jdk20.0.1/b4887098932d415489976708ad6d1a4b/9/GPL/openjdk-20.0.1_linux-x64_bin.tar.gz \
    && tar -xvf openjdk-20.0.1_linux-x64_bin.tar.gz \
    && mv jdk-20.0.1 /opt/ \
    && wget https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz \
    && tar -xvf apache-maven-3.9.2-bin.tar.gz \
    && mv apache-maven-3.9.2 /opt/

# Instaling Firefox
RUN wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64" \
    && tar xvjf FirefoxSetup.tar.bz2 -C /usr/local \
    && ln -s /usr/local/firefox/firefox /usr/bin/firefox