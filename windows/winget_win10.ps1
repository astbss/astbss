# Run as admin
# You must be running Windows 10 version 2004 and higher
# (Build 19041 and higher) or Windows 11.
# winver
# 1st Upgrade your windows so you get full latest version

Ensure your Windows 11 are fully upgraded and rebooted

There is a single command that will install both WSL and Ubuntu at the same time.
# wsl --install -d Ubuntu-20.04
wsl --install -d Ubuntu-22.04
To get a list of valid wsl distributions, use 'wsl --list --online'
Restart-Computer
After reboot. Wait for Ubuntu to install then. Open Ubuntu terminal and run
sudo apt update && sudo apt upgrade -y
Install Docker for wsl and Visual studio code
https://docs.docker.com/desktop/windows/wsl/

# logout or exit then stop ubuntu using
# wsl --terminate Ubuntu-22.04

# Windows Linux Kernel Upgrade
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# run as user
# https://ss64.com/nt/winget-install.html
winget install --accept-source-agreements Microsoft.WindowsTerminal
winget install --accept-package-agreements --accept-source-agreements Google.Chrome
winget install --accept-source-agreements --id Git.Git -e
winget install -e --id Obsidian.Obsidian
# winget install -e --id Python.Python.3 -v 3.10.1150.0
winget install -e --id TheDocumentFoundation.LibreOffice
winget install brackets-cont.brackets
winget install Skillbrains.lightshot
# winget install --id=Skillbrains.lightshot  -e
winget install -e --id Microsoft.Skype
winget install -e --id Dropbox.Dropbox
# winget install -e --id Microsoft.Teams
# winget install -e --id Discord.Discord
# winget install -e --id WireGuard.WireGuard
# winget install -e --id OpenVPNTechnologies.OpenVPN
# winget install -e --id OBSProject.OBSStudio

winget install --accept-source-agreements -e --id Microsoft.VisualStudioCode
Restart Ubuntu and Powershell windows for code to appear in the path

## Add extensions to Visual Studio Code using CLI
#### Powershell
```
code --list-extensions
code .
code --install-extension alefragnani.Bookmarks
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension msazurermtools.azurerm-vscode-tools
```
#### WSL2
```
code --list-extensions
code .
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
# code --install-extension ms-python.vscode-pylance
# code --install-extension ms-toolsai.jupyter
# code --install-extension ms-toolsai.jupyter-keymap
# code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-vscode.powershell
```
