# lectura

Aplicatie pentru management-ul cartilor citite sau in curs de citire . De asemenea , pentru unele carti din programa de BAC sau selectate de catre noi se gasesc si teste , in gen quiz , cu intrebari din fiecare opera. 

## Structuri folosite in cadrul aplicatiei (fisiere)

books.txt -> descrie cartile din biblioteca utilizatorului
          ->N numarul de carti pe fiecare linie , urmat de N linii cu titlul operelor , intre ghilimele

In folderul books/ se gasesc N fisiere care descriu fiecare carte (titlu , autor , nr pagini citite/totale)->books/$titlu.txt

## Structuri folosite in cadrul aplicatiei (assets)

assets/recomandate.txt -> descrie cartile recomandate de noi
          ->N numarul de carti pe fiecare linie , urmat de N linii cu titlul operelor , intre ghilimele
                  
assets/$titlu_intrebari.txt -> descrie intrebarile deja existente 
                            -> pe prima linie N nr de intrebari
                            -> urmeaza N secvente care descriu o intrebare
                              ->'Intrebare'
                              ->X : nr de raspunsuri posibile
                                ->X linii cu fiecare raspuns ('raspuns')
                              ->Y : indicele raspunsului corect

Se gasesc exemple pentru structura in assets/


