Vagrant.configure("2") do |config|
    config.vm.define "alma93" do |x|
        x.vm.box = "generic/alma9"
        x.vm.box_version = "4.3.12"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.163"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/rocky93.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
    config.vm.define "rocky93" do |x|
        x.vm.box = "generic/rocky9"
        x.vm.box_version = "4.3.12"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.164"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/rocky93.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
    config.vm.define "ubuntu2310" do |x|
        x.vm.box = "generic/ubuntu2310"
        x.vm.box_version = "4.3.12"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.165"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/ubuntu2310.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
    config.vm.define "fedora39" do |x|
        x.vm.box = "generic/fedora39"
        x.vm.box_version = "4.3.12"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.166"
        x.ssh.password = "vagrant"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/fedora39.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
    config.vm.define "fedoraraw" do |x|
        x.vm.box = "generic/fedora-rawhide"
        x.vm.box_version = "4.3.12"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.167"
        x.ssh.password = "vagrant"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/fedorarawhide.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
    config.vm.define "susetumbleweed" do |x|
        x.vm.box = "opensuse/Tumbleweed.x86_64"
        x.vm.box_version = "1.0.20240415"
        x.vm.synced_folder ".", "/vagrant", disabled: true      # Guest additions too old
        x.vm.network "private_network", ip: "192.168.56.168"
        x.ssh.password = "vagrant"
        x.vm.provision "host-setup", type: "shell" do |shell|
            shell.path = "scripts/os-prep/susetumbleweed.sh"
        end
        x.vm.provision "podman-deploy", type: "shell" do |shell|
            shell.path = "scripts/podman-prep.sh"
        end
        x.vm.provision "test", type: "shell" do |shell|
            shell.path = "scripts/test-case.sh"
        end
    end
end
