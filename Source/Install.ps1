#As you may be able to tell, Powershell is a relatively fresh thought for me. Probably room for tidy/best practices.

#Pre-declared Variables
$location = $(Get-Location)
$logDir = "C:/BPIntuneLogs/"

#Find and Mount BP image
$bpImage = Get-ChildItem -Path $location -Filter *.iso -File
$mount = Mount-DiskImage -ImagePath "$($location)\$($bpImage)" -PassThru
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