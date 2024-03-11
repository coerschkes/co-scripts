#!/bin/bash

update_js_libs(){
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This load>

# Load Angular CLI autocompletion.
source <(ng completion script)

nvm install node
nvm install-latest-npm
npm install -g @angular/cli
ng version
}

#update dependencies
sudo apt update &&
sudo apt upgrade -y &&
sudo apt autoremove -y &&
#update snaps
sudo snap refresh &&
#update nordvpn
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) &&
#update js stuff
update_js_libs


