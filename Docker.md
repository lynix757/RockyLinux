# How To Install and Use Docker on Rocky Linux 9
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-rocky-linux-9

Step 1 — Installing Docker

```
sudo dnf check-update
sudo dnf update
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
```
Step 2 — Executing Docker Command Without Sudo (Optional)
```
sudo usermod -aG docker $(whoami)
```
Step 3 - Install docke-compose
```
sudo curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
> Info : https://docs.docker.com/compose/

## Play
### save image
```
docker save -o name.tar image-name:tag
```
### load image
```
docker load < name.tar
```
