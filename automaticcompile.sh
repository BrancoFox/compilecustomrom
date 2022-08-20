#!/usr/bin/env bash

repoinit(){
repo init -u https://github.com/crdroidandroid/android.git -b 12.1
}

syncrom(){
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16
}

clonetree(){
git clone https://github.com/Yshmany/android_device_motorola_deen.git -b 12.1
git clone https://github.com/GiovanYCringe/kernel_motorola_deen.git -b 12.1
git clone https://github.com/GiovanYCringe/vendor_deen -b SL
}

fixproton(){
git clone --depth=1 https://github.com/kdrag0n/proton-clang prebuilts/clang/host/linux-x86/proton-clang
nano prebuilts/clang/host/linux-x86/proton-clang/AndroidVersion.txt
echo proton >> prebuilts/clang/host/linux-x86/proton-clang/AndroidVersion.txt
}

compilar(){
. build/envsetup.sh
lunch lineage_deen-userdebug
mka bacon -j16
}

mkdirrom
syncrom
clonetree
fixproton
compilar


