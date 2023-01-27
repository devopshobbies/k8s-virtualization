# Universe

<img src="assets/Universe.png" title="" alt="" data-align="center">

## Table of Contents

- [Overview](#overview)
- [Prerequisits](#prerequisits)
  - [Host Nodes](#host-nodes)
    - [Openssh-server](#openssh-server)
    - [Ansible](#ansible)
    - [Terraform](#terraform)
- [Configuration](#configuration)

## Overview

universe as an automation source code can automate the deployment of skyfarm backend and infrastructure. Universe consists of a number of sub systems that deploy separate parts of the infrastructure separately. The underlyig infrastructure has been automated by Ansible while the cluster level automation has been conducted with Hashicorp Terraform. With Universe we deploy +13 Virtual machines fully automated with KVM in the backend and Kubevirt on kubernetes. In this document we go throught the capabilities of the source code, list of features, basic concepts and finally the full deployment roadmap and guideline. 

## Prerequisits

### Host Nodes

**Note:** For the porpuse of this project you need at least 2 Nodes (one master and one worker)

Please before installation make sure that your CPU suports hardware virtualization via  `egrep` command

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

If the command returns a value of **0**, your processor it not capable of running KVM. on the otherhand, any other number means you can proceed with the installation.

- **openssh-server**

Please make sure that you have installed and activated open-ssh on your host machine. Below you can find an installation guide. You need to activate open-ssh, generate a key and coppy the key to you host machine. 

Step 1.

    install openssh-server on all of your nodes.

```bash
sudo apt-get install openssh-server
```

step 2.

    Enable the ssh service by typing

```bash
sudo systemctl enable ssh
## OR enable and start the ssh service immediately ##
sudo systemctl enable ssh --now
```

step 3.

    Start the ssh service by typing

```bash
sudo systemctl start ssh
```

step 4.

    Test it by login into the system using

```bash
ssh userName@Your-server-name-IP
ssh ec2-user@ec2-aws-ip-here
```

step 5. (On you local machine)

    You need to generate a private-public key for your ssh access

```bash
ssh-keygen
## specify an appropriate address for your key files
## enter a pass phrase by your choice
```

step 6. 

    coppy your public key to the ssh-server

```bash
ssh-copy-id -i {ssh key address}.pub user@host
## enter your password
```

step 7. (Inside your hose machine)

    we need to disable the ssh password in our ssh-server for security issues

```bash
sudo nano/vim /etc/ssh/sshd_config
## Search for PasswordAuthentication and set the option 
## to no to disable PasswordAuthentication method and yes to enable.
```

step 8. 

    restart your ssh-server

```bash
sudo systemctl restart sshd
```

Congradulations! Now you have access to the server by ssh and key

```bash
ssh -i {ssh private key file path} user@address
```

- **Ansible**

step 1. 

    add repository to your local machine

```bash
sudo apt-add-repository ppa:ansible/ansible
```

step 2.

    Next, refresh your system’s package index so that it is aware of the packages     available in the newly included PPA

```bash
sudo apt update
```

step 3.

    install andible woth **apt**

```bash
sudo apt install ansible
```

step 4.

    configure inventory file [hosts.ini](universe/configuration/hosts.ini)

```ini
[master]
{your master node address} ansible_sudo_pass='{your host sudo pass}'
# example 10.10.10.10

[node]
{your nodes addresses} ansible_sudo_pass='{your host sudo pass}'
# example 192.16.35.[10:11] you can specify your nodes with a range of ips

# group your cluster
[kube-cluster:children]
master
node
```

- Terraform 

step 1.

    install terraform 

```bash
sudo apt-get update \
sudo apt-get install -y gnupg software-properties-common
```

step 2.

    verify your installation

```bash
terraform -help
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
##...
```

# Project structure

```bash

├── cicd
├── infrastructure
├── LICENSE
├── projects
├── README.md
├── system
└── universe
    ├── configuration
    │   ├── ansible.cfg
    │   ├── group_vars
    │   │   └── all.yml
    │   ├── hosts.ini
    │   ├── roles
    │   │   ├── cni
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   └── main.yml
    │   │   │   └── templates
    │   │   │       ├── calico.yml.j2
    │   │   │       ├── canal.yml.j2
    │   │   │       └── flannel.yml.j2
    │   │   ├── commons
    │   │   │   ├── os-checker
    │   │   │   │   ├── defaults
    │   │   │   │   │   └── main.yml
    │   │   │   │   └── tasks
    │   │   │   │       └── main.yml
    │   │   │   └── pre-install
    │   │   │       ├── meta
    │   │   │       │   └── main.yml
    │   │   │       ├── tasks
    │   │   │       │   ├── main.yml
    │   │   │       │   └── pkg.yml
    │   │   │       └── templates
    │   │   │           └── 20-extra-args.conf.j2
    │   │   ├── curl
    │   │   │   └── tasks
    │   │   │       ├── install.yml
    │   │   │       ├── main.yml
    │   │   │       └── prechecks.yml
    │   │   ├── docker
    │   │   │   ├── defaults
    │   │   │   │   └── main.yml
    │   │   │   ├── meta
    │   │   │   │   └── main.yml
    │   │   │   ├── tasks
    │   │   │   │   ├── install.yml
    │   │   │   │   ├── main.yml
    │   │   │   │   └── prechecks.yml
    │   │   │   └── templates
    │   │   │       ├── daemon.json.j2
    │   │   │       ├── docker.j2
    │   │   │       └── docker.service.j2
    │   │   ├── git
    │   │   │   ├── defaults
    │   │   │   └── tasks
    │   │   │       ├── install.yml
    │   │   │       ├── main.yml
    │   │   │       └── prechecks.yml
    │   │   ├── kubernetes
    │   │   │   ├── master
    │   │   │   │   ├── defaults
    │   │   │   │   │   └── main.yml
    │   │   │   │   ├── tasks
    │   │   │   │   │   ├── init.yml
    │   │   │   │   │   ├── install.yml
    │   │   │   │   │   ├── main.yml
    │   │   │   │   │   ├── prechecks.yml
    │   │   │   │   │   └── preflight.yml
    │   │   │   │   └── templates
    │   │   │   └── worker
    │   │   ├── kubevirt
    │   │   │   ├── defaults
    │   │   │   ├── tasks
    │   │   │   │   ├── crds.yml
    │   │   │   │   ├── data-importer.yml
    │   │   │   │   ├── main.yml
    │   │   │   │   ├── okd.yml
    │   │   │   │   └── operators.yml
    │   │   │   └── templates
    │   │   │       └── okd.j2
    │   │   ├── pv
    │   │   │   ├── defaults
    │   │   │   └── tasks
    │   │   │       ├── directories.yml
    │   │   │       ├── main.yml
    │   │   │       └── precheks.yml
    │   │   └── tests
    │   │       └── tasks
    │   │           └── main.yml
    │   ├── site.yml
    │   └── tests.yml
    └── IaC
        └── universe
            ├── computing
            │   ├── main.tf
            │   ├── modules
            │   │   ├── container-vm
            │   │   │   ├── Dockerfile
            │   │   │   ├── main.tf
            │   │   │   └── variables.tf
            │   │   └── physical_vm
            │   │       ├── main.tf
            │   │       └── variables.tf
            │   ├── plan
            │   ├── template.yml
            │   ├── terraform.tfstate
            │   ├── terraform.tfstate.backup
            │   ├── variables.tf
            │   └── versions.tf
            └── infrastructure
                ├── grafana
                │   └── values.yml
                ├── harbor
                │   └── values.yml
                ├── influxdb
                │   └── values.yml
                ├── main.tf
                ├── minio-s3
                │   └── values.yml
                ├── plan
                ├── prometheus
                │   └── values.yml
                ├── terraform.tfstate
                ├── terraform.tfstate.backup
                ├── variables.tf
                └── versions.tf
```
