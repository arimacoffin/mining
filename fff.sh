#!/bin/bash
waktu=$(date "+%Y-%m-%d %H:%M:%S")
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
header(){
printf "${CYAN}
 ___    ___  ______   __    ___  ______
|   \  /   |/      \ /  \  /   |/      \ 
|    \/    |   __   |    \/    |   __   |
|          |  |  |  |          |  |  |  |
|  |\__/|  |  |__|  |  |\__/|  |  |__|  |
|  |    |  |        |  |    |  |        |
|__|    |__|\______/|__|    |__|\______/

-----------------------------------------
	MINING FOLLOWERS MOMO-CHAN
-----------------------------------------
${NOCOLOR}
"
}
gas(){
data=$(curl -s "http://followers.interinstplus.com/api.php?method=order.get&device_id=$device_id&device_hash=$device_hash" -L)
getdata=$(echo $data | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
cek=$(echo $data | grep -ic "id")
if [[ $cek =~ "1" ]]; then
	oid=$(echo $getdata | awk '{print $1}')
	uid=$(echo $getdata | awk '{print $3}')
	username=$(echo $data | grep -Po '(?<=user_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	follow=$(curl -s "http://followers.interinstplus.com/api.php?method=order.follow&device_id=$device_id&device_hash=$device_hash&order_id=$oid&user_id=$uid&skip=0&info=ok")
	balance=$(curl -s "http://followers.interinstplus.com/api.php?method=balance.get&device_id=$device_id&device_hash=$device_hash")
	getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	printf "${GREEN}Follow $username - Balance $getbalance \n${NORMAL}"
fi
}
header
read -p "Input Device id : " device_id;
read -p "Input Device hash : " device_hash;
	for (( ; ; )); do
gas
done
