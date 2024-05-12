## Install Winget App Installer
- https://www.thomasmaurer.ch/2020/05/how-to-install-winget-windows-package-manager/
- https://github.com/microsoft/winget-cli
- Install from Microsoft Store [Recommended]
- The client is distributed within the **App Installer** package.
- Search for and install: **App Installer**

## Windows Sandbox
- Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online

## Use wsl or wsl2
- logout or exit then stop ubuntu from Powershell using
- wsl --terminate Ubuntu-22.04
- To get a list of valid wsl distributions
- wsl --list --online
- Install a new wsl distribution
- wsl --install -d Ubuntu-22.04

## WSL2 Problem
- netsh winsock reset
- `dir \\wsl$\Ubuntu`
- `subst z: "\\wsl$\Ubuntu-20.04\home\are"`
- `subst z: "\\wsl$\Ubuntu\home\are"`

## Mount a Linux disk in WSL 2
- https://docs.microsoft.com/en-us/windows/wsl/wsl2-mount-disk

## Debloat Windows
- https://beebom.com/how-debloat-windows-11-improve-performance/
- https://raw.githubusercontent.com/Sycnex/Windows10Debloater/master/Windows10DebloaterGUI.ps1

## winget upgrade
- winget upgrade
- winget upgrade -h --id APP-ID
- winget upgrade -h --all
- https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox


## Powertoys
- https://github.com/microsoft/PowerToys

## Ubuntu 22.04 - Windows 11 ssh-agent error
- winget install "openssh beta"
- https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH
- https://stackoverflow.com/questions/75605227/ubuntu-22-04-ssh-agent-error-unable-to-load-resident-keys-device-not-found
- https://github.com/powershell/Win32-OpenSSH
