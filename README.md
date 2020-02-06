# Welcome to CI / CD demo with Kubernetes, Jenkins, Ansible and F5 BigIP.
## \<\<\<draft\>\>\>
## Introduction
[BigIP](https://www.f5.com/) is a versatile Application Delivery Controler with an open [REST API](https://devcentral.f5.com/s/articles/what-is-icontrol) that can be easily integrated into the CI / CD pipeline.

This project contains CI/CD integration scenarios with [Kubernetes](https://kubernetes.io/), [Jenkins](https://jenkins.io/), [Ansilbe](https://www.ansible.com/) and [AS3](https://jenkins.io/). In addition, [Container Connector](https://clouddocs.f5.com/containers/v2/kubernetes/) is used to exchange ifnormation between Kubernetes cluster na F5 BigIP. This project is ment to be used for training and  demonstration purpose, however some parts of code may be useful for commercial deployments.

The following  scenarios are covered:
1. Kubernetes Ingress with BigIP-specific annotation. Demonstrates how to store the private keys securely and utilize top class F5 TLS stack.
2. **Imperative model** - utilizes Container Connector and Ansible to take advantage of F5 advanced features. This scenario may be usefull for organizations that already created Ansible Playbooks for F5, and now have a container and/or CI/CD introduction initiative.
3. **Declarative model** - utilizes AS3 JSON embeded into Kubernetes' Configmap.

## Setting up your environment.
Sample network diagram with recommended IP addresses.

You can minimize your configuration efford if you leave the IP addressing as above.

The environment has been testsed with the following software versions:
- BigiP 14.1
- Jenkins 2.184 (jenkins/jenkins:lts docker image as of 2019-07-11)
- Kubernetes v1.11.2

It's recommended to relay on official [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/), however a brief Kubernetes installation notes are included in [Container-Connector_setup](Container-Connector_setup/). 

First you need to build your own Jenkins image...
```
cd Jenkins-container
chmod +x build-Jenkins-image.sh
./build-Jenkins-image.sh
```
## OpenShift preparation
1. Create respective namespaces - look for `namespace` keywords in the yaml files. `oc create namespace <namespace>`
2. For each namespace: `oc adm policy add-scc-to-user hostmount-anyuid -z default`. That's required to run a demo pods.


##  OpenShift Route example
1. Install OpenShift Pipeline Jenkins Plugin
2. Get a token
```
oc project route-demo
oc create serviceaccount robot
oc policy add-role-to-user admin system:serviceaccount:route-demo:robot
oc serviceaccounts get-token robot
```
3. Create a Secret text named 'ROUTE_DEMO_TOKEN'
