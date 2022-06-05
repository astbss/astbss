# Run as admin
# You must be running Windows 10 version 2004 and higher
# (Build 19041 and higher) or Windows 11.
# winver
# 1st Upgrade your windows so you get full latest version

wsl --install
wsl --set-default-version 2
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Windows Linux Kernel Upgrade
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# Open appstore
# https://www.microsoft.com/store/apps/9n6svws3rx71

# run as user
winget install Microsoft.WindowsTerminal
winget install  Google.Chrome
winget install -e --id LibreOffice.LibreOffice
winget install brackets-cont.brackets
winget install Skillbrains.lightshot
