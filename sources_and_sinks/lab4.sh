#!/usr/bin/env bash

INFILE="lab4_trace.cap"
outfile="lab4_output.text"

#question_template: "command | tee -a $outfile"
questions=(
#Q_4_a
	"tshark -Y "{'"icmp.type == 8" -n','"icmp.type == 8" -N "nNC"','"ip.dst == ulysses.noc.ntua.gr"','"ip.src == ulysses.noc.ntua.gr" -T fields -e ip.id','"ip.src == www.uoa.gr" -PV','"ip.src == www.auth.gr || ip.dst == www.auth.gr"'}" -r \"$INFILE\" | tee -a $outfile"
#Q_4_b
#"touch ~/index.txt"
#	"echo '01' > ~/serial"
#	"openssl "{'genrsa -out gened.key','req -new -key gened.key -keyform PEM -out requed.csr','ca -in requed.csr -out fin.crt','s_client -state -host sorch.netmode.ntua.gr -port 443','s_client -state -host sorch.netmode.ntua.gr -port 443 -cert fin.crt -key gened.key'}" 2>&1 | tee -a $outfile"
	####On openssl queries we have to type answers, and on the last we have to type "GET /netmg.php HTTP/1.0\n\n", since the server has no expect shell.
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
