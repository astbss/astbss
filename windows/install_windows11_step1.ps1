
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
# This will update Windows
Install-WindowsUpdate -AcceptAll -AutoReboot
# -ForceDownload -ForceInstall
# Get-WindowsUpdate -AcceptAll -Install -AutoReboot

sleep 10
# Run Get-WindowsUpdate again
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -AutoReboot

sleep 5
Restart-Computer
# winget install --accept-source-agreements --id Git.Git -e
