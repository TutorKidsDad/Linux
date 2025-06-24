#!/bin/bash

ALIAS_FILE="$HOME/.my_aliases"

declare -A GROUPS
GROUPS["Browsers"]="browser='firefox'\nchrome='google-chrome'\nbrave='brave-browser'"
GROUPS["Office"]="writer='/opt/libreoffice25.2/program/swriter'\ncalc='/opt/libreoffice25.2/program/scalc'\nimpress='/opt/libreoffice25.2/program/simpress'"
GROUPS["System"]="diskspace='df -h'\nmemusage='free -h'\nupdate='sudo apt update && sudo apt upgrade -y'"
GROUPS["File Navigation"]="list='ls'\nlistall='ls -la'\ngo='cd'\nback='cd ..'\ngohome='cd ~'"
GROUPS["Development"]="editor='code'\npython3='python'\nide='code .'"
GROUPS["Git"]="gitclone='git clone'\ngitstatus='git status'\ngitpush='git push'"
GROUPS["Network"]="myip='hostname -I'\npinggoogle='ping 8.8.8.8'\nwifi='nmcli dev wifi'"

CHOICES=$(zenity --list --checklist --title="Enable Alias Groups" \
    --text="Select alias groups to enable" \
    --column="Enable" --column="Group" \
    FALSE "Browsers" \
    FALSE "Office" \
    FALSE "System" \
    FALSE "File Navigation" \
    FALSE "Development" \
    FALSE "Git" \
    FALSE "Network" \
    --separator=":")

if [ -z "$CHOICES" ]; then
    zenity --info --text="No alias groups selected. Exiting."
    exit 1
fi

# Remove previous Zenity alias block
sed -i '/# BEGIN ZENITY ALIASES/,/# END ZENITY ALIASES/d' "$ALIAS_FILE"

# Append new Zenity alias block
{
  echo -e "\n# BEGIN ZENITY ALIASES"
  echo "# User-defined Aliases via Zenity GUI"
  IFS=":" read -ra SELECTED <<< "$CHOICES"
  for group in "${SELECTED[@]}"; do
      echo -e "\n# $group Aliases"
      while IFS= read -r line; do
          if [[ "$line" =~ ^[a-zA-Z_][a-zA-Z0-9_]*=.*$ ]]; then
              echo "alias $line"
          fi
      done <<< "$(echo -e "${GROUPS[$group]}")"
  done
  echo "# END ZENITY ALIASES"
} >> "$ALIAS_FILE"

# Ensure it's sourced
if ! grep -qF "source $ALIAS_FILE" ~/.bashrc; then
    echo "source $ALIAS_FILE" >> ~/.bashrc
fi
if [ -f ~/.zshrc ] && ! grep -qF "source $ALIAS_FILE" ~/.zshrc; then
    echo "source $ALIAS_FILE" >> ~/.zshrc
fi

zenity --info --text="Aliases updated! Run 'source ~/.bashrc' or restart terminal to apply."

