

# Universe

![](assets/Universe.png)

## Overview

universe as an automation source code can automate the deployment of skyfarm backend and infrastructure. Universe consists of a number of sub systems that deploy separate parts of the infrastructure separately. The underlyig infrastructure has been automated by Ansible while the cluster level automation has been conducted with Hashicorp Terraform. With Universe we deploy +13 Virtual machines fully automated with KVM in the backend and Kubevirt on kubernetes. In this document we go throught the capabilities of the source code, list of features, basic concepts and finally the full deployment roadmap and guideline. 



## Prerequisits

---

### Host Nodes

**Note:** For the porpuse of this project you need at least 2 Nodes (one master and one worker)

Please before installation make sure that your CPU suports hasrdware virtualization via  `egrep` command

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
