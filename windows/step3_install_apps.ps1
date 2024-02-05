# Download this file using the below command
# Invoke-WebRequest -URI https://raw.githubusercontent.com/astbss/astbss/master/windows/step3_install_apps.ps1 -OutFile step3_install_apps.ps1

# run this as user

# After reboot. Wait for Ubuntu to install then. Open Ubuntu terminal and run
# sudo apt update && sudo apt upgrade -y

# Windows Linux Kernel Upgrade
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# https://ss64.com/nt/winget-install.html
winget install --accept-source-agreements Microsoft.WindowsTerminal
winget install --accept-package-agreements --accept-source-agreements Google.Chrome
winget install --accept-source-agreements --id Git.Git -e
winget install -e --id Obsidian.Obsidian
# winget install -e --id Python.Python.3 -v 3.10.1150.0
winget install brackets-cont.brackets
winget install Skillbrains.lightshot
# winget install --id=Skillbrains.lightshot  -e

# winget install "openssh beta"

# winget install -e --id Microsoft.Skype
# winget install -e --id Dropbox.Dropbox

# winget install -e --id TheDocumentFoundation.LibreOffice
# winget install -e --id Microsoft.Teams
# winget install -e --id Discord.Discord
# winget install -e --id WireGuard.WireGuard
# winget install -e --id OpenVPNTechnologies.OpenVPN
# winget install -e --id OBSProject.OBSStudio

winget install --accept-source-agreements -e --id Microsoft.VisualStudioCode
# Restart Ubuntu and Powershell windows for code to appear in the path

Restart-Computer
