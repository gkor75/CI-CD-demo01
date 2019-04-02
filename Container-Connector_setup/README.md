Installed packages:
```
 apt-get install vim ntp wget elinks curl
 apt-get install apt-transport-https kubectl kubelet kubernetes-cni kubeadm docker.io
```
kubadm init command used:
```
 kubeadm init --apiserver-advertise-address=10.1.20.111 --kubernetes-version=v1.11.2 --pod-network-cidr=10.244.0.0/16  --service-cidr=10.144.0.0/16
```
Please mind the kubernetes version above. 
Configure Flannel:
```
kubectl -n kube-system apply -f kube-flannel.yml
```
This step is  goint to take some time. Wait till the pods will be ready `kubectl -n kube-system get pods` 
Further follow the instruction displayed by kubeadm init to join some nodes.

It's assumed that 10.1.20.241 is a BigIP production interface for BigIP provisioning and vxlan termination. Please remember that you need an SDN license on a physical BigIp platform.

Merge the `object_to_add_to_bigipa.txt` with the current BigIP configuration.
```
tmsh load sys config file object_to_add_to_bigipa.txt merge
```
Please note the BigIP's vtep MAC address.
```
tmsh show /net tunnels tunnel flannel_vxlan all-properties
```
and place it in `bigipa_node.yaml`.
Add the rest of yaml files (`kubectl apply -f <file>`): bigipa_node.yaml, kube-flannel.yml, f5-k8s-bigip-ctlr_bigipa.yaml.
