FROM ubuntu
LABEL maintainer="xx"
USER root
RUN apt-get update -y && apt-get install -y wget
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt update -y
RUN apt install jenkins -y
RUN systemctl stop jenkins.service
RUN systemctl start jenkins.service
RUN systemctl enable jenkins.service
ENTRYPOINT ["/var/lib/jenkins","-g","daemon off;"]
EXPOSE 8080
USER jenkins
ENV JENKINS_HOME /var/lib/jenkins
CMD /usr/bin/java -jar /usr/share/jenkins/jenkins.war
CMD cat /var/lib/jenkins/secrets/initialAdminPassword
