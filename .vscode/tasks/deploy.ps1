if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Import-Module Boxstarter.Bootstrapper
Import-Module Boxstarter.Chocolatey

$src = Join-Path $PSScriptRoot ".." ".." "src" "*"
$dst = "\\raktar.local\boxstarter"
$Boxstarter.LocalRepo = $dst
$dst = Join-Path $dst "bs_nodered"

if (Test-Path -Path $dst) {
    Remove-Item -Path $dst -Recurse -Force -ErrorAction SilentlyContinue
}
New-BoxstarterPackage -Name "bs_nodered" -Description "Script d'installation de Node-RED"
Copy-Item -Path $src -Destination $dst -Recurse -Force
Invoke-BoxStarterBuild -Name "bs_nodered"
