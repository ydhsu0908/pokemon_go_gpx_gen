#!/usr/bin/perl

#use strict;
use warnings;

open $of, "> output.gpx" or die "Can't open file to write\n";

print "Example: > 38.433933, 141.310141 \n";
print "Enter (lan,lon) : ";
$input = <>;
chomp($input);

my @arr = split /, /, $input;
$x1 = $arr[0];
$y1 = $arr[1];

my $i;
my $cur_x;
my $cur_y;
my $pre_x;
my $pre_y;

for($i=1; $i<6; $i++)
{
    if($i == 1){
      $pre_x = $x1;  
      $pre_y = $y1;  
      print $of "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\" ?> \n"; 
      print $of "<gpx version=\"1.1\" creator=\"Xcode\"> \n";  
      print $of "<wpt lat=\"".$pre_x."\" lon=\"".$pre_y."\"></wpt> \n"; 
    }
    else{
      if($i == 2){  
         $cur_x = $x1;
         $cur_y = $y1 + 0.01;
      }elsif($i == 3){
         $cur_x = $x1 + 0.01;
         $cur_y = $y1 + 0.01;
      }elsif($i == 4){
         $cur_x = $x1 + 0.01;
         $cur_y = $y1;
      }else {
         $cur_x = $x1;
         $cur_y = $y1;
      }
     

      my $dis_km = &distance($pre_x, $pre_y, $cur_x, $cur_y, "K");
      #print $of $i."\n";
      #print $of $cur_x." || " .$cur_y."\n";
      #print $of $pre_x." || " .$pre_y."\n";
      #print $of $dis_km."\n";
      &InsertGPSNode($pre_x, $pre_y, $cur_x, $cur_y, $dis_km, $of);
      $pre_x = $cur_x;
      $pre_y = $cur_y;
    }
}
      print $of "</gpx> \n";

