all:
	cat Sub_InsertGPSNode.pl Sub_DistanceCal.pl AutoInsertGPS.pl > PKMG_GPX.pl
	perl PKMG_GPX.pl

1km:
	cat Sub_InsertGPSNode.pl Sub_DistanceCal.pl AutoCircle1km.pl > PKMG_GPX.pl
	perl PKMG_GPX.pl

