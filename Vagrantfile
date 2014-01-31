# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, id: 'http',      guest: 80,   host: 9060
  config.vm.network :forwarded_port, id: 'mysql',     guest: 3306, host: 9306
  config.vm.network :forwarded_port, id: 'smtp',      guest: 3025, host: 3025
  config.vm.network :forwarded_port, id: 'pop',       guest: 3110, host: 3110
  config.vm.network :forwarded_port, id: 'imap',      guest: 3143, host: 3143

  config.vm.network :forwarded_port, id: 'jboss1',    guest: 8080, host: 8080
  
  config.vm.provider "virtualbox" do |v| 
     v.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :shell, :path => "provision/dependencies.sh"
  config.vm.provision :shell, :path => "provision/jboss.4.0.5.sh"
  config.vm.provision :shell, :path => "provision/greenmail.sh"
  config.vm.provision :shell, :path => "provision/squirrelmail.sh"
end
