Jenkins_with_slave_CI_CD
======

This is a production ready implementation of jenkins.

![Pipeline](/_docs/jenkins_with_slave_CI_CD.png?raw=true)

# This repo contains:

* [Dockerfiles](/Dockerfiles): Here you are going to find the Dockerfiles used in the stacks definitions. These images are available in Docker Hub [gmlpdou](https://hub.docker.com/r/gmlpdou) account.
* [stacks](/stacks): This directory contains the Docker Stacks to deploy Jenkins, Nexus, Sonarqube and another services that your Pipes requires in Docker Swarm.
* [terraform](/terraform) Terraform definitions to deploy this project in AWS.  

# How to use this project

## Deploy it locally:
```bash
# Make sure the swarm mode is on
docker swarm init

# Create Sonarqube overlay network
docker network create -d overlay sonarqube

# Create the docker secrets used by Jenkins stack
echo <SECRET> | docker secret create jenkins-user - 
echo <SECRET> | docker secret create jenkins-pass - 

#Deploy Jenkins
docker stack deploy -c stacks/jenkins.yml jenkins

#Deploy sonarqube
docker stack deploy -c stacks/sonarqube.yml sonarqube

#Deploy other service by running
docker stack deploy -c stacks/<STACK_FILE> <STACK_NAME>

```

## Deploy it on AWS

```bash
# TODO
```