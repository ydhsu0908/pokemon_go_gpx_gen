#!/usr/bin/perl

print "Example : 38.433933, 141.310141 \n";
print "Enter   : ";  
$input = <>;
chomp($input);

$datestring = localtime();
print "\033[31m$datestring\033m\n";
#@months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
#@days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
#($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
#print "$hour:$min:$sec $mday/$months[$mon] $days[$wday]\n";

my @arr = split /,/, $input;

$cord1_x = $arr[0];
$cord1_y = $arr[1];

open df, "> ./output/ydhsu_autojitter.gpx" or die;

print df "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\" ?> \n";
print df "<gpx version=\"1.1\" creator=\"Xcode\"> \n"; 
print df "<wpt lat=\"".$cord1_x."\" lon=\"".$cord1_y."\"></wpt> \n";

## Add Jitter
$cord1_x_tmp = $cord1_x + 0.000002341;
$cord1_y_tmp = $cord1_y + 0.000000001;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000000022;
$cord1_y_tmp = $cord1_y + 0.000002325;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000002446;
$cord1_y_tmp = $cord1_y + 0.000004425;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000003446;
$cord1_y_tmp = $cord1_y + 0.000004775;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000003111;
$cord1_y_tmp = $cord1_y + 0.000006775;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000003333;
$cord1_y_tmp = $cord1_y + 0.000005885;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000013333;
$cord1_y_tmp = $cord1_y + 0.000015885;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000010003;
$cord1_y_tmp = $cord1_y + 0.000010100;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000000003;
$cord1_y_tmp = $cord1_y + 0.000009990;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

## Add Jitter and small Move
$cord1_x_tmp = $cord1_x + 0.000010003;
$cord1_y_tmp = $cord1_y + 0.000000000;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000020330;
$cord1_y_tmp = $cord1_y + 0.000000000;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000000000;
$cord1_y_tmp = $cord1_y + 0.000012900;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000000000;
$cord1_y_tmp = $cord1_y + 0.000022111;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x - 0.000010440;
$cord1_y_tmp = $cord1_y + 0.000000000;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x - 0.000024340;
$cord1_y_tmp = $cord1_y + 0.000000000;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000000240;
$cord1_y_tmp = $cord1_y - 0.000023000;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

$cord1_x_tmp = $cord1_x + 0.000012340;
$cord1_y_tmp = $cord1_y - 0.000019900;
print df "<wpt lat=\"".$cord1_x_tmp."\" lon=\"".$cord1_y_tmp."\"></wpt> \n";

print df "</gpx> \n";
