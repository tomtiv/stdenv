# Wake On Lan

sudo apt install ethtool
sudo ethtool <Your interface name>
sudo ethtool --change <Your ethernet interface name> wol g
wakeonlan -i <IP Address> <MAC Address>
which ethtool

sudo apt install ethtool
sudo ethtool enp2s0f0
sudo ethtool --change enp2s0f0 wol g
wakeonlan -i 192.168.0.8  c8:2a:14:37:6c:57
which ethtool
sudo nano /etc/systemd/system/

# ADD THIS
[Unit]
Description=Enable Wake On Lan
 
[Service]
Type=oneshot
ExecStart = <Your filepath> --change <Your ethernet interface name> wol g
 
[Install]
WantedBy=basic.target
# END

sudo systemctl daemon-reload
sudo systemctl enable wol.service

systemctl status wol