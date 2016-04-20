#!/bin/bash
files=`ls -1 *.log | wc -l`
infected_files=0
for file in `\find . -maxdepth 1 -name '*.log'`; do
    tmp=`grep Infected\ files\: $file | sed -e 's/[^0-9]//g'`
    if [ $tmp != "0" ]; then
        echo -ne "\nInfected file exists.\nFilePath : "
        echo $file
        echo "Number of Infected files : ${tmp}"
        infected_files=$(( infected_files + 1 ))
    fi
done
echo -e "\nAll files were inspected."
echo "Number of detected log files / Number of All log files = ${infected_files} /" $files
