#!/bin/bash

# Zorin 15 -> bionic
# Zorin 16 -> focal
# Zorin 17 -> jammy

zorinver="jammy"
listsrc="/etc/apt/sources.list.d/zorin.list"
premium_temp="/etc/apt/apt.conf.d/99zorin-os-premium-user-agent-temp"

echo "" >> $listsrc
echo "deb https://packages.zorinos.com/premium $zorinver main" >> $listsrc
echo "deb-src https://packages.zorinos.com/premium $zorinver main" >> $listsrc

echo 'Acquire { http::User-Agent "Zorin OS Premium" }' >> $premium_temp

sudo apt update -y && sudo apt install apt-user-agent-zorin-os-premium zorin-os-premium-keyring -y


xfce=(
 # DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING!
 zorin-appearance-layouts-xfce-premium
 zorin-os-pro-wallpapers
 zorin-os-pro-creative-suite
 zorin-os-pro-productivity-apps
 #zorin-os-pro-wallpapers-16
)

normal=(
 # DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING!
 zorin-appearance-layouts-shell-premium
 zorin-os-pro-wallpapers
 zorin-os-pro-creative-suite
 zorin-os-pro-productivity-apps
 #zorin-os-pro-wallpapers-16
)

install_xfce(){
echo "[INFO] - Installing Zorin Pro (xfce)."
for ecfx in ${xfce[@]}; do
 if ! dpkg -l | grep -q $ecfx; then
  sudo apt install "$ecfx" -y
 else
  echo "[SKIPPED] - $ecfx"
 fi
done
sleep 1
}

install_normal(){
echo "[INFO] - Installing Zorin Pro."
for lamron in ${normal[@]}; do
 if ! dpkg -l | grep -q $lamron; then
  sudo apt install "$lamron" -y
 else
  echo "[SKIPPED] - $lamron"
 fi
done
sleep 1
}

# UNCOMMENT THE VERSION YOU NEED, EITHER XFCE OR NORMAL VERSION

#install_xfce
install_normal
