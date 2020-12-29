#!/bin/bash

echo "*************************************************"
echo "            Welcome to the C2 Cradle!            "
echo "*************************************************"
echo ""
echo "======>Which C2 would you like to stand up?"
echo "1 => Mythic"
echo "2 => MacC2"
echo "3 => DeimosC2"
echo "4 => EvilOSX"
echo "5 => MacShellSwift"
echo "6 => Sliver"
echo "7 => CHAOS"
echo "8 => Empire"

read response

if [[ "$response" == "1" ]];then
        echo "[+] Mythic C2 selected. Running setup now..."
	cd Mythic-setup && git clone https://github.com/its-a-feature/Mythic && cd Mythic 
	read -p "----> Do you need to make any changes to the Mythic default config (Y/N)? " answer
	if [[ ("$answer" == "Y") || ("$answer" == "y") ]];then
		echo "****The Mythic config file is located at Mythic-setup/Mythic/mythic-docker/config.json****"
		read -p "==>The script will pause here until you have made the necessary config edits. Once done press any key to continue..." pause
		./start_mythic.sh
	else
		./start_mythic.sh
	fi

elif [[ "$response" == "2" ]]; then
        echo "[+] MacC2 selected. Running setup now..."
        cd MacC2-setup && git clone https://github.com/cedowens/MacC2 && cd MacC2
	chmod +x setup.sh && ./setup.sh

elif [[ "$response" == "3" ]]; then
	echo "[+] Deimos C2 selected. Running setup now..."
	cd DeimosC2-setup && curl -LO https://github.com/DeimosC2/DeimosC2/releases/download/1.1.0/DeimosC2_linux.zip && unzip DeimosC2_linux.zip
	docker build --no-cache -t deimosc2-docker .
	docker volume create deimosc2
	sudo docker run --rm --network="host" -v deimosc2:/deimosapp -ti deimosc2-docker

elif [[ "$response" == "4" ]]; then
	echo "[+] EvilOSX C2 selected. Running setup now..."
	cd EvilOSX-setup && git clone https://github.com/Marten4n6/EvilOSX && cp Dockerfile EvilOSX/Dockerfile && cd EvilOSX/ 
	docker build --no-cache -t evilosx-docker .
	docker volume create evilosx
	sudo docker run --rm --network="host" -v evilosx:/EvilOSX -ti evilosx-docker

elif [[ "$response" == "5" ]]; then
	echo "[+] MacShellSwift C2 selected. Running setup now..."
	cd MacShellSwift-setup && git clone https://github.com/cedowens/MacShellSwift && cd MacShellSwift/MacShellSwift
	chmod +x run.sh && ./run.sh	

elif [[ "$response" == "6" ]]; then
	echo "[+] Sliver C2 selected. Running setup now..."
	cd Sliver-setup && curl -LO https://github.com/BishopFox/sliver/releases/download/v1.2.0/sliver-server_linux.zip && unzip sliver-server_linux.zip  && cp Dockerfile artifacts/linux/Dockerfile && cd artifacts/linux
	docker build --no-cache -t sliver-docker .
	docker volume create sliverc2
	sudo docker run --rm --network="host" -v sliverc2:/sliverc2 -ti sliver-docker
	cd ../.. && rm -rf artifacts/ sliver-server_linux.zip

elif [[ "$response" == "7" ]]; then
	echo "[+] CHAOS C2 selected. Running setup now..."
	cd CHAOS-setup && git clone https://github.com/tiagorlampert/CHAOS && cp Dockerfile CHAOS/Dockerfile
	docker build --no-cache -t chaosc2-docker .
	docker volume create chaosc2
	sudo docker run --rm --network="host" -v chaosc2:/chaosc2:ro -ti chaosc2-docker

elif [[ "$response" == "8" ]]; then
	echo "[+] Empire C2 selected. Running setup now..."
	docker pull bcsecurity/empire:latest
	sudo docker run --rm --network="host" -ti bcsecurity/empire:latest

fi 
