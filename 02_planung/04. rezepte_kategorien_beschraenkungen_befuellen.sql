BEGIN;


-- 1. REZEPTE BEFÜLLEN

INSERT INTO REZEPT
(REZEPTNR, REZEPTNAME, PORTIONEN, ZUBEREITUNG)
VALUES
(
    1,
    'Thaicurry mit Hähnchen',
    4,
    'Hähnchenbrust in Streifen schneiden und mit Sojasauce, Pfeffer und Zucker etwa eine Stunde marinieren. Danach anbraten und herausnehmen. Gemüse und Bambussprossen schneiden und anbraten. Currypaste mit Kokosmilch verrühren. Fleisch und Gemüse hinzugeben und kurz köcheln lassen. Reis kochen und dazu servieren.'
),
(
    2,
    'Kartoffelsuppe',
    4,
    'Kartoffeln und Karotte schälen und würfeln. Zwiebel würfeln und Lauch in Ringe schneiden. Zwiebeln und Lauch dünsten und mit Gemüsebrühe ablöschen. Kartoffeln und Karotte hinzugeben und etwa 20 Minuten köcheln lassen. Anschließend pürieren und würzen. Würstchen in Scheiben schneiden und mit der Suppe servieren.'
),
(
    3,
    'Milchreis mit Apfelmus',
    4,
    'Butter in einem Topf schmelzen und den Milchreis darin anschwitzen. Vollmilch, Zucker und Vanillezucker hinzugeben und unter Rühren aufkochen. Anschließend bei kleinster Stufe im geschlossenen Topf 30 Minuten ziehen lassen. Nach der Hälfte der Zeit umrühren und mit Apfelmus servieren.'
);

BEGIN;


-- ERNÄHRUNGSKATEGORIEN AUS DEM ANHANG

INSERT INTO ERNAEHRUNGSKATEGORIE
(KATEGORIENR, NAME)
VALUES
(1, 'Vegan'),
(2, 'Vegetarisch'),
(3, 'Frutarisch'),
(4, 'Low Carb'),
(5, 'High Protein');


-- BESCHRÄNKUNGEN AUS DEM ANHANG

INSERT INTO BESCHRAENKUNG
(BESCHRAENKUNGNR, NAME)
VALUES
(1, 'Laktose'),
(2, 'Gluten'),
(3, 'Erdnuss'),
(4, 'Ei'),
(5, 'Tomate');


COMMIT;