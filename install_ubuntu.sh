#!/bin/bash

# OpenZWave
install_ozw()
{
	apt-get install libudev-dev -y
	git clone https://github.com/OpenZWave/open-zwave.git
	cd open-zwave
	make -j`nproc`
	make install
	cd ..
}

# Poco
install_poco()
{
	apt-get install openssl libssl-dev -y
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
install_fitplib()
{
	apt-get install libglib2.0-dev libmosquittopp-dev -y
	git clone https://github.com/BeeeOn/fitplib.git
	cd fitplib
	mkdir build
	cd build
	cmake ..
	make -j2
	sudo make install
	cd ..
	cd ..
}

# Gateway
install_gateway()
{
	apt-get install libcppunit-dev libmosquittopp-dev libudev-dev libbluetooth-dev mosquitto mosquitto-clients -y
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

apt-get install git cmake make g++ -y

install_ozw
install_poco
install_fitplib
install_gateway
