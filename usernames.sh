#!/bin/bash

# get the USERID for $MACHINE. Stuff needs to go in the quotes
if [ $MACHINE == "" ]
	then
	USERID=""
fi

# Set BRIDGEIP (Change this, obvs.)
BRIDGEIP="http://127.0.0.1"

# if [ $MACHINE == "raspi-1" ]
#	then
#	USERID="?"
# fi



# Light ON
#curl -H "Content-Type: application/json" -X PUT -d '{"on":true}' http://192.168.1.2/api/4eM8zAdFZzedyVNPCniKSw9afK6oi6unHSSysPEl/lights/3/state

# Light OFF
#curl -H "Content-Type: application/json" -X PUT -d '{"on":false}' http://192.168.1.2/api/4eM8zAdFZzedyVNPCniKSw9afK6oi6unHSSysPEl/lights/3/state
