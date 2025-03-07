libname demo "/workspaces/myfolder/Course/data";

proc import
    datafile="&WORKSPACE_PATH./Course/data/cars.csv"
    out=demo.cars dbms=csv replace;
    delimiter=';';
run;


proc print data=demo.cars;
run;

proc freq data=demo.cars;
run;

proc means data=demo.cars;
run;

proc means data=demo.cars;
    by make;
run;