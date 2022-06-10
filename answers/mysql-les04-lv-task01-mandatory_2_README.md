# Datu bāze

Piemērs ir mācību iestādes datu bāze, kurā ir informācija par grupām (*groups*) un audzēkņiem (*students*); mazākais ir divas tabulas.


## Datu modeļa apraksts
Ir divas tabulas: grupu (*groups*) un audzēkņu (*students*)

Grupu nosaukums ir grupas šifrs ir unikāls (neatkārtojas)


## ER diagramma

| Grupa                        |                 |     Audzēkni      |
| :--------------------------- | :------------:  |   --------------: |
| nosaukums                    |                 |      Vārds        |
| kursa numurs (mācību gads)   | - **atrodas** - |      Uzvārds      |  
| modifikācijas datums, laiks  |                 |                   |
|                              |                 |                   |

Relāciju tips ir 0:1<-0:N 

Katrā grupā var būt neviens līdz vairāki audzēkni, bet var būt arī ka audzēknis pagaidām nevienā grupā, kurām nav vel konkrētas grupas, kad tā (grupa) ir zināma, tad tam (audzēknim) var būt tikai viena.
