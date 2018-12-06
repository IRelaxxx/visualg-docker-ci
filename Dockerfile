# Ubuntu 18.04
# newest OpenJDK and OpenJFX
# Maven 3.3.9

FROM ubuntu:18.04

#Forked from kaiwinter/docker-java8-maven(https://github.com/kaiwinter/docker-java8-maven)
LABEL maintainer="Alexander Krahl (https://github.com/IRelaxxx)"

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive

# update dpkg repositories
RUN apt-get update 

# install wget
RUN apt-get install -y wget

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

# remove download archive files
RUN apt-get clean

# set shell variables for java installation
RUN apt-get install -y openjfx openjdk-8-jdk
RUN apt-get clean

# unpack java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

#Install other stuff
RUN apt-get install -y xvfb libgtk2.0-bin libxtst6 libxslt1.1
RUN apt-get clean

CMD [""]