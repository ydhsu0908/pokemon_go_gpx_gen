#!/usr/bin/perl

#use strict;
use warnings;

open $if, "< input/input.gps"  or die "Can't open file to read\n";
open $of, "> output/output.gpx" or die "Can't open file to write\n";

my $pre_x;
my $pre_y;
my $cur_x;
my $cur_y;

my $line_num = 0;

while ($line = <$if>) {
    chomp($line);
    $line_num++;
    my @arr = split /, /, $line;
    #print "--> ".$line_num.": lan=".$arr[0]." lon=".$arr[1]."\n";

    if($line_num == 1){
      $pre_x = $arr[0];  
      $pre_y = $arr[1];  
      print $of "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\" ?> \n"; 
      print $of "<gpx version=\"1.1\" creator=\"Xcode\"> \n";  
      print $of "<wpt lat=\"".$pre_x."\" lon=\"".$pre_y."\"></wpt> \n"; 
    }
    else{
      $cur_x = $arr[0];
      $cur_y = $arr[1];
      my $dis_km = &distance($pre_x, $pre_y, $cur_x, $cur_y, "K");
      #print $dis_km . " Kilometers\n";
      &InsertGPSNode($pre_x, $pre_y, $cur_x, $cur_y, $dis_km, $of);
      $pre_x = $cur_x;
      $pre_y = $cur_y;
    }
}
      print $of "</gpx> \n";

