Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box = "debian/bullseye64"
  config.vm.post_up_message = ""
  config.vm.network "private_network", ip: ENV['PRIVATE_NETWORK_IP']
  config.vm.synced_folder ENV['SHARED_FOLDER_PATH'], "/shared", type: "nfs", mount_options: ["nolock", "async"], nfs_udp: false
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end

     config.vm.provision "shell", path: "bootstrap.sh", privileged: false, run: "always"
     config.vm.provision :docker, run: "always", preserve_order: true
     config.vm.provision :docker_compose, compose_version: "1.29.2", run: "always", preserve_order: true
     config.vm.provision "shell", inline: "cd $1 && docker-compose up -d --build --force-recreate", args: [ENV['BOX_DOCKER_PROJECT_PATH']], privileged: false, run: "always", preserve_order: true

      #max_map_count fix for elasticsearch docker image
     config.trigger.after :up do |trigger|
       trigger.name = 'max_map_count'
       trigger.run_remote = {inline: "sysctl -w vm.max_map_count=262144"}
     end
end