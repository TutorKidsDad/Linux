# Linux: An OS for All Your Needs

Welcome to the **Linux Guide Repository**! This repository is a comprehensive resource for anyone looking to:

- Understand Linux as an operating system.
- Install and manage software efficiently.
- Troubleshoot common issues effectively.
- Write custom codes and shell scripts for automation and productivity.

---

## Table of Contents

1. [Overview](#overview)
2. [Getting Started with Linux](#getting-started-with-linux)
3. [Installing Software](#installing-software)
4. [Troubleshooting](#troubleshooting)
5. [Custom Codes and Shell Scripts](#custom-codes-and-shell-scripts)
6. [Contributing](#contributing)
7. [License](#license)

---

## Overview

Linux is a powerful, open-source operating system known for its stability, flexibility, and vast ecosystem. It powers everything from personal desktops to large-scale servers. This repository provides hands-on guidance to make the most of Linux, whether you're a beginner or an advanced user.

---

## Getting Started with Linux

### Choosing a Distribution

Popular Linux distributions include:
- **Ubuntu:** Beginner-friendly with robust community support.
- **Fedora:** Cutting-edge features with a focus on developers.
- **Arch Linux:** Lightweight and customizable for advanced users.

### Installation Steps

1. Download the ISO file for your chosen distribution from its official website.
2. Create a bootable USB using tools like `Rufus`, `balenaEtcher`, or `dd`.
3. Boot into the USB and follow the on-screen instructions to install Linux.
4. Partition your drives:
   - `/` (Root directory)
   - `swap` (Optional, for extra memory)
   - `/home` (User data)
5. Reboot and enjoy your Linux system!

---

## Installing Software

### Using Package Managers

Package managers simplify software installation and management. Common ones include:
- **APT** (Debian-based systems):
  ```bash
  sudo apt update
  sudo apt install <package-name>
  ```
- **DNF** (Fedora-based systems):
  ```bash
  sudo dnf install <package-name>
  ```
- **Pacman** (Arch-based systems):
  ```bash
  sudo pacman -S <package-name>
  ```

### Examples
- Install Git:
  ```bash
  sudo apt install git
  ```
- Install Python3:
  ```bash
  sudo dnf install python3
  ```

---

## Troubleshooting

### Common Issues and Fixes

1. **System Update Errors**
   - Error: "Failed to fetch updates."
   - Fix:
     ```bash
     sudo apt update --fix-missing
     ```

2. **Broken Dependencies**
   - Fix:
     ```bash
     sudo apt --fix-broken install
     ```

3. **No Internet Connection**
   - Restart the network service:
     ```bash
     sudo systemctl restart NetworkManager
     ```

4. **Permission Denied**
   - Add `sudo` before commands requiring administrative rights:
     ```bash
     sudo <command>
     ```

5. **Display Issues**
   - Restart the display manager:
     ```bash
     sudo systemctl restart gdm  # Replace 'gdm' with your display manager if needed
     ```

---

## Custom Codes and Shell Scripts

### Automating Tasks with Shell Scripts

#### Backup Script
A simple script to back up your home directory to an external drive.

```bash
#!/bin/bash

SOURCE="$HOME"
DEST="/media/$USER/Backup"

if [ ! -d "$DEST" ]; then
  echo "Backup destination not found!"
  exit 1
fi

rsync -av --delete "$SOURCE" "$DEST"
echo "Backup completed successfully!"
```

#### System Monitor Script
Monitor your CPU, memory, and disk usage.

```bash
#!/bin/bash

echo "CPU Usage: $(grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5) "%"}')"
echo "Memory Usage: $(free -h | awk '/^Mem/ {print $3 "/" $2}')"
echo "Disk Usage: $(df -h | awk '$NF=="/"{print $5}')"
```

### Running Shell Scripts

1. Make the script executable:
   ```bash
   chmod +x script.sh
   ```
2. Execute the script:
   ```bash
   ./script.sh
   ```

---

## Contributing

Contributions are welcome! If you have suggestions, new scripts, or fixes to existing issues, feel free to:
- Fork this repository.
- Create a new branch for your feature or fix.
- Submit a pull request.

---

## License

This repository is licensed under the [MIT License](LICENSE).

---

**Happy Linux-ing!**
