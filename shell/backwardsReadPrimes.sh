#!/bin/bash

#Naive Method
#Backwards Read Primes are primes that when read backwards in base 10 (from right to left) are a different prime. (This rules out primes which are palindromes.)
#Examples:
#13 17 31 37 71 73 are Backwards Read Primes

checkPrime() {
y=2
flag=0
number=$1
while [[ $y -lt $number ]]
do
  if (( $number % $y == 0 ))
  then
    flag=1
    break 2;
  fi
  ((y+=1))
done
echo $flag
}

backwardsPrime() {
x=$1
main=""
while [[ $x -le $2 ]]
do

flag=$(checkPrime $x)

if [[ $flag -eq 0 ]]
  then
  sd=0
  rev=""
  z=$x
  n=$x
  while [[ $n -gt 0 ]]
  do
    sd=$(( $n%10 ))
    n=$(( $n/10 ))
    rev=$( echo ${rev}${sd} )
  done
  if [[ $x -ne $rev ]]
  then
    flag=$(checkPrime $rev)
    if [[ $flag -eq 0 ]]
    then
      main=$( echo ${main} ${x} )
    fi
  fi
fi
(( x+=1 ))
done
echo $main
}

backwardsPrime $1 $2
