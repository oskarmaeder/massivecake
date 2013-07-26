Vagrant.configure("2") do |config|
  config.vm.box = "dr_precise64_with_ruby193"
  config.vm.hostname = "jawo"
  config.vm.provider "virtualbox" do |v|
    v.name = "jawo"
  end

  config.vm.network :forwarded_port, guest: 80, host: 4567
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "../jawoserver_ops", "/etc/puppet"

end
