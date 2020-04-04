#/bin/bast

clear

echo "\n\t \033[0;31m # Created by : NinjaKen\033[0m\n\n"

echo "\t[0] Set Mac Address Manually"
echo "\t[1] Set Mac Address Automatically"
echo "\t[2] Reset Mac Address from Origina\n\n"

read -p "Choose : " opt1

	if [  $opt1 -eq "0" ]
	then

		read -p "\nEnter Network Interface (default: eth0): " n1

		read -p "Enter Mac Address : (default: EA:48:B8:9C:E8:6B): " n2

		if [ -z "$n1" ]
		then
	
			n1="eth0"
		fi

		if [ -z "$n2" ]
		then
		n2="-m EA:48:B8:9C:E8:6B $n1"
		fi
	elif [ $opt1 -eq "1" ]
	then
		read -p "\nEnter Network Interface (default: eth0): " n1

		if [ -z "$n1" ]
		then

			n1="eth0"
		fi
		
		n2="-r $n1"


	elif [ $opt1 -eq "2" ]
	then
		
		read -p  "\nEnter Network Interface (default: eth0): " n1

		if [ -z "$n1" ]
		then
			n1="eth0"
		fi

		n2="-p  $n1"

	else
		echo "\nINVALID INPUT!!!!"
	fi




		ifconfig $n1 down
		macchanger $n2
		ifconfig $n1 up
