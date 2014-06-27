# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'etc'

USER_NAME = Etc.getlogin

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Provision using shell to execute ansible because of windows issues
  config.vm.provision "shell" do |sh|
    sh.path = "installer.sh"
    sh.args = ["provision/site.yml", USER_NAME]
  end

  # a name for the guest instance
  config.vm.hostname = "local-dev"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # nginx
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # rabbitmq management
  config.vm.network "forwarded_port", guest: 15672, host: 8672
  # mongodb HTTP console
  config.vm.network "forwarded_port", guest: 28017, host: 8017

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../../cloud/jetport/", "/home/#{ USER_NAME }/projects/cloud/jetport", owner: USER_NAME, group: USER_NAME, create: true

  config.vm.provider "virtualbox" do |vb|
    # provide a name for the vm
    vb.name = "jetport"

    # specify number of CPUs
    vb.cpus = 2

    # specify amount of memory
    vb.memory = 4096

    # customize the max CPU utillization on physical host (max 50%)
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

    # Don't boot with headless mode
    #vb.gui = true
  end

end
