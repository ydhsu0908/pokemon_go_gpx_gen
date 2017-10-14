# pokemon_go_ruote_gen
Generate GPX file by coordinations

[Initial version]
there're two ways to generate a GPX file:
- Method 1:
  > Perl AutoInsertJitter.pl
  * Then input a coordination and get a output GPX file with several coordinations by inserting random jitters 
  
- Method 2:  
  * Edit /input/input.gps with desired GPS coordinations
  > Make all
  * Then script will auto-insert multiple coordinations considered by human walk speed and output a GPX file 
