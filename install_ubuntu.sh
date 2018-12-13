#!/bin/bash

# OpenZWave
installOZW()
{
	sudo apt-get install libudev-dev -y
	git clone https://github.com/OpenZWave/open-zwave.git
	cd open-zwave
	make -j`nproc`
	sudo make install
	cd ..
}

# Poco
installPoco()
{
	sudo apt-get install openssl libssl-dev -y
	git clone https://github.com/pocoproject/poco.git
	cd poco
	git checkout poco-1.9.0
	mkdir cmake-build
	cd cmake-build
	cmake ..
	make -j`nproc`
	sudo make install
	cd ..
	cd ..
}

# Fitplib
installFitplib()
{
	sudo apt-get install libglib2.0-dev libmosquittopp-dev -y
	git clone https://github.com/BeeeOn/fitplib.git
	cd fitplib
	mkdir build
	cd build
	cmake ..
	make -j2
	sudo make install
	cd ..	
}

#Gateway
installGateway()
{
	sudo apt-get install libcppunit-dev libmosquittopp-dev libudev-dev libbluetooth-dev mosquitto mosquitto-clients -y
	mosquitto -d
	git clone https://github.com/BeeeOn/gateway.git
	cd gateway
	git submodule init
	git submodule update
	mkdir cmake-build
	cd cmake-build
	cmake ..
	make -j`nproc`
	cd ..
	cd ..
}

sudo apt-get install git cmake make g++ -y

installOZW
installPoco
installFitplib
installGateway

