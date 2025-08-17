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

### kubectl commands
- kubectl run nginx-01 --image=nginx
- kubectl run nginx-02 --image=nginx
- kubectl get nodes -o wide
- kubectl get pods -o wide
- kubectl describe node minikube
- kubectl describe pod nginx-01
- kubectl api-resources

<img width="1869" height="741" alt="image" src="https://github.com/user-attachments/assets/ccc7505c-e7f0-4b1c-8f1c-2e3bf6052feb" />

### [Kubernetes API reference doc](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.24/)
