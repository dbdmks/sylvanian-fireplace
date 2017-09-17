#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
my $infile_name = 'out_candle.dat';
my $outfile_name = 'pwm_waves.h';
my $outfile_header = <<'EOD';
#define RUNTIME 1000 //seconds
#define STEPS 30 //interrupts per second
#define WAVE_SIDE_SIZE 2000

EOD

my $outfile_array_start = "\nconst uint8_t wave_side[] = {";
my $outfile_array_end = "};\n";

open (my $infile, '<',$infile_name) || die "Input file \"$infile_name\" not found, $!";
open (my $outfile, '>',$outfile_name) || die "Output file \"$outfile_name\" cannot be created, $!";
print $outfile "$outfile_header\n $outfile_array_start";

while (<$infile>) {    
    next if (/^\s*\#/ or /^\s*$/);
    (my $index, my $pwm) = /(\d+)\s+(\d+\.?\d+)/;

    die "error on string $_" if (! ($index || $pwm));
    state $last_index = 1;
    if ($last_index > $index) {
        print $outfile $outfile_array_end."\n".$outfile_array_start;
    } else {
        print $outfile ',' unless ($index == 1);
    }
    $last_index = $index;
    $pwm = ($pwm - int($pwm) > 0.5) ? (int $pwm+1) : (int $pwm);
    print $outfile "$pwm";
}
print $outfile $outfile_array_end;
close $outfile;
close $infile;
