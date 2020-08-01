#!/bin/bash
# setup for app
#
# upgrade
sudo apt-get update
sudo apt-get upgrade
# install tools
sudo apt-get install jq python3-picamera -y
# copy ssh keys
cp ~/.ssh/id_rsa ~/.ssh/id_rsa.bak
echo "mykeydata" >> ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
# add github
ssh-keyscan github.com >> ~/.ssh/known_hosts
# if you don't want to change the default key
# start the ssh-agent in the background
#$ eval $(ssh-agent -s)
#> Agent pid 59566
#ssh-add ~/.ssh/mykey
# clone repo
git clone git@github.com:vinnie357/acb-brew-dashboard.git
# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
. get-docker.sh
sudo usermod -aG docker $USER
sudo chown $USER:$USER /var/run/docker.sock
docker ps
# install docker compose
#curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.assets[] | select(.name | contains ("docker-compose-Linux-x86_64")) | .browser_download_url'
# sudo curl -sL "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo curl -sL https://raw.githubusercontent.com/docker/compose/1.26.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
# https://hub.docker.com/r/linuxserver/docker-compose
sudo curl -sL --fail https://raw.githubusercontent.com/linuxserver/docker-docker-compose/master/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
# change camera permissions
sudo tee /etc/udev/rules.d/99-camera.rules <<EOF
SUBSYSTEM=="vchiq",MODE="0666"
EOF