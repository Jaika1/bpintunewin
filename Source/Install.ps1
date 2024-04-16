#Mount BP ISO
#Variables
$logDir = "C:/BPIntuneLogs/"
$bpImage = "BP1.12.0.998DVD.iso"

#Mount BP image
Write-Output "Mounting BP ISO"
$mount = (Mount-DiskImage -ImagePath "$(Get-Location)\$($bpImage)" -PassThru | Get-Volume).DriveLetter + ":\"

#Install pre-reqs
Write-Output "Installing dotnetfx3.5"
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName NetFx3
Write-Output "Installing VC Redist 32 bit"
Start-Process -Wait -WorkingDirectory $mount -FilePath "Prerequisites\vcredist_x86.exe" -ArgumentList "/install /quiet /norestart /log `"$($logDir)vcredist_x86.txt`"" #Visual C++ Redist (32 bit)
Write-Output "Installing VC Redist 64 bit"
Start-Process -Wait -WorkingDirectory $mount -FilePath "Prerequisites\vcredist_x64.exe" -ArgumentList "/install /quiet /norestart /log `"$($logDir)vcredist_x64.txt`"" #Visual C++ Redist (64 bit)
Write-Output "Installing Java Runtime Environment 6.26 32 bit"
Start-Process -Wait -WorkingDirectory $mount -FilePath "Prerequisites\jre-6u26-windows-i586-s.exe" -ArgumentList "/s /L `"$($logDir)jre-6u26-windows-i586-s.log`"" #Java Runtime Environment 6.26 (32 bit)

#Short 10s sleep for good measure
Start-Sleep -Seconds 10

