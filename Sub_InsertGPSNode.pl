
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
