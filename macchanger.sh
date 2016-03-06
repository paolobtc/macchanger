#!/bin/bash
#change wlp3s0, username and /path/to/icon.png with appropriate values

sudo ifconfig wlp3s0 down && 
sudo macchanger -r wlp3s0 && 
sudo ifconfig wlp3s0 up && 
sudo systemctl restart NetworkManager && 
newmac=$(macchanger -s wlp3s0 | grep -i 'Current MAC:' | tr -d 'Current MAC ' | tr -d '(unknown)' |sed 's/://') && 
sudo -u username notify-send -i /path/to/icon.png "Mac address changed successfully. " "newmac"
