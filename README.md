# Virtualbox Terraform Enterprise Test 
Builds a Vagrant TFE instance for development or testing using Virtualbox and Vagrant.  A license will be required.

# Ports
Uses the following local ports:
 - 80
 - 443
 - 8800

# To Run
 - Go to directory and launch `vagrant up`
 - Instance will upgrade and install TFE
 - Once completed check `http://<this_server_address>:8800` to continue

 # HTTPS Tunnel with NGROK
 Allows external access to local instance. Requires a token from https://dashboard.ngrok.com/
 - `vagrant ssh`
 - `wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip` 
     - https://ngrok.com/download (Linux)
 - `sudo apt install unzip`
 - `unzip ngrok-stable-linux-amd64.zip`
 - `./ngrok authtoken MYTOKEN`
 - `./ngrok http 443`
