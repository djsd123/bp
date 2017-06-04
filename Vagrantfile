Vagrant.configure("2") do |config|

  plugins = %w(vagrant-cachier vagrant-vbguest)

  plugins.each do |p|
    if ! Vagrant.has_plugin? (p)
      system "vagrant plugin install #{p}"
    end
  end

  config.vm.box = "centos/7"
  
  config.vm.define "bp" do |bp|
  	bp.vm.provision "shell", path: "docker_repo.sh"
    bp.vm.network "private_network", ip: "172.16.1.10"
    bp.vm.network "forwarded_port", host: 8081, guest: 8081
    bp.vm.provision "ansible" do  |a|
    	a.playbook = "playbook.yml"
    end
  end
end
