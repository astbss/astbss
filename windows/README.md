## Install Winget App Installer
- https://www.thomasmaurer.ch/2020/05/how-to-install-winget-windows-package-manager/
- https://github.com/microsoft/winget-cli
- Install from Microsoft Store [Recommended]
- The client is distributed within the **App Installer** package.
- Search for and install: **App Installer**

## Install WinGet on Windows Sandbox
- https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox
```
$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
```

## Windows Sandbox
- Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online

## Use wsl or wsl2
- logout or exit then stop ubuntu from Powershell using
- wsl --terminate Ubuntu-22.04
- To get a list of valid wsl distributions
- wsl --list --online
- wsl --list -v
- Install a new wsl distribution
- wsl --install -d Ubuntu-22.04
- wsl --install -d Ubuntu-24.04
- wsl --unregister Ubuntu-22.04
- Subst a drive to your wsl distribution
- subst z: "\\wsl$\Ubuntu-22.04\home\myuser"

## wsl in terminal 
- ubuntu2204.exe config --default-user user1 ; To set a default wsl user for Ubuntu-22.04:
- Run multiple instances with different users simultaneously (From Terminal) Powershell:
- wsl -d Ubuntu-22.04 -u user1
- wsl -d Ubuntu-22.04 -u user2
- Starting directory: ~


## WSL Command line
- C:\Windows\system32\wsl.exe -d Ubuntu -u are
- C:\Windows\system32\wsl.exe -d Ubuntu-24.04 -u are

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

# azchohfi  Setup
- https://apps.microsoft.com/detail/9n8mhtphngvv?hl=en-us&gl=RO
- https://github.com/azchohfi/setup
- winget configure https://raw.githubusercontent.com/azchohfi/setup/main/azchohfi.admin.dsc.yaml
- winget configure https://raw.githubusercontent.com/azchohfi/setup/main/azchohfi.user.dsc.yaml

