# Updater9
Updater in lpp-3ds for d0k3's 3ds applications

## Building
To build, you will need the lpp-3ds.elf of your choice (release, nightly, your own...), in addition to makerom, bannertool, 3dstool, and 3dsxtool, then run the build.bat  
All these files, save for the build.bat, can be found on this project's repo: https://github.com/MatMaf/encTitleKeys.bin-Updater/  
This will produce 2 files named Updater9.3dsx and Updater9.cia

## Usage
To use, simply:  
Put the 3dsx under the 3ds folder on your 3DS' SD card, then run it from the HBL  
or  
Install the cia with your preferred CIA manager and run it from your Home Menu  

You can also run the index.lua (located under the "script" directory) with the lpp-3ds original cia or 3dsx

## Configuration
The config.cfg must be placed in `/homebrew/Updater9/` on your SD card  
To edit what you want to download, simply add `--` in front of the applications you don't want to download (line 9 to 15 in the config.cfg).

## Credits
 * Thanks to d0k3 for all the awesome applications
 * Thanks to Shadowhand for the nightlies
 * Thanks to Rinnegatamante for lpp-3ds, which this depends upon