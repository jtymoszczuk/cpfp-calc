#!/bin/bash

echo "This estimates how many sats/vbyte you need to bump your child tx to get your desired parent fee"

#x= targetChildFee
#x = (sat/vB_effective * (vB_parent + vB_child) - current_parent_fee) / vB_child
# credit to https://twitter.com/Bitcoinite21 for his work on the formula.

read -p "Enter the total amount of sats your current(parent) tx cost? " currentFee

read -p "What fee do you want your tx to be in sats/vbyte? " effectiveFee

read -p "Enter Virtual size of Parent? " vBParent

read -p "Enter Virtual size of child? " vBChild

x=$(echo "scale=2; (($effectiveFee * ($vBParent + $vBChild)) - $currentFee) / $vBChild" | bc)

echo -e "Your Child tx needs to be \033[32m$x\033[0m sats/vByte for your parent tx to be \033[32m$effectiveFee\033[0m sats/vByte"
