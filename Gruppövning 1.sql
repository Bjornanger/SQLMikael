USE everyloop


--//�VNINGSUPPGIFT 1.1

--SELECT *  FROM GameOfThrones

--SELECT Title, EpisodeInSeason FROM GameOfThrones;

--SELECT Title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode' FROM GameOfThrones;
--//V�lj Tabellen GoT, ta ut Title, EpisodeInSeason som kolumner. 
--//V�lj Title, l�gg till Formatet 'S' f�r att tydligt visa att det �r Season, 00 ger formatet f�r avsnitt upp till 99.
--//'E' + Format f�r att f� ut kolumnen EpisodeInSeason - 00 = H�r skapas en egen Kolumn f�r att visa resultatet i tabellen GoT.



--//�VNINGSUPPGIFT 1.2
 --SELECT * INTO Users2 FROM Users;
 
  --SELECT * FROM Users2;

  --SELECT (SUBSTRING(LOWER(firstname), 1,2) +
  --SUBSTRING(LOWER(lastname), 1,2))
  --FROM Users2;
  --//F�r att endast f� de 2 f�rsta bokst�varna i First/LastName s� anv�nds SUBSTRING och vilka i f�ljden bokst�ver som ska anges.
 --//LOWER s�tter allt till sm� bokst�ver.
  --UPDATE Users2
  --SET username =
  --(SUBSTRING(LOWER(firstname), 1,2) +
  --SUBSTRING(LOWER(lastname), 1,2));

  --//UPDATE uppdaterar hela kolumnen Username genom SET. H�r kommer SUBSTRING in och h�nvisar till vilka bokst�var som ska s�ttas in i UserName kolumnen.
 

 --//�VNINGSUPPGIFT 1.3

 --SELECT * INTO Airports2 FROM Airports;
  --//Kopierar tabellen fr�n Airports och s�tter den till Airports2.
 --SELECT * FROM Airports2;

-- SELECT [Time], [DST],
--    CASE
--        WHEN [Time] is null THEN '-' ELSE [Time]
--    END
--        AS [Time],
--    CASE
--        WHEN [DST] is null THEN '-' ELSE [DST]
--    END
--        AS [DST]
--FROM Airports2;

--//GENOM CASE s� hittar vi alla de Kolumnerna i Time/DST som har ett null-v�rde.
     
--UPDATE Airports2
--SET time = COALESCE(time, '-'),
--    DST = COALESCE(DST, '-')
--WHERE time IS NULL OR DST IS NULL;

--//H�r uppdateras Kolumnen genom COALESCE - ( vilken kolumn som ska p�verkas, vilket n�sta v�rde ska bli)
--//WHERE beskriver specifikt i vilken tabell och vilket v�rde som ska bytas ut mot COALESCE v�rdet.
  
--  UPDATE Airports2
--SET DST = ISNULL(DST, '-'),
--    Time = ISNULL(Time, '-')
--//UPDATE f�r allt d�r IS NULL ligger i kolumnerna och byter v�rdet mot '-'. 
  
  
 
 --//�VNINGSUPPGIFT 1.4

 --Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon av f�ljande:
 --'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

 --SELECT * FROM Elements; 
 --SELECT * INTO Elements2 FROM Elements;

-- SELECT * FROM Elements2;

-- SELECT [Name] From Elements2
-- WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE 'D%'
--OR [Name] LIKE 'K%'
--OR [Name] LIKE 'M%'
--OR [Name] LIKE 'O%'
--OR [Name] LIKE 'U%';
--//H�r tar vi ut de specifika Namn & bokst�ver vi s�ker efter genom WHERE - Tabellnamn - IN - (namn du s�ker)
--//med den Bokstav vi s�ker efter i en kombination med OR och LIKE %.

--DELETE FROM Elements2
--WHERE
--[Name] in ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE 'D%'
--OR [Name] LIKE 'K%'
--OR [Name] LIKE 'M%'
--OR [Name] LIKE 'O%'
--OR [Name] LIKE 'U%';

--//H�r tar vi bort de specifika Namn & Bokst�verna fr�n raderna de sammantr�ffar p� med - DELETE.


 
 --//�VNINGSUPPGIFT 1.5

 --Skapa en ny tabell med alla rader fr�n tabellen Elements.
 --Den nya tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet,
 --samt en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar med bokst�verna i �Symbol�,
 --och �No� f�r de rader d�r de inte g�r det.

--Ex: �He� -> �Helium� -> �Yes�, �Mg� -> �Magnesium� -> �No�.

-- SELECT * INTO Elements3 FROM Elements;

-- SELECT [Symbol], [Name] FROM Elements3;

--ALTER TABLE Elements3  <---- L�gger till en Kolumn i en Tabell.
--ADD Matching_Name nvarchar; <------ M�ste ange (Max) om man vill ange fler tecken i Nvarchar. Annars h�ller den endast 1.

--SELECT [Name], [Symbol], [Matching_Name] FROM Elements3
--WHERE [Name]
--LIKE CONCAT([Symbol],'%');
--//H�r anv�nder vi Kolumnen Symbol som referensv�rde p� vad den ska s�ka efter i kolumnen Name. 
--//Endast Bokstav 1-2 tas med d� Symbol inneh�ller endast 2 tecken �r det bara det som s�ks efter i Name.

--ALTER TABLE Elements3
--ALTER Column Matching_Name nvarchar(Max); 
--//H�r �ndrar vi Datatypen p� en kolumn till nvarchar(Max); F�r att den tabellen ska kunn ta emot fler �n 1 tecken.

--  UPDATE Elements3
--SET [Matching_Name] =
--    CASE 
--        WHEN [Name] LIKE CONCAT([Symbol], '%') THEN 'Yes'
--        ELSE 'No'
--    END;
	--//H�r uppdateras Kolumnen Matching_Name med Yes/No om Symbolen-tecken hittas i Name.

--SELECT Name, Symbol, Matching_Name FROM Elements3;

--//�vningsuppgift 1.6

--Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�.
--G�r sedan en select fr�n Colors2 som ger samma resultat som du skulle f�tt fr�n select * from Colors;
--(Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet).

--SELECT * INTO Colors2 FROM Colors;

--SELECT * FROM Colors2;

--ALTER TABLE Colors2
--DROP Column Code; 
--//H�r har vi gjort en kopia p� en hel Tabell med alla kolumner och vill f�r�ndra Tabellen genom att ta bort CODE.
--//Det g�r genom funktonen ALTER + DROP Column.

--SELECT * FROM Colors2;
--//H�r kollar vi s� att den faktiskt �r borta fr�n v�r Colors2.


--SELECT Name,  Red,  Green,  Blue,

--  '#' + FORMAT(Red, 'X2') + FORMAT(Green, 'X2') + FORMAT(Blue, 'X2') AS Code2
--FROM Colors2;
--//H�r l�gger vi ihop Kolumnerna Red,Gren,Blue och dess v�rden till HEX-format genom
--// att h�rdkoda in ett # och sedan Format(Kolumn, 'X2') X2 - g�r att sifferkodningen blir till HEX-ID.
--//L�gger ihop alla kolumnerna efter varandra f�r att skapa hela v�rdet.


--//�vningsuppgift 1.7

--Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� till en ny tabell.
--G�r sedan en select fr�n den nya tabellen som ger samma resultat som du skulle f�tt fr�n select * from types;

--SELECT * FROM Types;

--SELECT Integer, String INTO Types2 FROM Types;

--Select * FROM Types2;

--SELECT * FROM Types;

--SELECT integer, 

--CAST(integer / 100.0 AS float) AS Float,

--string,

--('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2 ) AS Bool
--FROM types2;

--//H�r utg�r vi fr�n Interger v�rdet f�r att omvandla de olika kolumnerna till en spegling av orginal Tabellen Types.
--//CAST anv�nds f�r att g�ra om ett heltal till decimaltal genom 100.0 och AS Float. 
--//Format g�r h�r att den l�gger in Integer-siffran till Datum och Minut.
--//Modulus f�r att r�kna ut v�rdet genom (Integer % 2) f�r att visa om det �r ett j�mnt tal eller ej( true/false).









 