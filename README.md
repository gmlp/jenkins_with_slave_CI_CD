Jenkins_with_slave_CI_CD
======

This is a production ready implementation of jenkins.

![Pipeline](/_docs/jenkins_with_slave_CI_CD_1.png?raw=true)

# This repo contains:

* [Dockerfiles](/Dockerfiles): Here you are going to find the Dockerfiles used in the stacks definitions. These images are available in Docker Hub [gmlpdou](https://hub.docker.com/r/gmlpdou) account.
* [stacks](/stacks): This directory contains the Docker Stacks to deploy Jenkins, Nexus, Sonarqube and another services that your Pipes requires in Docker Swarm.
* [terraform](/terraform) Terraform definitions to deploy this project in AWS.  

# How to use this project

## Deploy it locally:
---

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
---

The terraform folder has the following structure:

* [modules](/terraform/modules): This folder contains the reusable code for this Module, broken down into onw or more modules.
* [examples](/terraform/examples): This folder contains examples of how to use the modules.

### To deploy this module.

1. You must have a bucket previously created. this bucket is going to be used to store the terraform state.

1. Modify the bucket and region properties with what you have defenied.

1. Modify the global output tags. Those tags are going to be included in every resource created in AWS.

1. Deploy [global](/terraform/examples/global) module

1. Deploy  [ci_server](/terraform/examples/ci_server) module

1. Deploy [stack_deployer](/terraform/examples/ci_server) module

```bash
#

```