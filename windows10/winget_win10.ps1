# Run as admin
# You must be running Windows 10 version 2004 and higher
# (Build 19041 and higher) or Windows 11.
# winver
# 1st Upgrade your windows so you get full latest version

# Access wsl from Windows 10
subst z: "\\wsl$\Ubuntu-20.04\\home\are"

wsl --set-default-version 2
# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# run as user
winget install Microsoft.WindowsTerminal
winget install -e --id Microsoft.VisualStudioCode
winget install Google.Chrome
winget install -e --id LibreOffice.LibreOffice
