. "$PSScriptRoot\helpers.ps1"

$zip = "c:\users\qt\downloads\ninja-1.6.0-win-x86.zip"

Download https://github.com/ninja-build/ninja/releases/download/v1.6.0/ninja-win.zip \\ci-files01-hki.ci.local\provisioning\ninja\ninja-1.6.0-win-x86.zip $zip
Verify-Checksum $zip "E01093F6533818425F8EFB0843CED7DCAABEA3B2"

Extract-Zip $zip C:\Utils\Ninja
Remove-Item $zip

$machinePath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $machinePath + ";C:\Utils\Ninja", [EnvironmentVariableTarget]::Machine)
