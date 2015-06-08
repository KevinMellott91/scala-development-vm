# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  
  config.vm.box = "MPavleski/fedora21worksation"

  # Set VM settings
  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = 4096
     vb.cpus = 2
     vb.name = "Scala Developer Machine"
     vb.customize ["modifyvm", :id, "--vram", "64"]
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.provision "chef_solo" do |chef|
	chef.json = {
        "java" => {
          "install_flavor" => "oracle",
          "jdk_version" => "7",
          "oracle" => { "accept_oracle_download_terms" => true }
        },
          "scala" => {
          "version" => "2.10.4",
          "checksum" => "b46db638c5c6066eee21f00c447fc13d1dfedbfb60d07db544e79db67ba810c3"
        }
      }

    chef.add_recipe "java::default"
    chef.add_recipe "scala::default"
    chef.add_recipe "maven::default"
    chef.add_recipe "bots::default"
    chef.add_recipe "idea::default"
  end

end
