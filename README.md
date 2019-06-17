# Welcome to CI / CD demo with Kubernetes, Jenkins, Ansible and F5 BigIP.
## \<\<\<draft\>\>\>
## Introduction
[BigIP](https://www.f5.com/) is a versatile Application Delivery Controler with an open [REST API](https://devcentral.f5.com/s/articles/what-is-icontrol) that can be easily integrated into the CI / CD pipeline.

This project contains CI/CD integration scenarios with [Kubernetes](https://kubernetes.io/), [Jenkins](https://jenkins.io/), [Ansilbe](https://www.ansible.com/) and [AS3](https://jenkins.io/). In addition, [Container Connector](https://clouddocs.f5.com/containers/v2/kubernetes/) is used to exchange ifnormation between Kubernetes cluster na F5 BigIP.

The following  scenarios are covered:
1. Kubernetes Ingress with BigIP-specific annotation. Demonstrates how to store the private keys securely and utilize top class F5 TLS stack.
2. **Imperative model** - utilizes Container Connector and Ansible to get advantage of F5 advanced features. This scenario may be usefull for organizations that already created Ansible Playbooks for F5, and now have a container introduction initiative.
3. **Declarative model** - utilizes AS3 JSON to provision F5 advanced features.

## Setting up your environment.
It's recommended to relay on official [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/), however a brief Kubernetes installation notes are included in [Container-Connector_setup](Container-Connector_setup/). 

First you need to build your own Jenkins image...
```
cd Jenkins-container
chmod +x build-Jenkins-image.sh
./build-Jenkins-image.sh
```
