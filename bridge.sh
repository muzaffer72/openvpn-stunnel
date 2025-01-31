sudo apt install wget -y
openvpn_port="1194"
upstream_port="443"
upstream_ip="Openvpnipgiriniz"
fake_tls_sni="snitlssitesigiriniz"
read -rp "OpenVpn Port (Default : $openvpn_port) : " -e -i "$openvpn_port" openvpn_port
read -rp "Upstream Port (Default : $upstream_port) : " -e -i "$upstream_port" upstream_port
read -rp "Upstream IP : " -e -i "$upstream_ip" upstream_ip
read -rp "Fake TLS Domain (SNI) (Default : $fake_tls_sni) : " -e -i "$fake_tls_sni" fake_tls_sni
sudo apt install stunnel4 -y
cd /etc/stunnel/
sudo curl -O https://raw.githubusercontent.com/NixDeveeloper/openvpn-with-stunnel/master/stunnel-bridge.conf
sudo mv stunnel-bridge.conf stunnel.conf
sudo sed -i 's/openvpn_port/'$openvpn_port'/' stunnel.conf
sudo sed -i 's/upstream_port/'$upstream_port'/' stunnel.conf
sudo sed -i 's/upstream_ip/'$upstream_ip'/' stunnel.conf
sudo sed -i 's/fake_tls_sni/'$fake_tls_sni'/' stunnel.conf
sudo /etc/init.d/stunnel4 restart
echo "###################################"
echo "Everything is ok . copy openvpn config file from upstream server to your pc"
echo "1 - Edit ovpn file"
echo "2 - replace tcp-client to tcp"
echo "3 - replace remote ip to your bridge ip"
echo "4 - save"
echo "5 - import config to your OpenVpn Client application and connect"
echo "5 - Enjoy"
echo "###################################"
