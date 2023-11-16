USE everyloop


--//ÖVNINGSUPPGIFT 1.1

--SELECT *  FROM GameOfThrones

--SELECT Title, EpisodeInSeason FROM GameOfThrones;

--SELECT Title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode' FROM GameOfThrones;
--//Välj Tabellen GoT, ta ut Title, EpisodeInSeason som kolumner. 
--//Välj Title, lägg till Formatet 'S' för att tydligt visa att det är Season, 00 ger formatet för avsnitt upp till 99.
--//'E' + Format för att få ut kolumnen EpisodeInSeason - 00 = Här skapas en egen Kolumn för att visa resultatet i tabellen GoT.



--//ÖVNINGSUPPGIFT 1.2
 --SELECT * INTO Users2 FROM Users;
 
  --SELECT * FROM Users2;

  --SELECT (SUBSTRING(LOWER(firstname), 1,2) +
  --SUBSTRING(LOWER(lastname), 1,2))
  --FROM Users2;
  --//För att endast få de 2 första bokstävarna i First/LastName så används SUBSTRING och vilka i följden bokstäver som ska anges.
 --//LOWER sätter allt till små bokstäver.
  --UPDATE Users2
  --SET username =
  --(SUBSTRING(LOWER(firstname), 1,2) +
  --SUBSTRING(LOWER(lastname), 1,2));

  --//UPDATE uppdaterar hela kolumnen Username genom SET. Här kommer SUBSTRING in och hänvisar till vilka bokstävar som ska sättas in i UserName kolumnen.
 

 --//ÖVNINGSUPPGIFT 1.3

 --SELECT * INTO Airports2 FROM Airports;
  --//Kopierar tabellen från Airports och sätter den till Airports2.
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

--//GENOM CASE så hittar vi alla de Kolumnerna i Time/DST som har ett null-värde.
     
--UPDATE Airports2
--SET time = COALESCE(time, '-'),
--    DST = COALESCE(DST, '-')
--WHERE time IS NULL OR DST IS NULL;

--//Här uppdateras Kolumnen genom COALESCE - ( vilken kolumn som ska påverkas, vilket nästa värde ska bli)
--//WHERE beskriver specifikt i vilken tabell och vilket värde som ska bytas ut mot COALESCE värdet.
  
--  UPDATE Airports2
--SET DST = ISNULL(DST, '-'),
--    Time = ISNULL(Time, '-')
--//UPDATE för allt där IS NULL ligger i kolumnerna och byter värdet mot '-'. 
  
  
 
 --//ÖVNINGSUPPGIFT 1.4

 --Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av följande:
 --'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

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
--//Här tar vi ut de specifika Namn & bokstäver vi söker efter genom WHERE - Tabellnamn - IN - (namn du söker)
--//med den Bokstav vi söker efter i en kombination med OR och LIKE %.

--DELETE FROM Elements2
--WHERE
--[Name] in ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE 'D%'
--OR [Name] LIKE 'K%'
--OR [Name] LIKE 'M%'
--OR [Name] LIKE 'O%'
--OR [Name] LIKE 'U%';

--//Här tar vi bort de specifika Namn & Bokstäverna från raderna de sammanträffar på med - DELETE.


 
 --//ÖVNINGSUPPGIFT 1.5

 --Skapa en ny tabell med alla rader från tabellen Elements.
 --Den nya tabellen ska innehålla ”Symbol” och ”Name” från orginalet,
 --samt en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar med bokstäverna i ”Symbol”,
 --och ’No’ för de rader där de inte gör det.

--Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

-- SELECT * INTO Elements3 FROM Elements;

-- SELECT [Symbol], [Name] FROM Elements3;

--ALTER TABLE Elements3  <---- Lägger till en Kolumn i en Tabell.
--ADD Matching_Name nvarchar; <------ Måste ange (Max) om man vill ange fler tecken i Nvarchar. Annars håller den endast 1.

--SELECT [Name], [Symbol], [Matching_Name] FROM Elements3
--WHERE [Name]
--LIKE CONCAT([Symbol],'%');
--//Här använder vi Kolumnen Symbol som referensvärde på vad den ska söka efter i kolumnen Name. 
--//Endast Bokstav 1-2 tas med då Symbol innehåller endast 2 tecken är det bara det som söks efter i Name.

--ALTER TABLE Elements3
--ALTER Column Matching_Name nvarchar(Max); 
--//Här ändrar vi Datatypen på en kolumn till nvarchar(Max); För att den tabellen ska kunn ta emot fler än 1 tecken.

--  UPDATE Elements3
--SET [Matching_Name] =
--    CASE 
--        WHEN [Name] LIKE CONCAT([Symbol], '%') THEN 'Yes'
--        ELSE 'No'
--    END;
	--//Här uppdateras Kolumnen Matching_Name med Yes/No om Symbolen-tecken hittas i Name.

--SELECT Name, Symbol, Matching_Name FROM Elements3;

--//Övningsuppgift 1.6

--Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”.
--Gör sedan en select från Colors2 som ger samma resultat som du skulle fått från select * from Colors;
--(Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

--SELECT * INTO Colors2 FROM Colors;

--SELECT * FROM Colors2;

--ALTER TABLE Colors2
--DROP Column Code; 
--//Här har vi gjort en kopia på en hel Tabell med alla kolumner och vill förändra Tabellen genom att ta bort CODE.
--//Det gör genom funktonen ALTER + DROP Column.

--SELECT * FROM Colors2;
--//Här kollar vi så att den faktiskt är borta från vår Colors2.


--SELECT Name,  Red,  Green,  Blue,

--  '#' + FORMAT(Red, 'X2') + FORMAT(Green, 'X2') + FORMAT(Blue, 'X2') AS Code2
--FROM Colors2;
--//Här lägger vi ihop Kolumnerna Red,Gren,Blue och dess värden till HEX-format genom
--// att hårdkoda in ett # och sedan Format(Kolumn, 'X2') X2 - gör att sifferkodningen blir till HEX-ID.
--//Lägger ihop alla kolumnerna efter varandra för att skapa hela värdet.


--//Övningsuppgift 1.7

--Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till en ny tabell.
--Gör sedan en select från den nya tabellen som ger samma resultat som du skulle fått från select * from types;

--SELECT * FROM Types;

--SELECT Integer, String INTO Types2 FROM Types;

--Select * FROM Types2;

--SELECT * FROM Types;

--SELECT integer, 

--CAST(integer / 100.0 AS float) AS Float,

--string,

--('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2 ) AS Bool
--FROM types2;

--//Här utgår vi från Interger värdet för att omvandla de olika kolumnerna till en spegling av orginal Tabellen Types.
--//CAST används för att göra om ett heltal till decimaltal genom 100.0 och AS Float. 
--//Format gör här att den lägger in Integer-siffran till Datum och Minut.
--//Modulus för att räkna ut värdet genom (Integer % 2) för att visa om det är ett jämnt tal eller ej( true/false).









 