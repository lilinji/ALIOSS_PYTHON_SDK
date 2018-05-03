#!/bin/bash
#########################################################################
# File Name: cp_source_dest.sh
# Author: lilinji
# mail: lilinji@novogene.com
# Created Time: Thu 03 May 2018 09:40:20 AM CST
#########################################################################



#BUCKET='oss://novo-it'
#Object='P101SC17031254-01_taizishen_GD/fa_data'
#NAME='m54174_170529'
#Des_Object='lilinji'

BUCKET=$1
Object=$2
NAME=$3
Des_Object=$4



echo_color(){
    if [ $1 == "green" ]; then
        echo -e "\033[32;40m$2\033[0m"
    elif [ $1 == "red" ]; then
        echo -e "\033[31;40m$2\033[0m"
    fi
}

usage() {
    echo "Usage: cmd [Bucket] [Object] [prefix_name] [destination_dir]"
    echo "sh cp_source_dest.sh oss://novo-it P101SC17031254-01_taizishen_GD/fa_data  m54174_170529 lilinji  "
}
# It's a good rule to manually decrease OPTIND after calling getopts

# This if-loop is required to catch the "no argument" use case
if [ $# -le  3 ]; then
  usage  
  exit 1
  else 
    osscmd ls $BUCKET/$Object/$NAME |awk '{print $5}' |grep 'oss' |awk  -F "/" '{print "osscmd  copy " $0 "  '$BUCKET/$Des_Object/'"$NF}'  
    echo "Done!!!" && echo
fi
