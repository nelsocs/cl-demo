# Kickstart configuration for RHEL7.3

# Additional repo to be used for installation
# repo --name="ExtraPackages" --baseurl=file:///run/install/repo/ExtraPackages

# platform=x86, AMD64, or Intel EM64T
platform=AMD64

# System authorization information
auth  --enableshadow  --passalgo=sha512

# Clear the Master Boot Record
zerombr

# Partition clearing information
clearpart --all --initlabel

# Use text mode install
text

# Firewall configuration
firewall --enabled

# Run the Setup Agent on first boot



firstboot --disable

# System keyboard
keyboard us

# System language
lang en_US.UTF-8

# Skipping input of key
#key --skip

# Installation logging level
logging --level=info


# Use NFS installation media
# nfs --server=10.43.138.1 --dir=/root/repo/rhel7_64





# Network Information
network --bootproto=dhcp --hostname=centos-base-01 --device=eth0 --noipv6 --onboot=on --activate

# System bootloader configuration
bootloader --location=mbr --driveorder=sda --append="rhgb novga  console=ttyS0,9600 console=tty0 crashkernel=showopts panic=1 numa=off noht"

# The following is the partition information you requested



# Disk Partioning
clearpart --all --initlabel

part /boot --size 512 --asprimary --fstype=ext4 --ondrive=sda
part pv.1 --size 1 --grow --fstype=ext4 --ondrive=sda

volgroup system --pesize=32768 pv.1
logvol / --fstype ext4 --vgname system --size=4096 --name=root
logvol /var --fstype ext4 --vgname system --size=4096 --name=var
logvol /tmp --fstype ext4 --vgname system --size=4096 --name=tmp
logvol swap --vgname system --size=4096 --name=swap
logvol /home --fstype ext4 --vgname system --size=8192 --name=home
logvol /var/log --fstype ext4 --vgname system --size=1 --grow --name=varlog


# Root password
rootpw --iscrypted $1$oVhMpzps6FeGBc1uF2JmG2xTeSW
                   $1$94TdbPXa$gYyM9ma0O93EC0AXxSlGu/
                   

# SELinux configuration
selinux --enabled

# Do not configure the X Window System
skipx

#Disabling kdump services, owing to few problems with current kexec package
#services --disabled kdump

# System timezone
timezone --utc Asia/Kolkata

# Install OS instead of upgrade
install

# Reboot after installation
reboot





# list of packages to be installed
%packages
@ Core
@ Base --nodefaults
bc
device-mapper-multipath
dos2unix
ipmitool
java
ksh
python-devel
rsync
tmux
sos
syslinux
vim-enhanced
xinetd
##ExtraPackages
perl-Switch
# packages deleted according to OS minimization
-firewalld
-iwl2000-firmware
-iwl5150-firmware
-iwl3160-firmware
-iwl1000-firmware
-iwl3945-firmware
-iwl100-firmware
-iwl6000g2b-firmware
-iwl6000g2a-firmware

# packages added according to OS minimization
%end

%post --log=/var/log/kickstart_post.log
echo "Installation Completed" > /tmp/install.out
date >> /tmp/install.out
%end