# Run as admin
# You must be running Windows 10 version 2004 and higher
# (Build 19041 and higher) or Windows 11.
# winver
# 1st Upgrade your windows so you get full latest version

There is a single command that will install both WSL and Ubuntu at the same time.
wsl --install -d ubuntu
wsl --install
Restart-Computer
wsl --set-default-version 2
wsl -l -v
wsl --unregister Ubuntu
wsl --unregister Debian
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Windows Linux Kernel Upgrade
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# run as user
# https://ss64.com/nt/winget-install.html
winget install Microsoft.WindowsTerminal
winget install --accept-package-agreements --accept-source-agreements Google.Chrome
winget install -e --id LibreOffice.LibreOffice
winget install -e --id Microsoft.VisualStudioCode
winget install brackets-cont.brackets
winget install Skillbrains.lightshot
