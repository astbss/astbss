# codex.ps1
# https://developers.openai.com/codex/app/windows
# https://developers.openai.com/codex/windows
# https://developers.openai.com/codex/concepts/sandboxing
# https://developers.openai.com/codex/windows#windows-sandbox
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

winget install Codex -s msstore

winget install --id Git.Git
winget install --id OpenJS.NodeJS.LTS
winget install --id Python.Python.3.14
# winget install --id Microsoft.DotNet.SDK.10
winget install --id GitHub.cli


# Claude Code
irm https://claude.ai/install.ps1 | iex
[Environment]::SetEnvironmentVariable("PATH", [Environment]::GetEnvironmentVariable("PATH", "User") + ";C:\Users\are\.local\bin", "User")
