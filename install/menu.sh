#!/bin/bash
# GooPlex Menu

# --------------------------
# Step #1: Define variables
# --------------------------

EDITOR=nano
PASSWD=/etc/passwd
STD='\033[0m'
RED='\033[00;31m'
GRN='\033[00;32m'
YLW='\033[00;33m'

# -------------------------------
# Step #2: User defined function
# -------------------------------

pause(){
  read -p "Press [Enter] key to return to the menu..." fackEnterKey
}

# Option 1
apps(){
  clear
  bash /opt/GooPlex/install/apps/menu.sh
  clear
  pause
}

# Option 2
server(){
  clear
  bash /opt/GooPlex/install/server/menu.sh
  pause
}

# Option 3
misc(){
  clear
  bash /opt/GooPlex/install/server/menu.sh
  pause
}

# Option 4
quit(){
  clear
  echo ""
  echo "---------------------------------------------"
  echo " Visit the menu any time by typing 'gooplex' "
  echo "---------------------------------------------"
  echo ""
  exit
}

# Function to display menus
show_menus() {
	clear
	echo ""
	echo "-------------------------"
	echo " G O O P L E X - M E N U "
	echo "-------------------------"
	echo ""
	echo -e "${GRN}1.${STD} Install and maintain Apps"
	echo -e "${GRN}2.${STD} Server maintenance"
	echo -e "${GRN}3.${STD} Additional options"
	echo -e "${YLW}4.${STD} Exit menu"
}

# Read input from the keyboard and take a action
read_options(){
  local choice
    read -p "Enter choice [ 1 - 3] " choice
    case $choice in
      1) apps ;;
      2) server ;;
      3) misc ;;
      4) quit ;;
      *) echo -e "${RED}Please select a valid option${STD}" && sleep 2
    esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# ------------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
  show_menus
  read_options
done
