#!/bin/sh
POSIXLY_CORRECT=yes


DATE_REGEX="" #TODO

T_FILTER=""
DATE_FILTER_A=""
DATE_FILTER_B="3000-12-31 23:59:59"
FILES=""
LIST_TICK=0
command=0
while [ $# -gt 0 ]; do
  case "$1" in
    "-h") echo "help used";;
    "--help") echo "help used";;

    "list-tick") command+=1
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


    "-a") DATE_FILTER_A="$2 "
    echo $DATE_FILTER_A
    shift;;
    "-b") echo "$2"
    shift;;
    "-t") T_FILTER+="$2 "
    shift;;
    "-w") echo "$2"
    shift;;

    *.log) FILES+="$1 "
    ;;
    *.gz) gzip -dk "$1"
    FILES+="${1%%.*}.log ";;



  esac
  if [ $command -gt 1 ]
  then
  echo "error"
  exit
  fi
  shift
done

# awk -F ';' '{print $2, $NF}' ${FILES[@]}




if [ $LIST_TICK -eq 1 ]
then
    if [ "$T_FILTER" = "" ]
    then
    cat ${FILES} | awk -v date_after="$DATE_FILTER_A" -F ';' '($1 > date_after){print $2;}' | sort -u
    else
    cat ${FILES} | awk -v string="$T_FILTER" -F ';' '{if($1 > date_after && match(string, $2) ) {print $2}}' | sort -u
    fi
exit 0
fi


if [ $PROFIT -eq 1 ]
then
cat ${FILES} | awk -v string="$T_FILTER" -F ';' '{if(string==""){if($3 == "buy"){sum+=$6*$4}else{sum-=$6*$4}}}END{printf "%.2f\n", sum}'
exit 0
fi

if [ "$T_FILTER" = "" ]
then
cat ${FILES}
else
cat ${FILES} | awk -v string="$T_FILTER" -F ';' 'match(string, $2) {print}'
exit 0
fi
# awk -F ';' '{print $2, $NF}' ${FILES[@]}
 # else if(match(string, $2)){{sum+=$2;} END{print sum;}}
# done
