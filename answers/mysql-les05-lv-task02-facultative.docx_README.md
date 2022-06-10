# Lesson 5

##Task 2 :

### Queries (datu vaicājumi), execution plan (izpildes plāns), index (indeksēšana)

Vaicājumi, izpildes plāns (execution plan)

- [x] Pieslēdzieties iepriekšējā nodarbībā izveidotajai datu bāzei. Izmantojiet MySQL Workbench.
- [x] Uzrakstiet vaicājumu no divām tabulām, izmantojot primary key lauku master tabulā un foreign key lauku detail tabula, lai savienotu tabulas (JOIN daļa vaicājumā). Izpildiet vaicājumu. **FAILS mysql-les05-lv-task02-facultative.docx.sql**
- [x] Pēc noklusējuma tiek parādīti atlasīti dati (Result Grid). Apskatiet, labajā pusē ir vertikāla izvēlne -- pirmā opcija ir Result Grid. Savukārt pēdējā ir Execution Plan, izmantojiet to lai ieraudzītu kā datu bāze izpilda jūsu vaicājumu. **FAILS mysql-les05-lv-task02-facultative.docx_explain_no_index.png *BEZ INDEKSIEM***.
- [x] Izveidojiet indeksus abās tabulās, šobrīd tikai primary key laukiem. Izpildiet vaicājumu tagad, un apskaties izpildes plānu. **FAILS mysql-les04-lv-task01-mandatory_Query1.sql** UN png **mysql-les05-lv-task02-facultative.docx_explain.png AR *PRIMARY KEY***
- [ ] Izveidojiet indeksu details tabulā foreign key laukam. Izpildiet un apskatiet izpildes plānu.