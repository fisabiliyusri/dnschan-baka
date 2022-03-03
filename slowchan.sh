ip=brabreadth.boxnetslowdns.com
cd /usr/local
wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz
tar xvf go1.16.2.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
cd /root
apt install git -y
git clone https://www.bamsoftware.com/git/dnstt.git temp
mv /root/temp /root/dnstt
rm -rf temp
cd /root/dnstt/dnstt-server
go build
./dnstt-server -gen-key -privkey-file /root/dnstt/dnstt-server/server.key -pubkey-file /root/dnstt/dnstt-server/server.pub
sudo sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
service ssh restart
sudo echo "screen -dmS slowdns iptables -I INPUT -p udp --dport 5300 -j ACCEPT && iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300 && ulimit -u unlimited && ulimit -n 65536 && /root/dnstt/dnstt-server/dnstt-server -udp :5300 -privkey-file /root/dnstt/dnstt-server/server.key $ip 127.0.0.1:443" > /bin/slow
sudo chmod +x /bin/slow
clear
cat /root/dnstt/dnstt-server/server.pub
