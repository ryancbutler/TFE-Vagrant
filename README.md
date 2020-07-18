# Vagrant Terraform Enterprise Test 
Builds a Vagrant TFE instance for development or testing using Virtualbox and VMware Workstation\Fusion. 

A license will be required.
- Request a trial https://www.hashicorp.com/go/terraform-enterprise-trial/

# Ports
Uses the following local ports:
 - 80
 - 443
 - 8800

# To Run Install Manually
 - Go to directory and launch `vagrant up`
 - Instance will upgrade and install TFE
 - Once completed check `http://<this_server_address>:8800` to continue

# To Run Install Automatically
Installs TFE with a mounted disk configuration fully automated
 - Copy TFE license to **config** directory
 - Rename license to **license.rli**
 - Go to directory and launch `vagrant up`
 - Instance will upgrade and install TFE
 - Once completed check `http://<this_server_address>:8800` to continue
 - Will also output initial user creation URL

 Note: Console password is located in **config\replicated.conf**

# HTTPS Tunnel with NGROK
Allows external internet access to a local instance for version control system (VCS) integration. Requires a token from https://dashboard.ngrok.com/ (FREE ACCOUNT!!)
 
## Steps
Access vagrant box (`vagrant ssh`)
```
sudo apt install unzip -y
#https://ngrok.com/download
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken MYTOKEN
./ngrok http 443
```
