# HomeHue
Controlling Philips Hue bulbs via a Raspberry Pi (or MacOS, or other \*nix machine)

### Requirements
- Machine - You'll need a machine with a bash shell
- jq - In order for the scripts to parse the hated JSON (and it's copious punctuational syrup) you will need to install jq. Here https://stedolan.github.io/jq/
- IP Address- You will need to know you bridge's IP address. Easiest way is to just go here: https://www.meethue.com/api/nupnp
- Knowledge - You will need to have some basic knowledge of the command line. I've tried to comment the ass out of this thing, because "self-commentig code" is a bullshit phrase spouted to avoid work by people who've forgotten what it was like when they first started and everything was frustratingly confusing.

### What Does All This Crap Do?
There are three files that you'll want to understand
- Get-UserID.sh - Ideally you should only have to use this once, the first time you set stuff up. **Important note:** this script edits another script (`conf.sh`) with what it gets back from the Hue bridge. You *must* press the bridge's "link" button *before* running this script. If you don't it will break `conf.sh`. (It's pretty easy to fix.)
- This is where all the configuration stuff (except getting the username) happens. It's broken out for modularity.
- ControlTheLights.sh	- Whis is, as they say, where the magic happens. Currently (April, 2017) it just has functions to turn the lights on and off, singly or all at once. If you want to add new features, this is the place to do it. What it does currently is listens for button pushes, and then runs a function based on which button. (Currently, only one button works, 'cause I haven't decided to do with the others.
