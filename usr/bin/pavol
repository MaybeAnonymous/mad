#!/bin/perl
use warnings;
use strict;
use v5.010;

$_ = qx/pacmd list-sinks/;
my ($sink, $vol) = /(?:^|\n)\h*\* index: (\S+).*?\n\h*volume:[^\n]*?(\d+)%/s;
if (scalar @ARGV == 1 and $ARGV[0] =~ /^ (-|\+)? (\d+)% | (toggle) $/x) {
    if ($3) {
        system "pactl set-sink-mute $sink toggle";
    } else {
        if (not $1) { $vol = $2; }
        elsif ($1 eq "-") { $vol -= $2; }
        elsif ($1 eq "+") { $vol += $2; }
        $vol = 0 if $vol < 0;
        $vol = 100 if $vol > 100;
        system "pactl set-sink-volume $sink $vol%";
    }
} else {
    my $name = $0 =~ s|.*/||r;
    print <<END;
Usage: $name [-|+]VOL% | toggle
Ex.:   $name 100%
       $name -5%
       $name +5%
       $name toggle   # mute/unmute
END
}
