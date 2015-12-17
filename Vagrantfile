VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.6.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
  #config.vm.network "public_network"
  #config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.build_args = ["--build-arg", "GITHUB_OAUTH_TOKEN=" + ENV['GITHUB_OAUTH_TOKEN'], "-v /vagrant:/vagrant"] 
    #d.has_ssh = true
    d.ports = ["80:80"]
    d.env = {
	'DOCKER' => "true"
    }
  end
  config.vm.provision "shell", inline: "echo hello"
end
