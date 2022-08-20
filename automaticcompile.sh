#!/usr/bin/env bash

repoinit(){
sudo repo init -u https://github.com/crdroidandroid/android.git -b 12.1
}

syncrom(){
sudo repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16
}

clonetree(){
sudo git clone https://github.com/GiovanYCringe/android_device_motorola_deen.git -b 12.1 device/motorola/deen
sudo git clone https://github.com/GiovanYCringe/kernel_motorola_deen.git -b 12.1 kernel/motorola/deen
sudo git clone https://github.com/GiovanYCringe/vendor_deen -b SL vendor/motorola/deen
sudo git clone https://github.com/LineageOS/android_system_qcom.git system/qcom
sudo git clone https://github.com/LineageOS/android_external_bson.git external/bson
sudo git clone https://github.com/GiovanYCringe/hardware_motorola.git hardware/motorola
}

fixproton(){
sudo git clone --depth=1 https://github.com/kdrag0n/proton-clang prebuilts/clang/host/linux-x86/proton-clang
sudo nano prebuilts/clang/host/linux-x86/proton-clang/AndroidVersion.txt
sudo echo proton >> prebuilts/clang/host/linux-x86/proton-clang/AndroidVersion.txt
}

compilar(){
. build/envsetup.sh
lunch lineage_deen-userdebug
mka bacon -j16
}

repoinit
syncrom
clonetree
fixproton
compilar


