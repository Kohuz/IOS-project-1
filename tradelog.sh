#!/bin/bash
POSIXLY_CORRECT=yes


# while [ $i -ne 0 ]
# do
#
# echo $i
# shift $i

command=0
while (( "$#" )); do
  case "$1" in
    "-h") echo "help used";;
    "--help") echo "help used";;
    "list-tick") command+=1
    echo "list-tick";;
    "profit") command+=1
    echo "profit";;
    "pos") command+=1
    echo "pos";;
    "last-price") command+=1;
    echo "last-price";;
    "hist-ord") command+=1;
    echo "hist-ord";;
    "graph-pos") command+=1;
    echo "graph-pos";;


  esac
  if [ $command -gt 1 ]
  then
  echo "error"
  break
  fi
  shift
done


# done
