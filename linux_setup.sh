#~/bin/bash
echo "Configuration: Disable Firewall"
sleep 5
systemctl stop firewalld && systemctl disable firewalld
echo "Configuration: Disable Selinux"
sleep 5
setenforce 0 && sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
echo "Configuration: Disable and Remove NetworkManager"
sleep 5
systemctl stop NetworkManager && systemctl disable NetworkManager
echo "Configuration: Install basic apps"
sleep 5
yum install -y net-tools nc wget tcpdump iperf3 nmap curl bind-utils nfs-utils
echo "Configuration: Update Centos - Server will reboot"
sleep 5
yum -y update && touch ~/postinstall.completed && reboot
