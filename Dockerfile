FROM ubuntu:16.04
LABEL maintainer="xx"
USER root
RUN apt-get update -y && apt-get install -y wget
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update -y && apt-get install -y jenkins
EXPOSE 8080
USER jenkins
ENV JENKINS_HOME /var/lib/jenkins
CMD /usr/bin/java -jar /usr/share/jenkins/jenkins.war
