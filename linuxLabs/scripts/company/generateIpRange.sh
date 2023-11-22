#!/bin/bash


if [ "$#" -ne 1 ]
then
  echo "Invalid Syntax!"
  echo "Usage: $0 <ip_subnet>"
  echo "Example: $0 192.168.56"
else

  subnet=$1
  for i in $(seq 1 254)
  do
    echo "${subnet}.${i}"
  done

fi

