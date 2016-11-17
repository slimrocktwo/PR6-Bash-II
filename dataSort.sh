#!/bin/bash

## Created by Steve Langewicz II
## PR 6 Data Sort 11-16-2016

IFS=","

declare -a lastNames
declare -a firstNames
declare -a addresses
declare -a cities
declare -a states
declare -a zipCodes
declare -a ages
declare -i index

declare -i SS_AGE="65"
declare inFile="$1" ## Reads from input file


main(){
        readFile
        benefitCheck


}

readFile(){
        declare -i lineNum=0
        echo -e "Reading Data "
        while read lastName firstName address city state zipCode age
        do
                lastNames[$lineNum]=$lastName
                firstNames[$lineNum]=$firstName
                addresses[$lineNum]=$address
                cities[$lineNum]=$city
                states[$lineNum]=$state
                zipCodes[$lineNum]=$zipCode
                ages[$lineNum]=$age
                (( lineNum++ ))
        done < $inFile

}


benefitCheck(){
        declare -i numReachedAge="0"
        for (( i=0; i < ${#ages[@]}; i++ )){
                if [[ ${ages[i]} -ge 65 ]]
                then
                        (( numReachedAge++ ))
                fi

        }
        echo -e "\n\n$numReachedAge employee(s) are eligible for Social Security benefits."

}


main
