@echo off
REM Builds the intunewin file for this installer.
REM .\Source\Install.ps1

.\Microsoft-Win32-Content-Prep-Tool\IntuneWinAppUtil.exe -c .\Source -s Install.ps1 -o .\Output
pause