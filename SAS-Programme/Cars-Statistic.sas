* Ausgabe Workspace-Pfad;
data _null_;
    put "Workspace=&WORKSPACE_PATH.";
run;  

*Ausgabeverzeichnis definieren;
libname demo "/workspaces/myfolder/SAS-Kurs/Data";

* CSV Daten imortieren;
proc import
    datafile="&WORKSPACE_PATH./SAS-Kurs/Data/cars.csv";
    out=demo.cars dbms=csv replace;
    delimiter=';';
run;

* Ausgabe der Datentabelle;
proc print data=demo.cars;
run;

* Häufigkeitsanalyse über alle Variablen; 
proc freq data=demo.cars;
run;

* Häufigkeitsanalyse nach Marke;
proc freq data=demo.cars;
    tables make / nocum;
run;

* Kreuztabelle;
proc freq data=demo.cars;
    tables make * type / nocum;
run;

* Ausgabe Häufigkeit nach Typ als Balkendiagramm;
Proc freq data=demo.cars order=freq;
    tables type / plots=freqplot (type=bar scale=percent);
Run;

* Statistiken berechnen;
proc means data=demo.cars;
run;

* Statistiken berechnen nach Marke;
proc means data=demo.cars;
    by make;
run;

* Statistiken berechnen nach Marke;
proc means data=demo.cars maxdec=1;
    var EngineSize;
    class make type;
    types () make*type;
run;