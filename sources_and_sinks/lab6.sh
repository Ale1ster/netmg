#!/usr/bin/env bash

outfile="lab6_output.text"
path_prefix="/usr/local/libexec/nagios/"

#question_template: "command | tee -a $outfile"
questions=(
	"${path_prefix}"{'check_tcp -H www.otenet.gr -p 80','check_fping unbearable_also.mooo.com','check_fping unbearable.mooo.com','check_hpjd -H blondie','check_http -H localhost -p 80'}" | tee -a $outfile"
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
