#!/bin/bash
pkg install termux-api -y
pkg install termux-tools -y
pkg install grep -y

chmod +x TermuxSMS.sh

pm list packages -3 > log
grep "package:com.termux.api" log
if [ $? = 0 ]; then
   echo -e "\e[32mSetting up done.\e[0m"
elif [ $? = 1 ]; then
   echo -e "\e[91mYou don't have termux-api app.\nPlease install it first here: \e[0m"
   echo "   https://m.apkpure.com/termux-api/com.termux.api/download/31-APK"
fi
rm -f log

