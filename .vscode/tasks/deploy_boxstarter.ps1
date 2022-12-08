if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Import-Module Boxstarter.Bootstrapper
Import-Module Boxstarter.Chocolatey

$box = "\\raktar.local\tangerine\boxstarter"
$Boxstarter.BaseDir = $box
$repo = "\\raktar.local\tangerine\boxstarter_repo"
$Boxstarter.LocalRepo = $repo
$repo += "\nodered"
Remove-Item -Path $repo -Force -Recurse -ErrorAction SilentlyContinue
New-BoxstarterPackage -Name "nodered" -Description "Mon script de configuration"
robocopy src $repo /E
Invoke-BoxStarterBuild -Name "nodered"
pause