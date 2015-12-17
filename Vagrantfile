VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.6.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
  # config.vm.network "public_network"
  # config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant_data"

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.build_args = ["--build-arg", "GITHUB_OAUTH_TOKEN=" + ENV['GITHUB_OAUTH_TOKEN'] ]
    d.has_ssh = true
    #d.volumes = ["/va:grant/"]
    d.ports = ["80:80"]
    d.env = {
	'TOKEN' => "zxcv"
    }
    args = "-v .:/data"
  end
  config.ssh.port = 22
end
