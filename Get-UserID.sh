#!/bin/bash

# WARNING, this will REPLACE the username in conf.sh. If you don't press the link button on the bridge before 
# running this script, that line will be broken. I THINK you should only have to run this script one time per
# device, but I've found the hue bridge to be flaky in other ways, so....

source ./conf.sh

# This is a hack to get the name into the POST data. There's probably a cleaner way, but I wanted to get it working.
POSTDATA="{\"devicetype\":\"my_hue_app#$NAME\"}"

echo $POSTDATA
echo "Username is: " $USERNAME

# And let's make friends with the bridge and get our username. This will then REPLACE the last line in conf.sh
USERNAME=`curl -H "Content-Type: applica2/apijson" -X POST -d $POSTDATA $BRIDGEIP/api jq -r '.[] | .success.username'`
sed -i '' -e '$ d' conf.sh
echo "username=" $USERNAME >> conf.sh