<#
.SYNOPSIS
Install configuration
.DESCRIPTION
Configuration file to dictate how the install process will behave.
.NOTES
        Name       : BP Intune Win32 (Config File)
        Author     : Jack Roennfeldt
.LINK 
https://github.com/Jaika1/bpintunewin
#>

# Determines how the installer will locate/aquire an ISO for best-practice.
# 0 - Locate the ISO on a network path/share. Please ensure the host VMs can access this share!
# 1 - [NOT YET IMPLEMENTED] Download the ISO from the web. Not reccommended for large-scale deployments as ISO is 4GB+! 
# 2 - Looks for a .ISO in the Source directory. This produces a large intunewin file and may both slow down deployments considerably whilst increasing azure storage costs!
$installSource = 0

# Network path to the ISO. Only used when $installSource = 0
$isoPath = ""