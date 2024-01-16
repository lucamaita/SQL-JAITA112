-- Commento monoriga (lo spazione DEVE esserci)
# Commento monoriga
/*
 Commento multiriga
*/

#					ATTENZIONE!!!!
# RICORDATEVI SEMPRE CHE E' IL SERVER AD AVERE RAGIONE, NON LO SCRIPT!

#COMANDO: Creazione di un database chiamato PrimoDataBase
CREATE DATABASE PrimoDB112;

# DETTAGLI
# 	1) SQL NON e' CaseSensitive, cioè non gli interessa se scrite in CAPS o in minuscolo: per lui è uguale.
# 		La convezione però ci dice di scrivere in CAPS le parole che sono comandi 
# 		(cioè tutte le parole scritte in grassetto colorate o in generale diverse dal nero classico)
# 	2) In SQL non basta scrivere lo script ma va lanciato affinchè sia eseguito relamente dal server.
# 		ATTENZIONE! Lanciare lo script è come incidere i comandamenti su pietra: una volta fatto è molto 
#		molto molto difficile tornare indietro, spesso è impossibile senza scrivere nuovi comandi.
# 	3) Una volta eseguito lo script, per SQL quello script non ha più valore.
# 		Per eseguire uno script si deve evidenziare tutto il comando, dalla prima lettera fino al ; 
#		e cliccare sul fulmine "libero" da altri disegni(il primo della fila)

#COMANDO: Usa il database PrimoDB112
USE PrimoDB112;

# DETTAGLI
# 	USE Serve per indicare quale datebase usare, cioè su quale DB salvare le cose che volete fare.
# 	RICORDATEVI di lanciare il comando USE ogni volta che cambiate database o che riaprite MySQL.

#COMANDO: Creare la tabella Persone
CREATE TABLE Persone
(
	nome VARCHAR(60),
    cognome VARCHAR(80),
    citta_residenza VARCHAR(50),
    dob DATE,
    stipendio DOUBLE,
    #stipendio2 DECIMAL(7,2),
    numero_civico INT,
    sposato BOOL
);

# DETTAGLI
#	1) Le convenzioni ci dicono che i nomi delle tabelle devono essere al plurale, perchè rappresentano 
#		molti record diversi allo stesso tempo (i record si possono anche chiamare righe o tuple)
#	2) Quando create una tabella dovete scrivere le colonne che la formeranno: le colonne si scrivono mettendo
#		prima il nome della colonna e dopo il tipo di dato che ci vogliamo salvare dentro.
#		Se ci sono caratterische ulteriori vanno posizionate dopo il tipo.
#	3) I nomi composti solitamente sono scritti con un underscore(_) tra le parole (ES. numero_civico), cioè in snake_case
#		Sono accettati i nomi con gli accenti, ma poichè spesso le tabelle devono interagire con linguaggi come Java
#		di prassi è sconsigliato usare nomi accettanti (perchè quando Java parlerà con MySQL gli accenti potrebbero dare fastidio)
#	4) I tipi in SQL sono i seguenti:
#		- CHAR ------------> Identifica un singolo carattere (ES. M o F)
#		- VARCHAR ---------> Identifica un insieme di caratteri. 
#							  Se senza tonde possiamo inserire fino a 65535 caratteri.
#							  Se le tonde sono presenti il numero massimo di caratteri sarà quello indicato 
#							  nelle parentesi.
#		- INT -------------> Identifica un numero intero che va da 	-2147483648 a 	2147483647
#		- DOUBLE/FLOAT ----> Identifica un numero decimale che può avere fino a 65 cifre totali
#		- NUMERIC ---------> Identifica un numero decimale in cui la prima cifra tra le tonde indica il numero 
#								totale di cifre, mentre la seconda indica il numero totale di decimali tra quelli 
#								indicati (ES NUMERIC(5,2) comprende tutti i numeri tra -999,99 e 999,99)
#		- BOOL/BOOLEAN ----> Identifica un valore TRUE/FALSE, dove 1 rappresenta TRUE e 0 rappresenta FALSE
#		- BIT -------------> Identifica i bit di un dato (saranno valori formati da 0 e 1). 
#								In altri DBMS come SQL Server, può rappresentare un valore booleano.
#		- DATE ------------> Identifica una data, formattata con il pattern YYYY-MM-GG




