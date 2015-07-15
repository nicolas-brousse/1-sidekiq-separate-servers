# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configuration
$worker_num_instances = 2
$worker_memory = 768
$web_memory = 768
# End configuration

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Web instance
  config.vm.define "web" do |web|
    web.vm.hostname = "rails-sidekiq-web"
    web.vm.box = "ubuntu/trusty64"

    web.vm.network :private_network, ip: "10.10.150.10"

    web.vm.provision :shell, path: "extras/vagrant/_common/install.sh", run: "once"
    web.vm.provision :shell, path: "extras/vagrant/_common/start.sh", run: "always"

    web.vm.provision :shell, path: "extras/vagrant/web/install.sh", run: "once"
    web.vm.provision :shell, path: "extras/vagrant/web/start.sh", run: "always"

    web.vm.provider :virtualbox do |virtualbox|
      virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      virtualbox.customize ["modifyvm", :id, "--memory", $web_memory]
      virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
      virtualbox.customize ["modifyvm", :id, "--name", web.vm.hostname]
    end
  end

  # Worker instances
  (1..$worker_num_instances).each do |i|
    config.vm.define "worker-%02d" % i do |worker|
      worker.vm.hostname = "rails-sidekiq-worker-%02d" % i
      worker.vm.box = "ubuntu/trusty64"

      worker.vm.network :private_network, ip: "10.10.150.1%02d" % i

      worker.vm.provision :shell, path: "extras/vagrant/_common/install.sh", run: "once"
      worker.vm.provision :shell, path: "extras/vagrant/_common/start.sh", run: "always"

      worker.vm.provision :shell, path: "extras/vagrant/worker/install.sh", run: "once"
      worker.vm.provision :shell, path: "extras/vagrant/worker/start.sh", run: "always"

      worker.vm.provider :virtualbox do |virtualbox|
        virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        virtualbox.customize ["modifyvm", :id, "--memory", $worker_memory]
        virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
        virtualbox.customize ["modifyvm", :id, "--name", worker.vm.hostname]
      end
    end
  end
end
