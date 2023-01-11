if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Import-Module Boxstarter.Bootstrapper
Import-Module Boxstarter.Chocolatey

$nuspec = @"
<?xml version="1.0"?>
<package>
  <metadata>
    <id>bs_nodered</id>
    <version>1.0.0</version>
    <authors>francois</authors>
    <owners>francois</owners>
    <description>Script d'installation de Node-RED</description>
    <tags>Boxstarter</tags>
  </metadata>
</package>
"@
$src = Join-Path $PSScriptRoot ".." ".." "src" "*"
$dst = "E:\boxstarter"
$Boxstarter.LocalRepo = $dst
$dst = Join-Path $dst "bs_nodered"

if (Test-Path -Path $dst) {
    Write-Host "Deleting directory..."
    Remove-Item -Path $dst -Force -Recurse -ErrorAction SilentlyContinue
}
New-Item -Path $dst -ItemType Directory
New-Item -Path (Join-Path $dst "bs_nodered.nuspec") -ItemType File -Value $nuspec
Copy-Item -Path $src -Destination $dst -Recurse
Invoke-BoxStarterBuild -Name "bs_nodered"
