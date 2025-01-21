#!/bin/bash
apt update
apt install git curl build-essential wget -y
bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
echo 0 > /sys/class/vtconsole/vtcon1/bind
service lightdm stop
rmmod nouveau
update-grub
update-initramfs -u
wget https://developer.download.nvidia.com/compute/cuda/12.6.1/local_installers/cuda_12.6.1_560.35.03_linux.run
chmod 755 cuda_12.6.1_560.35.03_linux.run
./cuda_12.6.1_560.35.03_linux.run --override --driver --toolkit --silent
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
ls -l /usr/local/bin/docker-compose && chmod 755 /usr/local/bin/docker-compose
/usr/local/bin/docker-compose -v
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir /opt/ssl && mkdir /opt/conf && chmod 755 /opt/ssl && chmod 755 /opt/conf
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
&& curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
&& curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
apt-get update
apt-get install -y nvidia-container-toolkit
mkdir -p /etc/systemd/system/docker.service.d
tee /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime
EOF
systemctl daemon-reload \
  && sudo systemctl restart docker
  nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml
nvidia-ctk runtime configure --runtime=docker --set-as-default
systemctl restart docker
cd /usr/local/src/docker_install_ole
docker build -t cooliobr/mux:local .
wget https://raw.githubusercontent.com/keylase/nvidia-patch/master/patch.sh && chmod 755 patch.sh && ./patch.sh
docker-compose -f /usr/local/src/docker_install_ole/docker-compose-encoder.yml up -d
