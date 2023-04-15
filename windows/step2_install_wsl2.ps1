# Download this file using the below command
# Invoke-WebRequest -URI https://raw.githubusercontent.com/astbss/astbss/master/windows/step2_install_wsl2.ps1 -OutFile step2_install_wsl2.ps1

# Open Powershell as administrator
# winver
# 1st Upgrade your windows so you get full latest version
# Run step1_upgrade.ps1

# Ensure your Windows 11 are fully upgraded and rebooted
# This is a single command that will install both WSL and Ubuntu at the same time.
# wsl --install -d Ubuntu-20.04
wsl --install -d Ubuntu-22.04

# To get a list of valid wsl distributions, use 'wsl --list --online'
Restart-Computer

# After reboot. Wait for Ubuntu to install then. Open Ubuntu terminal and run
# sudo apt update && sudo apt upgrade -y

# Install Docker for wsl and Visual studio code
# https://docs.docker.com/desktop/windows/wsl/

# logout or exit then stop ubuntu using
# wsl --terminate Ubuntu-22.04
