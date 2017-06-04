#!/usr/bin/env bash

# Install prerequisites
yum install yum-utils \
	yum-config-manager \
	device-mapper-persistent-data \
	epel-release \
	lvm2 -y 

# Add up to date docker repository
yum-config-manager \
	--add-repo \
	https://download.docker.com/linux/centos/docker-ce.repo

yum makecache fast -y

yum install python2-pip -y

# Ansible docker module dependency
pip install docker-py
