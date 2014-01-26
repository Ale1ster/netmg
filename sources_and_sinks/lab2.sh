#!/usr/bin/env bash

outfile="lab2_output.text"

#question_template: "command | tee -a $outfile"
questions=(
#Q_2_1
	"traceroute -P icmp "{'www.geant.net','nova.torproject.org'}" | tee -a $outfile"
#Q_2_2
	"traceroute -P icmp "{'www.auth.gr','aueb.gr','uoa.gr','duth.gr','uoc.gr','www.upatras.gr','ntua.gr','panteion.gr','uth.gr','aegean.gr','uoi.gr','www.unipi.gr'}" | tee -a $outfile"
)

function report () {
	echo "========" "$1" "========" >> $outfile
	eval "$1"
	echo -e "\n" >> $outfile
}

IFS=""
rm -f "$outfile"
for i in "${questions[@]}"
do
	report "$i"
done
echo "Finished!"
