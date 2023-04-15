
if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
    Write-Host "PSWindowsUpdate Module exists"
}
else {
    Write-Host "Installing NuGet provider"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Install-PackageProvider -Name NuGet -Force
}


if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
    Write-Host "PSWindowsUpdate Module exists"
}
else {
    Write-Host "Installing PSWindowsUpdate Module"
    # Install-Module -Name PSWindowsUpdate -AllowClobber -Scope CurrentUser -Force
    Install-Module -Name PSWindowsUpdate -Force -Confirm:$False
}


Get-WindowsUpdate
# This will update Windows and reboot
Install-WindowsUpdate -AcceptAll -AutoReboot
# -ForceDownload -ForceInstall
# Get-WindowsUpdate -AcceptAll -Install -AutoReboot

Restart-Computer
# winget install --accept-source-agreements --id Git.Git -e
