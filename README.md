# lectura

Aplicatie pentru management-ul cartilor citite sau in curs de citire . De asemenea , pentru unele carti din programa de BAC sau selectate de catre noi se gasesc si teste , in gen quiz , cu intrebari din fiecare opera. 

## Structuri folosite in cadrul aplicatiei (fisiere)

books.txt -> descrie cartile din biblioteca utilizatorului<br/>
          ->N numarul de carti pe fiecare linie , urmat de N linii cu titlul operelor , intre ghilimele<br/>

In folderul books/ se gasesc N fisiere care descriu fiecare carte (titlu , autor , nr pagini citite/totale)->books/$titlu.txt<br/>

## Structuri folosite in cadrul aplicatiei (assets)

assets/recomandate.txt -> descrie cartile recomandate de noi<br/>
          ->N numarul de carti pe fiecare linie , urmat de N linii cu titlul operelor , intre ghilimele<br/>
                  
assets/$titlu_intrebari.txt -> descrie intrebarile deja existente <br/>
                            -> pe prima linie N nr de intrebari<br/>
                            -> urmeaza N secvente care descriu o intrebare<br/>
                              ->'Intrebare'<br/>
                              ->X : nr de raspunsuri posibile<br/>
                                ->X linii cu fiecare raspuns ('raspuns')<br/>
                              ->Y : indicele raspunsului corect<br/>
<br/>
Se gasesc exemple pentru structura in assets/
<br/>

