#!/bin/bash

echo '### DOCKER SETUP'

yum remove  -y docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2 nfs-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install docker-ce -y

systemctl enable docker

systemctl restart docker

mkdir -p /data/jenkins_home

echo '[Unit]
Description=Jenkins
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
RestartSec=30s
ExecStartPre=-/usr/bin/docker kill jenkins
ExecStartPre=-/usr/bin/docker rm jenkins
ExecStartPre=/usr/bin/docker pull jenkins/jenkins:lts-alpine
ExecStart=/usr/bin/docker run \
          --name jenkins \
          -p 8080:8080 \
          -p 50000:50000 \
          -v /data/jenkins_home:/var/jenkins_home \
          jenkins/jenkins:lts-alpine
ExecStop=/usr/bin/docker stop jenkins

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/jenkins.service

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins