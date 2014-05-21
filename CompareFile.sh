#!/bin/bash
d1=$(diff expectedResultForPrint.txt PrintResult.txt)
if [[  $d1 == "" ]]; then
	#statements
	echo "true"
fi

