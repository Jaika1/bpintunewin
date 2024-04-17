<#
.SYNOPSIS
Uninstalls Best Practice software.
.DESCRIPTION
A script to uninstall Best Practice software. This script will not target any pre-requisites nor SQL.
.NOTES
        Name       : BP Intune Win32 (Uninstall)
        Author     : Jack Roennfeldt
.LINK 
https://github.com/Jaika1/bpintunewin
#>

#List uninstallers tagged onto the system and look for anything containing "Bp Premier"
$progName = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName.Contains("Bp Premier")} -ErrorAction SilentlyContinue
#Check if anything was found and assign variable
$installed = $null -ne $progName

if ($installed -eq $True) {
    $uninstallStr = $progName.UninstallString
    $splitCmd = $uninstallStr -split " "
    $uninstallCmd += $splitCmd[0] + " /S /A " + $splitCmd[1]
    Invoke-Expression $uninstallCmd
}
else {
    Write-Output "Failed to detect Best Practice installation!"
    exit 1
}