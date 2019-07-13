# Ubuntu 18.04
# OpenJDK11 and OpenJFX11
# Maven 3.3.9

FROM ubuntu:18.04

#Forked from kaiwinter/docker-java8-maven(https://github.com/kaiwinter/docker-java8-maven)
LABEL maintainer="Alexander Krahl (https://github.com/IRelaxxx)"

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive

# update dpkg repositories
RUN apt-get update 

# install wget
RUN apt-get install -y wget && apt-get clean

# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

# verify checksum
RUN echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven-3.3.9.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven

# set shell variables for java installation
RUN apt-get install -y openjfx=11.0.2+1-1~18.04.2 openjdk-11-jdk=11.0.3+7-1ubuntu2~18.04.1 && apt-get clean

# Setup java
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

#Install Xvfbv and JavaFX Dependencies
RUN apt-get install -y xvfb libgtk2.0-bin libxtst6 libxslt1.1 && apt-get clean 

CMD [""]