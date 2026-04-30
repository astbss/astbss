# codex.ps1
# https://developers.openai.com/codex/app/windows
# https://developers.openai.com/codex/windows
# https://developers.openai.com/codex/concepts/sandboxing
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

winget install Codex -s msstore

winget install --id Git.Git
winget install --id OpenJS.NodeJS.LTS
winget install --id Python.Python.3.14
winget install --id Microsoft.DotNet.SDK.10
winget install --id GitHub.cli
