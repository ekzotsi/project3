#!/bin/bash

## Author : Edem, edemzotsi@gmail.com

#Date : Monday, 13 2022

#......this script is to create the server using the Vagrantfile

         ## create the project folder and cd into it
            
	 mkdir myproject
	 
	 sleep 3
         # move into the created folder	 
	 cd myproject
	 
	 sleep 3

	 # create the server initialization file (Vagrantfile)
      touch Vagrantfile

	    echo -e  "# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(\"2\") do |config|
  # load de centos7 box from vagrant cloud
  config.vm.box = \"utrains/centos7\"
  config.vm.box_version = \"5.0\"
  config.vm.network \"private_network\", ip: \"192.168.56.32\"
  config.vm.provider \"virtualbox\" do |vb|
    vb.memory = 1024
    #vb.name = \"centos-project2\"
    vb.cpus = 2
  end

  #change the value of the SSH configuration file, then restart the ssh service
  config.vm.provision \"shell\", inline: <<-SHELL
   sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
   sudo systemctl restart sshd
  SHELL
end "    > Vagrantfile

		 ##  initialize the server
          vagrant up

          # loging to the server..."
			  
        ssh vagrant@192.168.56.32  
