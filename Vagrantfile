require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.host_name = "ruby_quick_installer-berkshelf"

  config.vm.box = "Opscode-12-04"
  config.vm.network :hostonly, "33.33.33.50"

  # config.vm.forward_port 80, 8080

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {}

    chef.run_list = [
      "recipe[ruby_quick_installer::default]"
    ]
  end
  cache_dir = local_cache(config.vm.box)
  config.vm.share_folder "v-cache", "/var/cache/apt/archives/", cache_dir

end

def local_cache(box_name)
  cache_dir = File.join(File.expand_path(Vagrant::Environment::DEFAULT_HOME),
                        'cache',
                        'apt',
                        box_name)
  partial_dir = File.join(cache_dir, 'partial')
  FileUtils.mkdir_p(partial_dir) unless File.exists? partial_dir
  cache_dir
end
