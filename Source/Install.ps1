<#
.SYNOPSIS
Installs Best Practice software and it's pre-requisites from iso.
.DESCRIPTION
A script to install Best Practice software and it's pre-requisites from an iso.
.NOTES
        Name       : BP Intune Win32 (Install)
        Author     : Jack Roennfeldt
.LINK 
https://github.com/Jaika1/bpintunewin
#>

#Load values from Config.ps1
. $PSScriptRoot\Config.ps1

#Pre-declared Variables
$location = $(Get-Location)
$logDir = "C:/BPIntuneLogs/"

#Find and Mount BP image
Switch ($installSource) {
    0 {
        $mount = Mount-DiskImage -ImagePath $isoPath -PassThru
    }
    1 {
        #$bpImage = Get-ChildItem -Path $location -Filter *.iso -File
        #$mount = Mount-DiskImage -ImagePath "$($location)\$($bpImage)" -PassThru
        Write-Output "Installation source not yet implemented!"
        exit 1
    }
    2 {
        $bpImage = Get-ChildItem -Path $location -Filter *.iso -File
        $mount = Mount-DiskImage -ImagePath "$($location)\$($bpImage)" -PassThru
    }
    Default {
        Write-Output "Invalid installation source!"
        exit 1
    }
}
$mountDir = ($mount | Get-Volume).DriveLetter + ":\"

#Install pre-reqs
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName NetFx3
Start-Process -Wait -WorkingDirectory $mountDir -FilePath "Prerequisites\vcredist_x86.exe" -ArgumentList "/install /quiet /norestart /log `"$($logDir)vcredist_x86.txt`"" #Visual C++ Redist (32 bit)
Start-Process -Wait -WorkingDirectory $mountDir -FilePath "Prerequisites\vcredist_x64.exe" -ArgumentList "/install /quiet /norestart /log `"$($logDir)vcredist_x64.txt`"" #Visual C++ Redist (64 bit)
Start-Process -Wait -WorkingDirectory $mountDir -FilePath "Prerequisites\jre-6u26-windows-i586-s.exe" -ArgumentList "/s /L `"$($logDir)jre-6u26-windows-i586-s.log`"" #Java Runtime Environment 6.26 (32 bit)

#Copy BPconfig.ini into root of C:
Copy-Item -Path "$($location)\BPconfig.ini" -Destination "C:\BPconfig.ini" -Force

#Short 3s sleep for good measure
Start-Sleep -Seconds 3

#Begin installation of BP
Start-Process -Wait -WorkingDirectory $mountDir -FilePath "Install\BP_SQLEx_Setup.exe" -ArgumentList "/s"

#Unmount BP ISO
$mount | Dismount-DiskImage

#Delete BPconfig.ini from root
Remove-Item -Force -Path "C:\BPconfig.ini"