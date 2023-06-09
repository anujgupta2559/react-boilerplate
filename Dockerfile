FROM amazonlinux:2023

RUN yum update
RUN yum install -y git
RUN yum install -y tar
RUN yum install -y wget
RUN yum install -y nodejs
RUN wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
RUN mv jdk-13.0.1 /opt/
RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xvf apache-maven-3.6.3-bin.tar.gz
RUN mv apache-maven-3.6.3 /opt/
# RUN PATH="/opt/jdk-13.0.1/bin:/opt/apache-maven-3.6.3/bin:$PATH"
RUN curl https://intoli.com/install-google-chrome.sh | bash
RUN mv /usr/bin/google-chrome-stable /usr/bin/google-chrome