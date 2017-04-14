#!/bin/bash


MACHINE="MacBookAir"

source ./usernames.sh

# Function to determine a light's state
light_state () {
 	STATE=`curl http://192.168.1.2/api/$USERID/lights/$1 | jq '.state | .on'`
 	#return $STATE
 }

 
# Get info on the door light
#curl http://192.168.1.2/api/$USERID/lights/3 | jq '.state | .on'

light_state 3
echo $STATE

# test the door light
#curl -H "Content-Type: application/json" -X PUT -d '{"on":true}' http://192.168.1.2/api/$USERID/lights/3/state
#sleep 1
#curl -H "Content-Type: application/json" -X PUT -d '{"on":false}' http://192.168.1.2/api/$USERID/lights/3/state



# {"state":{"on":false,"bri":178,"hue":627,"sat":247,"effect":"none","xy":[0.6606,0.3281],"ct":500,"alert":"none","colormode":"xy","reachable":true},"type":"Extended color light","name":"Door 1","modelid":"LCT001","manufacturername":"Philips","uniqueid":"00:17:88:01:00:b5:c4:45-0b","swversion":"5.23.1.13452"}%


