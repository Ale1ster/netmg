#!/usr/bin/env perl

use v5.14;
use warnings;
use strict;

my $DUMP;
open DUMP, "<", "lab2_output.text";
my $OUT;
open OUT, ">", "lab2_whois_output.text";

while (<DUMP>) {
	# Skip useless lines
	next if m/(?: ^\s+$ ) | (?: \*\s+ ){3} | (?: =+ )/x;
	# Find host and ip
	my ($host, $ip) = $_ =~ m/(?:\s+)?\d+\s+ (.*)\s \( ( (?:\d+\.){3}\d+ ) \)/x;
	# Run whois on specified ip
	my ($as_no, $domain) = `whois -h asn.shadowserver.org "origin $ip"` =~ m/^(\d+) \s+\|\s+.*?\|\s+ ([^\|\s]+)/x;
	say OUT join "\t-->\t", ($host, $ip, $as_no, $domain);
}

close OUT;
close DUMP;
