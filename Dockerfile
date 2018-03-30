FROM ubuntu
LABEL maintainer="xx"
RUN apt update && apt dist-upgrade && apt autoremove
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c "echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/Jenkins.list"
RUN apt update
RUN apt install jenkins
RUN systemctl stop jenkins.service
RUN systemctl start jenkins.service
RUN systemctl enable jenkins.service
CMD cat /var/lib/jenkins/secrets/initialAdminPassword
ENTRYPOINT ["/var/lib/jenkins","-g","daemon off;"]
EXPOSE 8080
