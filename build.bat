@echo off
REM Builds the intunewin file for this installer.

.\Microsoft-Win32-Content-Prep-Tool\IntuneWinAppUtil.exe -c .\Source -s .\Source\Install.ps1 -o .\Output
pause