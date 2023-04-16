#!/usr/bin/env bash

YW=`echo "\033[33m"`
BL=`echo "\033[36m"`
RD=`echo "\033[01;31m"`
CM='\xE2\x9C\x94\033'
GN=`echo "\033[1;92m"`
CL=`echo "\033[m"`

# EXIT ON ERROR
set -e

sudo apt install boxes -y

# SET TIME FOR STATISTICS
START_TIME="$(data)"
END_TIME=""
CURRENT_IP="$()"

echo "---BEGIN---" >> log.d
echo "" >> log.d
echo "IP: $CURRENT_IP - Start: $START_TIME" >> log.d
echo "---END---" >> log.d

# Create local bin
# mkdir ~/bin

function show_menu {
    while true; do
        read -p "DO you want to use the defaul setting? (y/n)?" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    clear
}

function display_header {
    cat << "_EOF_"
       _,.
     ,` -.)
    '( _/'-\\-.               
   /,|`--._,-^|            ,     
   \_| |`-._/||          ,'|       
     |  `-, / |         /  /      
     |     || |        /  /       
      `r-._||/   __   /  /  
  __,-<_     )`-/  `./  /
 '  \   `---'   \   /  / 
     |           |./  /  
     /           //  /     
 \_/' \         |/  /         
  |    |   _,^-'/  /              
  |    , ``  (\/  /_        
   \,.->._    \X-=/^         
   (  /   `-._//^`  
    `Y-.____(__}              
     |     {__)           
           ()`     
_EOF_
}

function header_info {
echo -e "${RD}
  ___    __  __  ____   _______  _________ 
 |__ \  |  \/  |/ __ \ |__  __|  \__   __/
    ) | | \  / | |  | |  | |        | |   
   / /  | |\/| | |  | |  | |        | |   
  / /_  | |  | | |__| |  | |        | |   
 /____|  _|  |_|\___\_\  |_|        |_|   
                               
${CL}"
}

header_info
display_header
show_menu

set -o errexit 
set -o errtrace 
set -o nounset 
set -o pipefail 
shopt -s expand_aliases
alias die='EXIT=$? LINE=$LINENO error_exit'
CHECKMARK='\033[0;32m\xE2\x9C\x94\033[0m'
trap die ERR
trap cleanup EXIT