#!/bin/bash

#Naive Method
#Backwards Read Primes are primes that when read backwards in base 10 (from right to left) are a different prime. (This rules out primes which are palindromes.)
#Examples:
#13 17 31 37 71 73 are Backwards Read Primes

prime(){
    sqrtofn=`echo "sqrt($1)" | bc `
    res=1
    if [ $(($1%2)) -eq 0 ] ; then
        res=0
    else
        for((i=3;i <= $sqrtofn;i+=2)) do
            if [ $(($1%$i)) -eq 0 ] ; then
                res=0
                break
            fi
        done
    fi
    echo $res
}
backwardsPrime() {
  for i in $(seq $1 $2) ;do
    if [ $(prime $i) == 1 ]; then
      rv=$(echo $i | rev)
      if [ "$rv" != "$i" ] && [ $(prime $rv) == 1 ]; then
        array=(${array[@]} $i)
      fi
    fi
  done
  echo ${array[@]}
}
backwardsPrime $1 $2
