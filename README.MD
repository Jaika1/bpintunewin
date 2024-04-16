# [Best Practice Premier](https://bpsoftware.net/) as Intune Win32
> [!CAUTION]
> This project is still a work in progress and is not yet complete, nor will it produce anything useful for intune at this stage. See [Roadmap](#Essentials) for more info.

## Notice
This script was tested on a Windows 11 Enterprise Multi-session (21H2) VM inside of AVD for Azure Stack HCI. As such, some parts of this script may need to be modified for your deployment if targeting Windows Server.

## Cloning
Cloning this repository is a simple process, although you must remember to include the `--recursive` flag! After installing [Git for Windows](https://gitforwindows.org/), navigate to the directory where you'd like to clone this repo into and run `git clone https://github.com/Jaika1/bpintunewin.git --recursive`

## Roadmap/Todo
### Essentials
 - [x] Working install script for Windows 11 Enterprise MS
 - [ ] Working uninstall script
 - [ ] Custom presence check script
 - [ ] Ability to create .intunewin using `build.bat`
### Extras
 - [ ] BP Software Updates

## Uses
- [Microsoft Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool)

## References
- The [BP Silent Install Guide](https://kb.bpsoftware.net/bppremier/Orchid/InstallAndUpgrade/Installation/SilentInstall.htm) is invaluable for this!