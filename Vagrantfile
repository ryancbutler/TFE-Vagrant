# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"

  #Access to TFE
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
  config.vm.network "forwarded_port", guest: 8800, host: 8800

  config.vm.provider "virtualbox" do |vb, override|
      # TFE Requirements
      vb.memory = 4096
      vb.cpus = 2
   end

  config.vm.provider "vmware_desktop" do |vb, override|
      # TFE Requirements
      vb.vmx["memsize"] = "4096"
      vb.vmx["numvcpus"] = "2"
  end

  #Install Terraform Enterprise
  config.vm.provision "shell", run: "once", inline: <<-SHELL
    #apt-get update
    #Allows Grub update to continue noninteractive
    #DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
    if [[ -f "/vagrant/config/license.rli" ]]
      then
        echo "Config folder found.  Automating Install"
        echo "Creating App Dirs"
        mkdir /tfe
        mkdir /tfe/app
        mkdir /tfe/snapshots
        mkdir /tfe/statsd
        #echo "Creating cert"
        #openssl req -x509 -newkey rsa:4096 -new -nodes -keyout server.key -out server.crt -days 365 -subj "/C=US/ST=Wisconsin/L=Milwaukee/O=Company Name/OU=Org/CN=localhost" -passout pass:
        echo "Copying replicated conf"
        cp /vagrant/config/replicated.conf /etc/replicated.conf
        curl -s https://install.terraform.io/ptfe/stable | sudo bash
        while ! curl -ksfS --connect-timeout 5 https://127.0.0.1/_health_check; do
          echo "Waiting for TFE to come up..."
          sleep 5
        done
        TOKEN=$(replicated admin --tty=0 retrieve-iact)
        echo "Install complete..."
        echo "Dashboard available: https://127.0.0.1:8800"
        echo "TFE Login:  https://127.0.0.1/admin/account/new?token=${TOKEN}" 
      else
        echo "Performing manual install"  
        curl -s https://install.terraform.io/ptfe/stable | sudo bash
      fi
  SHELL
end
