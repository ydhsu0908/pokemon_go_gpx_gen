
sub InsertGPSNode {
  my ($pre_x, $pre_y, $cur_x, $cur_y, $dis, $of) = @_;

  ## Calculate total steps
  my $steps = $dis / 0.002;     ##1 step = 0.001 KM 

  if($steps < 1) {
     $steps = 1; 
  }
  #print $of "Pre:   ".$pre_x.",".$pre_y."\n";
  #print $of "Cur:   ".$cur_x.",".$cur_y."\n";
  #print $of "Dis:   ".$dis."\n";
  #print $of "Steps: ".$steps."\n";

  my $sp_x = 0;
  my $sp_y = 0;

  if($steps == 1){
    print $of "<wpt lat=\"".$cur_x."\" lon=\"".$cur_y."\"></wpt> \n";
  }
  else{
    for($i=1; $i<$steps; $i++){
       ## Calculate X space
       if($cur_x > $pre_x) {
         $sp_x = ($cur_x - $pre_x) / $steps; 
         $cal_x = $pre_x + ($sp_x * $i);
       }
       elsif ($cur_x == $pre_x) {
         $sp_x = 0;   
         $cal_x = $pre_x;
       }
       else{
         $sp_x = ($pre_x - $cur_x) / $steps;  
         $cal_x = $pre_x - ($sp_x * $i);
       }

       ## Calculate Y space
       if($cur_y > $pre_y) {
         $sp_y = ($cur_y - $pre_y) / $steps;  
         $cal_y = $pre_y + ($sp_y * $i);
       }
       elsif ($cur_y == $pre_y) {
         $sp_y = 0;   
         $cal_y = $pre_y;
       }
       else{
         $sp_y = ($pre_y - $cur_y) / $steps;  
         $cal_y = $pre_y - ($sp_y * $i);
       }
       print $of "<wpt lat=\"".$cal_x."\" lon=\"".$cal_y."\"></wpt> \n";
    } #for
       print $of "<wpt lat=\"".$cur_x."\" lon=\"".$cur_y."\"></wpt> \n";      
  } #else 
}
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::                                                                         :::
#:::  This routine calculates the distance between two points (given the     :::
#:::  latitude/longitude of those points). It is being used to calculate     :::
#:::  the distance between two locations using GeoDataSource(TM) products    :::
#:::                                                                         :::
#:::  Definitions:                                                           :::
#:::    South latitudes are negative, east longitudes are positive           :::
#:::                                                                         :::
#:::  Passed to function:                                                    :::
#:::    lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees)  :::
#:::    lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees)  :::
#:::    unit = the unit you desire for results                               :::
#:::           where: 'M' is statute miles (default)                         :::
#:::                  'K' is kilometers                                      :::
#:::                  'N' is nautical miles                                  :::
#:::                                                                         :::
#:::  Worldwide cities and other features databases with latitude longitude  :::
#:::  are available at http://www.geodatasource.com	                     :::
#:::                                                                         :::
#:::  For enquiries, please contact sales@geodatasource.com                  :::
#:::                                                                         :::
#:::  Official Web site: http://www.geodatasource.com                        :::
#:::                                                                         :::
#:::            GeoDataSource.com (C) All Rights Reserved 2015               :::
#:::                                                                         :::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

$pi = atan2(1,1) * 4;

sub distance {
	my ($lat1, $lon1, $lat2, $lon2, $unit) = @_;
	my $theta = $lon1 - $lon2;
	my $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
  $dist  = acos($dist);
  $dist = rad2deg($dist);
  $dist = $dist * 60 * 1.1515;
  if ($unit eq "K") {
  	$dist = $dist * 1.609344;
  } elsif ($unit eq "N") {
  	$dist = $dist * 0.8684;
		}
	return ($dist);
}

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::  This function get the arccos function using arctan function   :::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sub acos {
	my ($rad) = @_;
	my $ret = atan2(sqrt(1 - $rad**2), $rad);
	return $ret;
}

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::  This function converts decimal degrees to radians             :::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sub deg2rad {
	my ($deg) = @_;
	return ($deg * $pi / 180);
}

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::  This function converts radians to decimal degrees             :::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sub rad2deg {
	my ($rad) = @_;
	return ($rad * 180 / $pi);
}

#print distance(32.9697, -96.80322, 29.46786, -98.53506, "M") . " Miles\n";
#print distance(32.9697, -96.80322, 29.46786, -98.53506, "K") . " Kilometers\n";
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

