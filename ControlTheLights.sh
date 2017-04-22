#!/bin/bash

# Gonna need a username. It's tied to the machine. You'll also need the IP of the bridge. These and more
# are in conf.sh. So let's source that. 
source ./conf.sh

# Function to turn a light light ON
light_on () {
   	curl -H "Content-Type: application/json" -X PUT -d '{"on":true}' $BRIDGEIP/api/$USERNAME/lights/$1/state
   }

# Function to turn light OFF
light_off () {
   	curl -H "Content-Type: application/json" -X PUT -d '{"on":false}' $BRIDGEIP/api/$USERNAME/lights/$1/state
   }

# Function to determine a light's state
light_state () {
 	STATE=`curl http://192.168.1.2/api/$USERNAME/lights/$1 | jq '.state | .on'`
 }

# Function to toggle lights' state
light_toggle () {
	for thislight in "${LIGHTS[@]}"
	do
		light_state $thislight
		if [ $STATE == "false" ]
			then
			light_on $thislight
		else
			light_off $thislight
		fi
	done
}

while [ true ]
	do
		read -rsn1 BUTTON
		if [ $BUTTON == "a" ]
			then
			light_toggle
		elif [ $BUTTON == "b" ]
			then
			echo "b"
		elif [ $BUTTON == "c" ]
			then
			echo "c"
		elif [ $BUTTON == "d" ]
			then
			echo "hi"
		fi
	done




# light_toggle



# Get info on the door light
#curl http://192.168.1.2/api/$USERNAME/lights/3 | jq '.state | .on'
