# WebProject
Versione 1.0. <br />
Autori: Gilberti Nicola, Grigoletto Riccardo, Marinangeli David, Pani Mirko, Roberti Marco, Schiavon Nicola <br />
Università di Trento <br />


# Database
Come DBMS per il nostro database utilizziamo PostgreSQL (Versione 9.5). La creazione del database e la popolazione dello stesso possono essere effettuate attraverso i file "tabelleDB.sql" e "insert.sql" che sono collocati nella cartella "sql".

La prima riga del file "tabelleDB.sql" contiene, difatti, il comando di creazione del database. L'accesso al database, se le credenziali di accesso sono diverse da <i>postgres</i> - <i>postgres</i>,non può avvenire. Bisogna dunque dirigersi all'interno del package "database" e successivamente aprire il file "ManagerDB" cambiando le credenziali con quelle opportune.