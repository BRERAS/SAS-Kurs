proc means data=sashelp.class maxdec=2;
    class sex;
run;

proc means data=casuser.a maxdec=2;
    class sex;
run;


ods graphics on;
proc freq data=sashelp.class;
   tables sex/
          plots(only)=freqplot(twoway=cluster);
run;
ods graphics off;