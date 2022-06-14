# Nodarbība 09

## Uzdevums 1 : Datu eksports / imports

### Datu eksports

Uzdevumi: 
- [ ] Pieslēdzieties lokālam MySQL serverim ar MySQL Workbench, vai ar komandrindas klientu.
•	Izeksportējiet jebkādu tabulu no jebkādas Jūsu datu bāzes failā ar komandas SELECT ... INTO OUTFILE ... palīdzību. Būtiska nianse ir, ka ar šo komandu ir iespējams eksportēt failā tikai servera failu sistēmā; Jums nav iespēju šo failu dabūt pie sevis, ja vien Jums nav piekļuves servera darba stacijai.
- [ ] Vispirms pārbaudiet Jūsu servera konfigurāciju, kurās direktorijās tas ļauj rakstīt : SELECT @@GLOBAL.secure_file_priv; Ja tur ir norādīta(s) direktorija(s), izmantojiet to. Ja ir atgriezts tukšs rezultāts, tad ir atļauts rakstīt visur. Savukārt ja tas ir NULL, tas nozīmē ka ir aizliegtas operācijas ar failiem -- šajā gadījumā jāveic MySQL servera konfigurācijas izmaiņas, pēc kurām serveris jāpārstartē. Ceru ka tas nevienam nebūs vajadzīgs :) ; bet ja nu tomēr, izmantojiet Google lai atrastu risinājumu.
- [ ] Direktorija, kurā veiksit datu eksportu, iespējams ka pēc noklusējuma nebūs Jums pieejama. Windows gadījumā varēsit tai piekļūt ar administratora tiesībām. Linux gadījumā terminālī būs jāpārslēdzas uz root lietotāju, ar to nomainīt direktorijai tiesības lai Jūsu OS lietotājs var tai piekļūt, ar komandu chmod.
•	Pieslēdzieties ar MySQL Workbench attālinātam (remote) MySQL serverim; varat arī turpināt strādāt ar lokālo serveri. Aizejiet uz DB objektu navigatoru, tabulas sadaļu (kreisajā pusē). Uzklikšķiniet ar peles labo pogu uz kādas tabulas, un izvēlieties Table Data Export Wizard. Šādā veidā varēsit izeksportēt tabulas datus arī no remote datu bāzes uz savu lokālu direktoriju. Varat pamēģināt arī JSON formātu, un paskatīties kā tas izskatās.
 
Datu imports
- [ ] Pieslēdzieties ar MySQL Workbench remote serverim.
- [ ] Izveidojiet datubāzē tabulu-kopiju tai tabulai, ko izeksportējāt pirmajā nodarbības daļā. Ja eksportējāt no šīs pašas datu bāzes, tad pamainiet tabulas nosaukumu; šādā gadījumā varat arī izmantot vienas db priekšrocību -- veidojiet tabulas kopiju ar komandu CREATE TABLE table_copy AS SELECT * FROM table ; datus vai nu izdzēsiet pēc veidošanas ar DELETE, vai nu nodrošiniet lai veidošanas komandas SELECT atgriež 0 ierakstu.
- [ ] Aizpildiet jaunu tabulu ar datiem, palaižot datu importu ar LOAD DATA LOCAL INFILE komandu.
- [ ] Ja ir failure ar kļūdu Error Code: 3948. Loading local data is disabled, izpildiet SET GLOBAL local_infile=1;. Kā arī varat apskatīt ka izmaiņas ir spēkā ar : SHOW GLOBAL VARIABLES LIKE 'local_infile';.
- [ ] Ja ir failure ar Error Code: 2068. LOAD DATA LOCAL INFILE file request rejected due to restrictions on access., aizvēriet konekciju un MySQL Workbench sākumekrānā pamainiet konekcijas konfigurāciju. Apraksts no šīs web lapas : https://stackoverflow.com/questions/63361962/error-2068-hy000-load-data-local-infile-file-request-rejected-due-to-restrict
This restriction can be removed from MySQL Workbench 8.0 in the following way. Edit the connection, on the Connection tab, go to the 'Advanced' sub-tab, and in the 'Others:' box add the line 'OPT_LOCAL_INFILE=1'.

Saglabājiet savu kodu failā. Failu saglabājiet pasniedzēja norādītajā vietā.