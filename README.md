# d0k3-updater
Updater in lpp-3ds for d0k3's 3ds applications

## Building
All these files, save for the build.bat, can be found on this project's repo: https://github.com/MatMaf/encTitleKeys.bin-Updater/  
This will produce 2 files named d0k3-updater.3dsx and d0k3-updater.cia

## Usage
To use, simply:  
Put the 3dsx under the 3ds folder on your 3DS' SD card, then run it from the HBL  
or  
Install the cia with your preferred CIA manager and run it from your Home Menu  

You can also run the index.lua (located under the "script" directory) with the lpp-3ds original cia or 3dsx

## Configuration
The config.cfg must be placed in `/homebrew/d0k3-updater/` on your SD card  
To edit what you want to download, simply add or remove the following strings in the config.cfg file (in the data["payloads"] table):  
'Decrypt9WIP', 'EmuNAND9', 'A9NC', 'CTRXplorer', 'GodMode9', 'Hourglass9', 'SafeMode9'  
Anything else will result in an **error**. The uppercase letters are **required** for it to work.

## Credits
 * Thanks to d0k3 for all the awesome applications
 * Thanks to Shadowhand for the nightlies
 * Thanks to Rinnegatamante for lpp-3ds, which this depends upon