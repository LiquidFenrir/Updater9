@echo off

set name=d0k3_updater

set cia_file="%name%.cia"
set hbl_file="%name%.3dsx"

set elf_file="lpp-3ds.elf"
set rsf_file="cia_workaround.rsf"

set banner_image="assets/banner.png"
set banner_audio="assets/audio.wav"
set banner_file="banner.bin"

set icon_image="assets/icon.png"
set title="d0k3 updater"
set description="Updater for d0k3's apps in lpp-3ds"
set publisher="LiquidFenrir"
set icon_file="icon.smdh"

set romfs_dir="script"
set romfs_file="romfs.bin"

del /F %cia_file%
del /F %hbl_file%

echo banner
bannertool makebanner -i %banner_image% -a %banner_audio% -o %banner_file%
echo icon
bannertool makesmdh -i %icon_image% -s %title% -l %description% -p %publisher% -o %icon_file%
echo romfs
3dstool -cvtf romfs %romfs_file% --romfs-dir %romfs_dir%
echo 3dsx
3dsxtool %elf_file% %hbl_file% --romfs=%romfs_dir% --smdh=%icon_file%
echo cia
makerom -v -f cia -o %cia_file% -elf %elf_file% -rsf %rsf_file% -icon %icon_file% -banner %banner_file% -exefslogo -target t -romfs %romfs_file%

echo deleting temp files...
del /F %banner_file%
del /F %icon_file%
del /F %romfs_file%
echo done