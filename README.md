# RockyLinux
Download Rocky Linux
https://rockylinux.org/download/

## my Setup (lab on vmware player)
### Disk Partition 
```
- LVM
 -- /boot 512MB
 -- /home 10GB
 -- /opt  10GB
 -- /var  20GB
 -- /tmp  5GB
 ```
### Disk Extend
 ```
fdisk /dev/sdb
pvcreate /dev/sdb1
vgextend centos /dev/sdb1
lvextend -l +100%FREE /dev/centos/var -r
 ```
### Disable swap
 ```
sudo vi /etcfstab

#
# /etc/fstab
# Created by anaconda on Thu Feb  9 09:53:37 2023
#
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
#
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.
#
/dev/mapper/rl-root     /                       xfs     defaults        0 0
UUID=03d5b5fc-5136-42b8-b3be-7ebbd9589fbf /boot                   xfs     defaults        0 0
/dev/mapper/rl-home     /home                   xfs     defaults        0 0
/dev/mapper/rl-opt      /opt                    xfs     defaults        0 0
/dev/mapper/rl-tmp      /tmp                    xfs     defaults        0 0
/dev/mapper/rl-var      /var                    xfs     defaults        0 0
#/dev/mapper/rl-swap     none                    swap    defaults        0 0
 ```

### Disable SELINUX
 ```
sudo vi /etc/selinux/config
SELINUX=disabled
 ```

### Add user
```
sudo adduser myuser
sudo passwd myuser
```

### Enable sudo for myuser
```
sudo usermod -aG wheel myuser
```

### Tools
```
sudo dnf update
sudo dnf install -y open-vm-tools
sudo dnf install -y bind-utils sysstat lsof net-tools traceroute nmap wget git tree tcpdump
```
### Extra-Tools
#### nmon
```
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo dnf install -y nmon
```

### Optional
```
sudo dnf install -y scap-security-guide openscap-scanner
```

### Disk Spped
1. Write Speed
- sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync
```
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 3.48744 s, 308 MB/s
```
2. Read Speed
- dd if=tempfile of=/dev/null bs=1M count=1024
```
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.13844 s, 7.8 GB/s
```
3. Actual Disk Read Speed (No Cache)
- sudo sysctl -w vm.drop_caches=3
- dd if=tempfile of=/dev/null bs=1M count=1024
```
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.624155 s, 1.7 GB/s
```
## Container
1. NGINX : https://github.com/lynix757/nginx
2. LDAP : https://github.com/lynix757/LDAP/tree/main

## Other
1. Docker : https://github.com/lynix757/RockyLinux/blob/main/Docker.md
2. CRI-O : https://github.com/lynix757/RockyLinux/blob/main/crio.md
3. kubernetes : https://github.com/lynix757/RockyLinux/blob/main/kubernetes.md
4. Nextcloud with Keycloak : https://janikvonrotz.ch/2020/10/20/openid-connect-with-nextcloud-and-keycloak/
