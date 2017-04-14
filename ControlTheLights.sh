#!/bin/bash

LIGHTS=(2 3 7 8 9 10)

MACHINE="MacBookAir"
source ./usernames.sh

# Function to turn light ON
light_on () {
   	curl -H "Content-Type: application/json" -X PUT -d '{"on":true}' http://192.168.1.2/api/$USERID/lights/$1/state
   }

# Function to turn light OFF
light_off () {
   	curl -H "Content-Type: application/json" -X PUT -d '{"on":false}' http://192.168.1.2/api/$USERID/lights/$1/state
   }

# Function to determine a light's state
light_state () {
 	STATE=`curl http://192.168.1.2/api/$USERID/lights/$1 | jq '.state | .on'`
 }

# Function to toggle lights' state
light_toggle () {
	for thislight in "${LIGHTS[@]}"
	do
		echo $thislight
		light_state $thislight
		if [ $STATE == "false" ]
			then
			light_on $thislight
		else
			light_off $thislight
		fi
	done
}


light_toggle




# Get info on the door light
#curl http://192.168.1.2/api/$USERID/lights/3 | jq '.state | .on'

#light_state 3
#echo $STATE

# test the door light
#curl -H "Content-Type: application/json" -X PUT -d '{"on":true}' http://192.168.1.2/api/$USERID/lights/3/state
#sleep 1
#curl -H "Content-Type: application/json" -X PUT -d '{"on":false}' http://192.168.1.2/api/$USERID/lights/3/state



# {"state":{"on":false,"bri":178,"hue":627,"sat":247,"effect":"none","xy":[0.6606,0.3281],"ct":500,"alert":"none","colormode":"xy","reachable":true},"type":"Extended color light","name":"Door 1","modelid":"LCT001","manufacturername":"Philips","uniqueid":"00:17:88:01:00:b5:c4:45-0b","swversion":"5.23.1.13452"}%


