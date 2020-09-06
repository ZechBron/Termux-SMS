#!/bin/bash
clear
echo -e "\e[32m   ______                                  _____ __  ________ "
echo -e "  /_  __/__  _________ ___  __  ___  __   / ___//  |/  / ___/ " 
echo -e "   / / / _ \/ ___/ __ '__ \/ / / / |/_/   \__ \/ /|_/ /\__ \ "
echo -e "  / / /  __/ /  / / / / / / /_/ />  <    ___/ / /  / /___/ / "
echo -e " /_/  \___/_/  /_/ /_/ /_/\__,_/_/|_|   /____/_/  /_//____/  \e[0m"

echo -e "\e[34m\"If you are too lazy to type a single command,"
echo -e " Allow my program to do it for you.\"\e[0m"
echo -e " -\e[90m(https://github.com/ZechBron)\e[0m"

pm list packages -3 > log
zCh=$(grep "package:com.termux.api" log)
ChB="package:com.termux.api"
echo -e "\n"

if [ "$zCh" = "$ChB" ]; then
   rm -f log
   while [ -z "$num" ]
   do
      echo -e "\e[31m[\e[0m\e[32mZ\e[0m\e[31m]\e[0m \e[32mEnter number(s seperated by comma e.g 09123456789,09987654321,09123498765)\e[0m\e[34m"
      read num
   done
   while [ -z "$msg" ]
   do
      echo -e "\e[31m[\e[0m\e[32mZ\e[0m\e[31m]\e[0m \e[32mEnter Message:\e[0m\e[34m"
      read msg
   done

   termux-sms-send -n "$num" "$msg"

   if [ $? = 0 ]; then
      echo -e "\e[32mSent succesfull.\e[0m"
   elif [ $? = 1 ]; then
      echo -e "\e[91mSending failed. You might want to try again.\e[0m"
   else
      echo "Unknown error."
   fi

elif [ "$zCh" != "$ChB" ]; then
   echo -e "\e[91mLooks like you don't have termux-api app. Please install it first.\e[0m"
else
   echo "unknown error"
fi

rm -f log
