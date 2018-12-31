#!/bin/bash
# Code by Momo-chan
# Thanks for Cahyoo !
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
        MINING LIKE MOMO-CHAN
-----------------------------------------
${NOCOLOR}
"
}
gas(){
device_id="TARUH DEVICE ID DISINI" #Device ID
device_hash="TARUH DEVICE HASH DISINI" #Device Hash
data=$(curl -s "https://likes.interinstplus.com/api.php?method=photo.get&device_id=$device_id&device_hash=$device_hash" -L)
getdata=$(echo $data | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
cek=$(echo $data | grep -ic "id")
if [[ $cek =~ "1" ]]; then
	oid=$(echo $getdata | awk '{print $1}')
	pid=$(echo $getdata | awk '{print $3}')
	id=$(echo $data | grep -Po '(?<=user_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	follow=$(curl -s "https://likes.interinstplus.com/api.php?method=photo.like&device_id=$device_id&device_hash=$device_hash&order_id=$oid&skip=0&info=ok&photo_id=$pid")
	balance=$(curl -s "https://likes.interinstplus.com/api.php?method=balance.get&device_id=$device_id&device_hash=$device_hash")
	getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	printf "${GREEN}SUCCES - Balance $getbalance \n${NORMAL}"
fi
}
header
	for (( ; ; )); do
gas
done
