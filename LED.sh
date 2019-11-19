#!/bin/bash

DIR71="/sys/class/gpio/gpio71"
DIR233="/sys/class/gpio/gpio233"
if [ ! -d "$DIR71" ];
	then
		echo "71" > /sys/class/gpio/export
		echo "out" > /sys/class/gpio/gpio71/direction
fi
if [ ! -d "$DIR233" ];
	then
		echo "233" > /sys/class/gpio/export
		echo "out" > /sys/class/gpio/gpio233/direction
		while :
		do
 		if [ $(cat /sys/class/gpio/gpio233/value) -eq 0 ];
			then
				echo "1" > /sys/class/gpio/gpio233/value
			else
				echo "0" > /sys/class/gpio/gpio233/value
		fi
		done
elif [ -d "$DIR233" ];
	then
		while :
		do
		if [ $(cat /sys/class/gpio/gpio233/value) -eq 0 ];
			then
				echo "1" > /sys/class/gpio/gpio233/value
			else 
				echo "0" > /sys/class/gpio/gpio233/value
		fi
		done
fi
