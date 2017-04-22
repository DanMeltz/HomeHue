#!/bin/bash

# Not sure how the lights' humbers keep getting screwed up, but I'm listing 'em here for future screw ups.
# You'll need to get the numbers of your lights. You can do this on the Hue app, or via the API. 
# I don't feel like writing code to parse the JSON for something that should happen that rarely.
# You can put more than three in there, this is just what the default "boxed set" comes with.
LIGHTS=(1 2 3)

# We need the IP of the Hue Bridge (you need to replace this with YOUR IP number):
BRIDGEIP="http://127.0.0.1"

# I'm using a USB four-button device I got from the internet. It's four buttons enter a, b, c, and d. 
# They're defined here so that other devices can be used.
BUTTON1="a"
BUTTON2="b"
BUTTON3="c"
BUTTON4="d"

# Gotta have a name if'n ya wants to talk to the bridge (put the name you want for your device in the quotes):
NAME=""

# set the username (which is a long string of gobledegook)
username=""