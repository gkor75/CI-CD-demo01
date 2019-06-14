# Welcome to CI / CD demo with Kubernetes, Jenkins, Ansible and F5 BigIP.
## \<\<\<draft\>\>\>
## Introduction
[BigIP](https://www.f5.com/) is a versatile Application Delivery Controler / Security Suite with an open [REST API](https://devcentral.f5.com/s/articles/what-is-icontrol) that can be easily integrated into the CI / CD pipeline.

This project is a demo platform for a quick and easy demonstration of popular CI/CD integration scenarios with [Kubernetes](https://kubernetes.io/), [Jenkins](https://jenkins.io/), [Ansilbe](https://www.ansible.com/) and [AS3](https://jenkins.io/). BigIP is integrated with Kubernetes with use of [Container Connector](https://clouddocs.f5.com/containers/v2/kubernetes/).

The following integration scenarios are covered:
1. Kubernetes Ingress usage with BigIP-specific annotation. Explains how to store the private keys securely and utilize top class F5 TLS stack.
2. **Imperative model** - utilizes Container Connector and Ansible to get advantage of F5 advanced features. This scenario may be usefull for organizations that already created Ansible Playbooks for F5.
3. **Declarative model** - utilizes AS3 JSON to provision F5 advanced features

## Setting up your environment.
It's assumed that you have a basic understanding of docker.

First you need to build your own Jenkins image...
```
cd Jenkins-container
chmod +x build-Jenkins-image.sh
./build-Jenkins-image.sh
```
