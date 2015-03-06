REM To run:
REM    1. Get a time machine
REM    2. Travel back to the early 90s
REM    3. In MS-DOS 5+, run `qbasic /run CHALLEN1.BAS`

 10 PRINT "Enter a whole number between 1000 and 999999 without spaces or commas."
 20 INPUT "", N&
 30 IF N& < 1000 OR N& > 999999 THEN GOTO 10
 40 PRINT LTRIM$(STR$(INT(N& / 1000)));
 50 PRINT ",";
 60 LET N = N& MOD 1000
 70 IF N < 100 THEN GOTO 100
 80 PRINT LTRIM$(STR$(N))
 90 SYSTEM
100 IF N < 10 THEN PRINT "0";
110 PRINT "0";
120 GOTO 80
