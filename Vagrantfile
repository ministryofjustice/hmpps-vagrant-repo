Vagrant.configure("2") do |config|
  config.vm.define "windows" do |windows|
    windows.vm.box = "mwrock/Windows2012R2"
    windows.vm.network "private_network", ip: "172.26.243.10"
    windows.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
end