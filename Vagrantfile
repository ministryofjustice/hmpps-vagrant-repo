Vagrant.configure("2") do |config|
  config.vm.define "windows" do |windows|
    windows.vm.provision :shell, path: "shell/windows/main.cmd"
    windows.vm.box = "mwrock/Windows2012R2"
    windows.vm.network "private_network", ip: "172.26.243.10"
    windows.vm.network "forwarded_port", guest: 3389, host: 3389
    windows.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.synced_folder "data/", "/data", type: "nfs"
    jenkins.vm.box = "bento/centos-7.4"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.network "private_network", ip: "172.26.243.11"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provision :shell, path: "shell/centos/bootstrap-jenkins.sh"
    jenkins.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
end