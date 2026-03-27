* Connect to CAS using session options *;
cas conn sessopts=(timeout=1800);

libname casuser cas caslib=casuser;

data casuser.a (promote=yes);
    set sashelp.class;
    where sex = 'M';
run;    

proc print data=casuser.a;
run;

/* Delete existing session-scope and global-scope tables casuser.A by using two delete statements. */
proc casutil;
   droptable casdata="A" incaslib="casuser" quiet;
quit;

data CASUSER.A (promote=yes);
   set SASHELP.CLASS;
   where kupcase(Sex) eq "F";
run;

/* Create a permanent copy of the in-memory table casuser.A */
proc casutil incaslib="casuser" outcaslib="casuser";
   save casdata="A" replace;
quit;