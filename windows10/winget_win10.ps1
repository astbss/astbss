# Run as admin
# You must be running Windows 10 version 2004 and higher
# (Build 19041 and higher) or Windows 11.
# winver
# 1st Upgrade your windows so you get full latest version

There is a single command that will install both WSL and Ubuntu at the same time.
wsl --install -d ubuntu
Restart-Computer
https://docs.docker.com/desktop/windows/wsl/
https://code.visualstudio.com/download

# Windows Linux Kernel Upgrade
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# run as user
# https://ss64.com/nt/winget-install.html
winget install Microsoft.WindowsTerminal
winget install --accept-package-agreements --accept-source-agreements Google.Chrome
winget install --accept-source-agreements --id Git.Git -e   
winget install -e --id Python.Python.3 -v 3.10.1150.0
winget install -e --id LibreOffice.LibreOffice
winget install brackets-cont.brackets
winget install Skillbrains.lightshot
winget install --id=Skillbrains.lightshot  -e
- Do not install VisualStudioCode. Installing via Chrome give better right click support
    - winget install -e --id Microsoft.VisualStudioCode

## Add extensions to Visual Studio Code using CLI
#### Powershell
```
code --list-extensions
code --install-extension alefragnani.Bookmarks
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension msazurermtools.azurerm-vscode-tools
```
#### WSL2
```
code --list-extensions
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-vscode.powershell
```

# Below commands are not needed for wsl anymore
wsl --install
wsl --set-default-version 2
wsl -l -v
wsl --unregister Ubuntu
wsl --unregister Debian
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
