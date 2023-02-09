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

## Other
> Docker : https://github.com/lynix757/RockyLinux/blob/main/Docker.md
> CRI-O : https://github.com/lynix757/RockyLinux/blob/main/crio.md
> kubernetes : 



