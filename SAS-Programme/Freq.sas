
/* alles was
hier steht ist ein 
Kommentar
*/

* Auch ein Kommentar;

/* Listet alle Macro Variablen auf */
data _null_
    %put _ALL_;
run; 

* Define Macro variable &PATH;
* %let PATH=/export/viya/homes/ralf.storch@sas.com/Test;
%symdel PATH;
%let PATH=C:\TestData;

*Ausgabeverzeichnis definieren;
libname demo "&PATH";

* CSV Daten imortieren;
proc import
    datafile="&PATH/cars.csv"
    out=demo.cars1 dbms=csv replace;
    delimiter=';';
run;

* Ausgabe der Datentabelle;
proc print data=demo.cars;
run;

data demo.bmw;
    set demo.cars;
    where make = "BMW";
    test = put(enginesize*10, 10.);
run;    

proc print data=demo.bmw;
run;

proc contents data=demo.bmw;
run;

* Häufigkeitsanalyse über alle Variablen; 
proc freq data=demo.cars;
run;

/*******
Häufigkeitsanalyse nach Marke
Keine kumulierten Häufigkeiten
Ausgabe in die Tabelle demo.carsfreq
*******/
proc freq data=demo.cars;
    tables make / nocum out=demo.carsfreq;
run;

proc print data=demo.carsfreq;
run;

* Kreuztabelle;
proc freq data=demo.cars;
    tables make * type / nocum;
run;

* Ausgabe Häufigkeit nach Typ als Balkendiagramm;
Proc freq data=demo.cars order=freq;
    tables type / plots=freqplot (type=bar scale=percent);
run;

* Statistiken berechnen;
proc means data=demo.cars;
run;

* Statistiken berechnen nach Marke;
proc means data=demo.cars;
    by make;
run;




* list all available ods styles;
proc template;
   path sashelp.tmplmst;
   list styles;
run;

/* Close any open destinations to save resources */
ods _all_ close;

/* Define the Word file path and name */
ods word file="&PATH/results.docx" style=Word;

* Statistiken berechnen nach Marke;
proc means data=sashelp.cars maxdec=1;
    var EngineSize cylinders;
    class make type;
    types () make*type;
run;

/* Close the ODS WORD destination */
ods word close;