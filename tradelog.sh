#!/bin/bash
POSIXLY_CORRECT=yes


# while [ $i -ne 0 ]
# do
#
# echo $i
# shift $i

DATE_REGEX="" #TODO


command=0
while (( "$#" )); do
  case "$1" in
    "-h") echo "help used";;
    "--help") echo "help used";;

    "list-tick") command+=1
    echo "list-tick"
    LIST_TICK=1;;

    "profit") command+=1
    echo "profit"
    PROFIT=1;;

    "pos") command+=1
    echo "pos"
    POS=1;;

    "last-price") command+=1;
    echo "last-price"
    LAST_PRICE=1;;

    "hist-ord") command+=1;
    echo "hist-ord"
    HIST_ORD=1;;

    "graph-pos") command+=1;
    echo "graph-pos"
    GRAPH_POS=1;;


    "-a") echo "$2"
    shift;;
    "-b") echo "$2"
    shift;;
    "-t") echo "$2"
    shift;;
    "-w") echo "$2"
    shift;;

  esac
  if [ $command -gt 1 ]
  then
  echo "error"
  exit
  fi
  shift
done

echo $LIST_TICK
# done
