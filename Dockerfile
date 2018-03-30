FROM ubuntu
LABEL maintainer="xx"
RUN sudo apt update && sudo apt dist-upgrade && sudo apt autoremove
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sudo sh -c "echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/Jenkins.list"
RUN sudo apt update
RUN sudo apt install jenkins
RUN sudo systemctl stop jenkins.service
RUN sudo systemctl start jenkins.service
RUN sudo systemctl enable jenkins.service
CMD cat /var/lib/jenkins/secrets/initialAdminPassword
ENTRYPOINT ["/var/lib/jenkins","-g","daemon off;"]
EXPOSE 8080
