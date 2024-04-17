# [Best Practice Premier](https://bpsoftware.net/) as Intune Win32
> [!CAUTION]
> This project is still a work in progress and is not yet complete, nor will it produce anything useful for intune at this stage. See [Roadmap](#Essentials) for more info.

## Notice
This script was tested on a Windows 11 Enterprise Multi-session (21H2) VM inside of AVD for Azure Stack HCI. As such, some parts of this script may need to be modified for your deployment if targeting Windows Server.

## Cloning
Cloning this repository is a simple process, although you must remember to include the `--recursive` flag! After installing [Git for Windows](https://gitforwindows.org/), navigate to the directory where you'd like to clone this repo into and run `git clone https://github.com/Jaika1/bpintunewin.git --recursive`

## Prepare
### Method 0 - Read BP ISO from File Share
1. Deploy and configure a file-share if you don't have an existing one on your local network. Worst-case this can be a basic Windows Server VM hosting an SMB share.
2. Download your required Best Practice installer ISO. Place this ISO on the share and ensure it is accessable from your client machines in which you'd like to install best practice from.
3. Open `Source\Config.ps1` in this repo and edit all nessecary properties. `$installSource` should be set to `0`, and `$isoPath` should point to your ISO on the share you just set up.
4. After you're certain this has all been done correctly, Proceed to [Build](#Build).
### Method 1 - Download BP ISO from the Web
> [!WARNING]
> This method is not yet implemented. Trying to use this will always result in an install error, as it is currently hard-coded to do so 🤓
### Method 2 - Bundle BP ISO with .intunewin file
1. Download your required Best Practice installer ISO. Copy this into the `Source` folder of this repository.
2. Open `Source\Config.ps1` in this repo and configure so that `$installSource = 2`.
3. That's it! Proceed to [Build](#Build).
> [!TIP]
> You may still create and commit changes within this repository even after placing the iso in this directory as the root .gitignore file is configured to ignore .exe and .iso files.

## Build
Review and modify the `Source\Config.ps1` file as required. In particular, make sure you assign a correct path to `$isoPath` when `$installSource = 0`. This will be the location (including file name and extension) of the BP iso you downloaded and copied before in the [Prepare](#Prepare) step.
After properly following the [Prepare](#Prepare) section for your given scenario, Run `built.bat` and wait for the output to finish. Once completed, you should find your intunewin at `Output\Install.intunewin`. Once this succeeds, proceed to the [Deploy](#Deploy) step.

## Deploy
> [!NOTE]
> Coming soon...

## Roadmap/Todo
### Essentials
 - [x] Working install script for Windows 11 Enterprise MS
 - [X] Working uninstall script
 - [X] Custom presence check script
 - [X] Ability to create .intunewin using `build.bat`
### Extras
 - [ ] BP Software Updates
 - [ ] Download BP ISO from web on demand.

## Uses
- [Microsoft Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool)

## References
- The [BP Silent Install Guide](https://kb.bpsoftware.net/bppremier/Orchid/InstallAndUpgrade/Installation/SilentInstall.htm) is invaluable for this!