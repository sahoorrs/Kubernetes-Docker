<!--
</pre>
</details>

<details>
<summary>kubectl command syntax</summary>
<pre>

</pre>
</details>
-->

# Kubernetes-Docker

## Installation of Docker, kubectl, minikube on Ubuntu
Install a Ubuntu VM, Container or natively on a host with
- 2 CPUs or more
- 2GB of free memory
- 20GB of free disk space
- Internet connection
- Container or virtual machine manager, such as: Docker, QEMU, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation
  
[Minikube Reference Doc](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download)

### Step 1 Install Docker
- sudo apt-get update
- sudo apt-get -y install ca-certificates curl
- sudo install -m 0755 -d /etc/apt/keyrings
- sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
- sudo chmod a+r /etc/apt/keyrings/docker.asc


-echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

-sudo apt-get update
-sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

### Step 2: Install Kubectl
- curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

- chmod +x kubectl

- mv kubectl /usr/local/bin

- kubectl
### Step 3: Install Minikube
- curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

- sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

### Step 4: Start Minikube
- minikube start --force

### Step 5: Verification
- minik5be status

- kubectl get nodes
<img width="875" height="411" alt="image" src="https://github.com/user-attachments/assets/efff71ac-d5af-48cd-8c3b-8a95b6a498c9" />

### kubectl command syntax
<details>
<summary>kubectl command syntax</summary>
<pre>
kubectl is the command-line tool used to interact with a Kubernetes cluster. It lets you deploy applications, inspect and manage cluster resources, and view logs.

🧱 Basic Structure of kubectl Command
kubectl [command] [type] [name] [flags]

📌 Components Breakdown:
Component	Description
kubectl	The command-line tool
command	What you want to do (e.g., get, describe, create, delete)
type	The type of resource (e.g., pod, deployment, service)
name	The name of the resource (optional)
flags	Optional flags like -n, -o, --all, etc.
📘 Common kubectl Commands
🔹 Get Resources
kubectl get pods
kubectl get deployments
kubectl get services
kubectl get all

🔹 Describe Resource (Detailed Info)
kubectl describe pod my-pod
kubectl describe deployment my-deployment

🔹 Create from YAML
kubectl apply -f my-config.yaml

🔹 Delete Resources
kubectl delete pod my-pod
kubectl delete -f my-config.yaml

🔹 Logs
kubectl logs my-pod

🔹 Exec (Run Command in Pod)
kubectl exec -it my-pod -- bash

🛠️ Useful Flags
Flag	Description
-n <namespace>	Specify namespace
--all	Target all resources of a type
-o yaml/json	Output in YAML or JSON
--watch	Watch changes in real time
--dry-run=client	Preview changes without applying
--force	Force deletion
--grace-period=0	Immediate deletion (with --force)
🧪 Examples
List all pods in a namespace:
kubectl get pods -n dev

Get a YAML manifest of a deployment:
kubectl get deployment my-app -o yaml

Create a namespace:
kubectl create namespace test

Apply multiple configs:
kubectl apply -f ./configs/

</pre>
</details>

### kubectl commands
- kubectl run nginx-01 --image=nginx
- kubectl run nginx-02 --image=nginx
- kubectl get nodes -o wide
- kubectl get pods -o wide
- kubectl describe node minikube
- kubectl describe pod nginx-01
- kubectl api-resources
- kubectl run nginx --image=nginx --dry-run=client
- kubectl apply -f pod.yaml --dry-run=client
- kubectl run nginx --image=nginx --dry-run=client -o yaml
- kubectl delete pods --all
- kubectl exec -it multi-container-pod -- bash
- kubectl exec -it multi-container-pod -c redis-container -- bash
- rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
<details>
<summary>kubectl.exe get pods --show-labels</summary>
<pre>
    $ kubectl.exe get pods --show-labels
    NAME                  READY   STATUS             RESTARTS          AGE     LABELS
    echo-pod              0/1     CrashLoopBackOff   187 (4m39s ago)   45h     run=echo-pod
    multi-container-pod   2/2     Running            0                 3d20h   <none>
    new-ping-pod          0/1     CrashLoopBackOff   147 (2m44s ago)   44h     <none>
    ping-pod              0/1     CrashLoopBackOff   178 (3m42s ago)   45h     run=ping-pod
    
    rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
    $  
</pre>
</details>

<details>
<summary>kubectl.exe label pod echo-pod env=dev</summary>
<pre>
$ kubectl.exe label pod echo-pod env=dev
pod/echo-pod labeled

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe get pods --show-labels
NAME                  READY   STATUS             RESTARTS          AGE     LABELS
echo-pod              0/1     CrashLoopBackOff   193 (3m6s ago)    45h     env=dev,run=echo-pod
multi-container-pod   2/2     Running            0                 3d20h   <none>
new-ping-pod          0/1     CrashLoopBackOff   152 (4m10s ago)   44h     <none>
ping-pod              0/1     CrashLoopBackOff   184 (25s ago)     45h     run=ping-pod

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe label pod echo-pod env-
pod/echo-pod unlabeled

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe get pods --show-labels
NAME                  READY   STATUS             RESTARTS          AGE     LABELS
echo-pod              0/1     CrashLoopBackOff   194 (2m27s ago)   45h     run=echo-pod
multi-container-pod   2/2     Running            0                 3d20h   <none>
new-ping-pod          0/1     CrashLoopBackOff   153 (2m36s ago)   44h     <none>
ping-pod              0/1     CrashLoopBackOff   184 (4m53s ago)   45h     run=ping-pod

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl label pods --all status=running
pod/echo-pod labeled
pod/multi-container-pod labeled
pod/new-ping-pod labeled
pod/ping-pod labeled

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl get pods --show-labels
NAME                  READY   STATUS             RESTARTS          AGE     LABELS
echo-pod              0/1     CrashLoopBackOff   196 (27s ago)     46h     env=dev,run=echo-pod,status=running
multi-container-pod   2/2     Running            0                 3d20h   status=running
new-ping-pod          0/1     CrashLoopBackOff   154 (4m44s ago)   44h     status=running
ping-pod              0/1     CrashLoopBackOff   186 (2m13s ago)   45h     run=ping-pod,status=running

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)

</pre>
</details>


<img width="1869" height="741" alt="image" src="https://github.com/user-attachments/assets/ccc7505c-e7f0-4b1c-8f1c-2e3bf6052feb" />

### [Kubernetes API reference doc](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.24/)

## [REPLICA SET](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)

# Replica Set
<details>
<summary>Replica Set auto create the pods after deletion </summary>
<pre>
$ cat replicaset.yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend-replicaset
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: us-docker.pkg.dev/google-samples/containers/gke/gb-frontend:v5

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe apply -f replicaset.yaml
replicaset.apps/frontend-replicaset created

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe get replicaset
NAME                  DESIRED   CURRENT   READY   AGE
frontend-replicaset   3         3         0       71s

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ 
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe get pods -l tier=frontend
NAME                        READY   STATUS    RESTARTS   AGE
frontend-replicaset-c4hrx   1/1     Running   0          7m55s
frontend-replicaset-fhl2f   1/1     Running   0          7m55s
frontend-replicaset-vlx9w   1/1     Running   0          7m55s

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl delete pods --all
pod "echo-pod" deleted
pod "frontend-replicaset-c4hrx" deleted
pod "frontend-replicaset-fhl2f" deleted
pod "frontend-replicaset-vlx9w" deleted
pod "multi-container-pod" deleted
pod "new-ping-pod" deleted
pod "ping-pod" deleted

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
frontend-replicaset-g6tr5   1/1     Running   0          6s
frontend-replicaset-kgfvw   1/1     Running   0          6s
frontend-replicaset-rzqtc   1/1     Running   0          6s

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ 
$ kubectl get replicaset
NAME                  DESIRED   CURRENT   READY   AGE
frontend-replicaset   3         3         3       4h10m

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl delete replicaset frontend-replicaset
replicaset.apps "frontend-replicaset" deleted

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl get pods
No resources found in default namespace.

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl apply -f replicaset.yaml
replicaset.apps/frontend-replicaset created

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl.exe get pods
NAME                        READY   STATUS    RESTARTS   AGE
frontend-replicaset-lwwl4   1/1     Running   0          10s
frontend-replicaset-s8pcf   1/1     Running   0          10s
frontend-replicaset-ssrh9   1/1     Running   0          10s

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl scale --replicas=5 rs/frontend-replicaset
replicaset.apps/frontend-replicaset scaled

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
frontend-replicaset-9c2kc   1/1     Running   0          5s
frontend-replicaset-lwwl4   1/1     Running   0          9m45s
frontend-replicaset-pwd85   1/1     Running   0          5s
frontend-replicaset-s8pcf   1/1     Running   0          9m45s
frontend-replicaset-ssrh9   1/1     Running   0          9m45s

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$
rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl scale --replicas=1 rs/frontend-replicaset
replicaset.apps/frontend-replicaset scaled

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
frontend-replicaset-lwwl4   1/1     Running   0          10m

rrsah@RashmiPersonal MINGW64 ~/VSCODE/github/kubernetes (pods)
$

</pre>
</details>

<details>
<summary>kubectl command syntax</summary>
<pre>

</pre>
</details>

# DOCKER
