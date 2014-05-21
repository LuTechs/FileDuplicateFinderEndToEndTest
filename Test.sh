#!/bin/bash

echo "==================================================================="
echo '=                  Start Test FileDuplicateFinder                 ='
echo "===================================================================\n\n"

echo "======================Create Test Data============================"
mkdir TestData
mkdir -p TestData/Sub_dir1
mkdir -p TestData/Sub_dir2

for (( i = 1; i <= 10; i++ )); do

		echo "This is the test conten\n Java FileDuplicateFinder Program is written with TDD Aproach" >> TestData/Sub_dir1/file$i.txt
		echo "This is the test conten\n " >> TestData/Sub_dir2/another_file$i.txt
		echo "This is the test conten\n " >> TestData/another_file$i.txt
		echo "This is the test conten\n Java FileDuplicateFinder Program is written with TDD Aproach" >> TestData/file$i.txt

done
echo "\n"
echo "====================Print Processor Test============================"

java -jar FileDuplicateFinder-1.0-SNAPSHOT.jar TestData >>PrintResult.txt
d1=$(diff expectedResultForPrint.txt PrintResult.txt)
if [[  $d1 == "" ]]; then
	echo Print Funcationality Test Success
else
	echo Print Funcationality Test Fail
fi

echo "===================================================================\n\n"
echo "==================Delete Processor Test============================"
java -jar FileDuplicateFinder-1.0-SNAPSHOT.jar TestData -d
find TestData/  >> DeleteResult.txt

d2=$(diff expectedResultForDelete.txt  DeleteResult.txt)

if [[ $d2 == "" ]]; then
	echo Delete Funcationality Test Success
else
	echo Delete Funcationality Test Fail
fi
echo "===================================================================\n\n"


rm PrintResult.txt
rm DeleteResult.txt
rm -rf TestData