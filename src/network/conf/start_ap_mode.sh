# This script stops wpa supplicants for connecting with Wi-Fi router and start access point mode.
sudo killall wpa_supplicant
sudo ifconfig wlan0 down
sudo ifconfig wlan0 192.168.4.1 netmask 255.255.255.0 up
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf &
sudo node wifi_conf.js
