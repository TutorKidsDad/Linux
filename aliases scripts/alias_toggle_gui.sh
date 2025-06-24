#!/bin/bash

ALIAS_FILE="$HOME/.my_aliases"

declare -A GROUPS
GROUPS["Browsers"]="browser='firefox'\nchrome='google-chrome'\nbrave='brave-browser'"
GROUPS["Office"]="writer='libreoffice --writer'\ncalc='libreoffice --calc'\nimpress='libreoffice --impress'"
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

# Build alias file
echo "# User-defined Aliases via Zenity GUI" > "$ALIAS_FILE"
IFS=":" read -ra SELECTED <<< "$CHOICES"
for group in "${SELECTED[@]}"; do
    echo -e "\n# $group Aliases" >> "$ALIAS_FILE"
    echo -e "${GROUPS[$group]}" | sed 's/^/alias /' >> "$ALIAS_FILE"
done

# Source in shell configs
if ! grep -qF "source $ALIAS_FILE" ~/.bashrc; then
    echo "source $ALIAS_FILE" >> ~/.bashrc
fi
if [ -f ~/.zshrc ] && ! grep -qF "source $ALIAS_FILE" ~/.zshrc; then
    echo "source $ALIAS_FILE" >> ~/.zshrc
fi

zenity --info --text="Aliases updated! Run 'source ~/.bashrc' or restart terminal to apply."
