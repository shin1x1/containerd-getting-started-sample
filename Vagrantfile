Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"

  config.vm.provision "shell", inline: <<-SCRIPT
    apt-get update
    apt-get install -y unzip runc

    # Install containerd
    mkdir -p /etc/containerd
    cat > /etc/containerd/config.toml <<-EOT
    subreaper = true
    oom_score = -999

    [debug]
            level = "debug"

    [metrics]
            address = "127.0.0.1:1338"

    [plugins.linux]
            runtime = "runc"
            shim_debug = true
EOT

    if [ ! -f "/opt/containerd/bin/containerd" ]; then
        mkdir -p /opt/containerd
        cd /opt/containerd
        wget https://github.com/containerd/containerd/releases/download/v1.3.4/containerd-1.3.4.linux-amd64.tar.gz
        tar xvf containerd-1.3.4.linux-amd64.tar.gz
        rm containerd-1.3.4.linux-amd64.tar.gz
    fi

    # Boot containerd
    /opt/containerd/bin/containerd &

    # Install go
    if [ ! -f "/usr/local/go/bin/go" ]; then
        wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
        rm go1.14.4.linux-amd64.tar.gz
        echo 'PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc
    fi
  SCRIPT
end
