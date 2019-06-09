#~/bin/bash
echo "Configuration: Disable Firewall"
sleep 30
systemctl stop firewalld && systemctl disable firewalld
echo "Configuration: Disable Selinux"
sleep 30
setenforce 0 && sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
echo "Confifuration: Disable and Remove NetworkManager"
sleep 30
systemctl stop NetworkManager && systemctl disable NetworkManager
echo "Configuration: Install basic apps"
sleep 30
yum install -y net-tools nc wget tcpdump iperf3 nmap curl bind-utils
echo "Configuration: Update Centos - Server will reboot"
echo 30
yum -y update && touch ~/postinstall.completed && reboot
