#!/bin/bash
##################################Path All
padd="/etc/alternatives/proxychains"
pcadd="/etc/proxychains.conf"
sadd="/usr/share/applications/steam.desktop"
oldadds="/usr/bin/steam %U"
newadds="/etc/alternatives/proxychains /usr/bin/steam %U"
##################################Any key pass
get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
#################################Root check
#################################Main
main(){
echo "Hello Friend Welcome to install This command."
echo "This shell can help you ues the proxy in SteamPowered"
echo "But you must check the authority,it needs root atuhority"
echo "This shell was bron without the support of the open source project 'proxychains'"
echo "Thanks the open source project 'proxychains' again"
echo "And my English level is not too good , please understand , Thank you"
echo "If you ready,Please look down"
echo "Press any key to continue/Ctrl+C to Exit..."
char=`get_char`
###########################################Any key enter
###########################################Root check
#Address "/etc/alternatives/proxychains"
echo -e "----------------------------------------------------"
if [ ! -f "/etc/alternatives/proxychains" ];then
echo "You don't have Proxychains"
echo "Press any key to install/Ctrl+C to Exit..."
char=`get_char`
apt-get install proxychains
echo "Proxychains installing and check passed"
else
echo "Proxychains check passed"
fi
###########################################Proxychains software check
#Address "/usr/share/applications/steam.desktop"
echo -e "----------------------------------------------------"
if [ ! -f "/usr/share/applications/steam.desktop" ];then
echo "You don't have Steam"
echo "Please install steam before running this shell"
echo "Download Steam , Please visit this website 'steampowered.com'"
exit;
else
echo "Steam check passed"
fi
###########################################Steam check
echo -e "----------------------------------------------------"
echo "OK you passed all of the check"
echo "We will set something"
echo "It maybe a little difficult , But I think you can finish it"
echo "Good luck"
###########################################Passed check
while [ "$typeproxy" != '5' ] && [ "$typeproxy" != '4' ]
        do
                echo -e "----------------------------------------------------"
                echo -e "First you will set the type of your proxy."
                echo -e "You have two choices.But you can change it after install this shell"
                echo -e "----------------------------------------------------"
                read -p "Fill in your Proxy type [socks] (4/5): " typeproxy;
        done
        if [ "$typeproxy" == '4' ];then
              echo "You choose 'Socks4'";
	      else
	      echo "You choose 'Socks5'";
        fi
##########################################Socks type
                echo -e "----------------------------------------------------"
                echo -e "Then you will set the server of your proxy."
                echo -e "You can fill in any IP address or the domain name"
                echo -e "----------------------------------------------------"
		read -p "Fill in your Proxy Server (Socks$typeproxy): " addproxy
##########################################Socks IP
                echo -e "----------------------------------------------------"
                echo -e "After that you will set the port of your proxy."
		echo -e "You can fill in any port"
                echo -e "----------------------------------------------------"
		read -p "Fill in your Proxy Port (0-65535): " portproxy
#########################################Socks Port
echo "Please check your setting"
echo "Proxy type : Socks$typeproxy"
echo "Proxy address : $addproxy"
echo "Proxy port : $portproxy"
echo "If you ready,Press any key to continue/Ctrl+C to Exit..."
char=`get_char`
########################################Check OK
#Deff Poxy "socks4  127.0.0.1 9050"
#Config Address "/etc/proxychains.conf"
sed -ig "s/socks4/socks$typeproxy/g" /etc/proxychains.conf
sed -ig "s/127.0.0.1/$addproxy/g" /etc/proxychains.conf
sed -ig "s/9050/$portproxy/g" /etc/proxychains.conf
echo "Proxy setting (1/2)"
#Steam Address "/usr/share/applications/steam.desktop"
sed -ig "s#$oldadds#$newadds#g" /usr/share/applications/steam.desktop
mkdir /root/.config/l2sp
dd   if=/dev/zero   of=/root/.config/l2sp/installok   bs=1M   count=2
echo "Proxy setting (2/2)"
echo "Congratulations , you can use Steam with proxy"
echo "If you want to manage proxy , please run this shell again"
echo "If you want to change Proxy config , you can edit '/etc/proxychains.conf'"
echo "Have a nice day"
}
reinstall(){
	echo "Press any key to continue/Ctrl+C to Exit..."
        char=`get_char`
	apt remove proxychains -y
        sed -ig "s#$newadds#$oldadds#g" /usr/share/applications/steam.desktop
	rm -rf /root/.config/l2sp/
	rm -rf $pcadd
	main
}
uninstall(){
	echo "Press any key to continue/Ctrl+C to Exit..."
        char=`get_char`
	apt remove proxychains -y
        sed -ig "s#$newadds#$oldadds#g" /usr/share/applications/steam.desktop
	rm -rf /root/.config/l2sp/
	rm -rf $pcadd
	echo "Thanks for your suppost , Bye."
}
shutdownpy(){
	echo "Press any key to continue/Ctrl+C to Exit..."
        char=`get_char`
        if cat /usr/share/applications/steam.desktop | grep "$padd">/dev/null
	then
        sed -ig "s#$newadds#$oldadds#g" /usr/share/applications/steam.desktop
	echo "OKay,The proxy has been shutdown"
	exit;
        else
        echo "You have shutdown this Proxy"
        echo "Please run it or exit"
        exit

        fi
}
bootpy(){
	echo "Press any key to continue/Ctrl+C to Exit..."
        char=`get_char`
	if cat /usr/share/applications/steam.desktop | grep "$padd">/dev/null
        then
        echo "You have ran this Proxy"
        echo "Please shutdown it or exit"
        exit;
else
	sed -ig "s#$oldadds#$newadds#g" /usr/share/applications/steam.desktop
        echo "OKay,The proxy has been running"
       fi
}
pysta(){
	if cat /usr/share/applications/steam.desktop | grep "$padd">/dev/null
        then
        pystat="Running"
	if4
        exit;
else
        pystat="Closed"
	if4
       fi

}
if1(){
        while [ "$choice" != 'reinstall' ] && [ "$choice" != 'uninstall' ] && [ "$choice" != 'start' ] && [ "$choice" != 'shutdown' ]
        do
                echo -e "First you will set the type of your proxy."
                echo -e "You can fill in (reinstall/uninstall/start/shutdown)"
                read -p "Fill in your choice: " choice;
        done
        if [ "$choice" == 'reinstall' ];then
              reinstall
              else
           if3
        fi
}
if2(){
	if [ "$choice" == 'uninstall' ];then
		uninstall
	else
	if3	
	fi
}
if3(){
	if [ "$choice" == 'start' ];then
                bootpy
        else
                shutdownpy
        fi
}
if4(){
if [ ! -f "/root/.config/l2sp/installok" ];then
	main
else
echo "You installed this shell , you can set something"
echo "For example Reinstall , Uninstall , Shutdown or Start"
echo "Proxy status : $pystat"
if1
fi
}
if [ `whoami` != "root" ];then
 echo "Faild, you need root authority!"
 exit;
else
 echo "Root Check Passed"
 pysta
fi
