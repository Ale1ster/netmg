#!/usr/bin/env bash

outfile="lab1_output.text"

#question_template: "command | tee -a $outfile"
questions=(
#Q_1_a,c
	{'ping -c 4','traceroute -P udp','traceroute -P icmp'}" www."{'esa.int','grnet.gr','stanford.edu','wikipedia.org','facebook.com'}" | tee -a $outfile"
#Q_1_b
	"ping -c 4 -s "{'64','1400'}" www."{'esa.int','grnet.gr','stanford.edu'}" | tee -a $outfile"
#Q_1_d
	####The "both directions" clause is troubling me
	"ping -c 4 -R www."{'uoa.gr','auth.gr','esa.int'}" | tee -a $outfile"
)
##LINUX(!) => Dont work on BSD: "traceroute -M {udp,icmp}"

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
