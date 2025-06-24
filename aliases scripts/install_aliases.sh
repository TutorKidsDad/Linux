#!/bin/bash

ALIAS_FILE="$HOME/.my_aliases"

echo "📦 Installing custom aliases to $ALIAS_FILE..."

cat <<EOF > "$ALIAS_FILE"
# 🌐 Browsers
alias browser='firefox'
alias chrome='google-chrome'
alias brave='brave-browser'

# 📄 Office
alias writer='/opt/libreoffice25.2/program/swriter'
alias calc='/opt/libreoffice25.2/program/scalc'
alias impress='/opt/libreoffice25.2/program/simpress'



# 🛠️ Development
alias editor='code'
alias python3='python'
alias ide='code .'

# 🧰 System Tools
alias files='nemo'
alias terminal='gnome-terminal'
alias clean='sudo apt autoremove && sudo apt clean'
alias update='sudo apt update && sudo apt upgrade -y'

# 🎵 Media
alias playmusic='rhythmbox'
alias videos='vlc'
alias screenshot='gnome-screenshot -i'

# 🔍 Utilities
alias search='gnome-search-tool'
alias weather='curl wttr.in'
alias today='cal -3'

# 💾 Package Management
alias install='sudo apt install'
alias removeapp='sudo apt remove'
alias searchpkg='apt search'

# ⚡ Shell Helpers
alias clr='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd ~'

# 🗂️ File Management
alias list='ls'
alias listall='ls -la'
alias showtree='tree'
alias makefile='touch'
alias makefolder='mkdir'
alias remove='rm'
alias removedir='rm -r'
alias safe-remove='rm -i'
alias move='mv'
alias copy='cp'
alias copyall='cp -r'
alias rename='mv'
alias open='xdg-open .'

# 📂 Navigation
alias go='cd'
alias back='cd ..'
alias up='cd ../..'
alias gohome='cd ~'
alias whereami='pwd'
alias drive='lsblk'

# 🔍 Search
alias searchfile='find . -name'
alias searchall='find / -name'
alias searchtext='grep -r'
alias searchignore='grep -ri'
alias count='wc -l'
alias countfiles='ls | wc -l'

# 🧠 System Info
alias diskspace='df -h'
alias memusage='free -h'
alias cpuinfo='lscpu'
alias sysinfo='neofetch'
alias uptime='uptime'
alias whoisonline='who'

# ⚙️ Processes
alias processes='ps aux'
alias topapps='top'
alias killit='kill'
alias killforce='kill -9'

# 🔧 System Commands
alias clearit='clear'
alias shutdownnow='sudo shutdown now'
alias rebootnow='sudo reboot'

# 📦 Archives
alias extract='tar -xvf'
alias zipit='zip -r'
alias unzipit='unzip'
alias gzextract='gunzip'

# 🧑‍💻 Network
alias myip='hostname -I'
alias netstat='ss -tuln'
alias pinggoogle='ping 8.8.8.8'
alias connects='netstat -tulpn'
alias wifi='nmcli dev wifi'

# 📁 Git Shortcuts
alias gitclone='git clone'
alias gitstatus='git status'
alias gitadd='git add .'
alias gitcommit='git commit -m'
alias gitpush='git push'
EOF

if ! grep -qF "source $ALIAS_FILE" ~/.bashrc; then
    echo "source $ALIAS_FILE" >> ~/.bashrc
    echo "✅ Aliases added to .bashrc"
fi

if [ -f ~/.zshrc ] && ! grep -qF "source $ALIAS_FILE" ~/.zshrc; then
    echo "source $ALIAS_FILE" >> ~/.zshrc
    echo "✅ Aliases added to .zshrc"
fi

echo "✅ Aliases installed. Run 'source ~/.bashrc' or restart your terminal to apply them."
