FROM maven:3.6.1-jdk-11

LABEL maintainer="Alexander Krahl (https://github.com/IRelaxxx)"

# update dpkg repositories
RUN apt-get update 

#Install Xvfbv and JavaFX Dependencies
RUN apt-get install -y xvfb libgtk2.0-bin libxtst6 libxslt1.1 && apt-get clean 

CMD [""]