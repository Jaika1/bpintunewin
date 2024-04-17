<#
.SYNOPSIS
Detects whether Best Practice software is installed or not.
.DESCRIPTION
A script to detect an existing installation of Best Practice software. This script will not target any pre-requisites nor SQL.
.NOTES
        Name       : BP Intune Win32 (Detect)
        Author     : Jack Roennfeldt
.LINK 
https://github.com/Jaika1/bpintunewin
#>

#List uninstallers tagged onto the system and look for anything containing "Bp Premier"
$progNames = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName.Contains("Bp Premier")} -ErrorAction SilentlyContinue
#Check if anything was found and assign variable
$notInstalled = $null -eq $progNames
#Basic boolean logic. False=0, True=1. If return is 1, Intune will mark the software for installation.
exit $notInstalled