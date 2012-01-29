echo "--------------------"
echo "stop network manager..."
/etc/init.d/network-manager stop

echo "--------------------"
echo "remove ath6kl_usb module..."
rmmod ath6kl_usb
rmmod cfg80211
rmmod compat

echo "--------------------"
echo "insmod ath6kl_usb..."
modprobe ath6kl_usb
lsmod | grep ath6kl_usb
sleep 3

echo "--------------------"
echo "scanning AP ..."
ifconfig wlan1 up
sleep 1

iwlist wlan1 scanning | grep ESSID
sleep 1

echo "--------------------"
echo "connecting ...."
iwconfig wlan1 essid Atheros_XSpan_2G
sleep 3

echo "--------------------"
ifconfig wlan1 192.168.1.83 netmask 255.255.255.0

