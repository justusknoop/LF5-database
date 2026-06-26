USE krautundrueben;
SET NAMES utf8mb4;

START TRANSACTION;

INSERT INTO KUNDE (KUNDENNR, NACHNAME, VORNAME, GEBURTSDATUM, STRASSE, HAUSNR, PLZ, ORT, TELEFON, EMAIL) VALUES
(2001, 'Wellensteyn', 'Kira', '1990-05-05', 'Eppendorfer Landstrasse', '104', '20249', 'Hamburg', '040/443322', 'k.wellensteyn@yahoo.de'),
(2002, 'Foede', 'Dorothea', '2000-03-24', 'Ohmstraße', '23', '22765', 'Hamburg', '040/543822', 'd.foede@web.de'),
(2003, 'Leberer', 'Sigrid', '1989-09-21', 'Bilser Berg', '6', '20459', 'Hamburg', '0175/1234588', 'sigrid@leberer.de'),
(2004, 'Soerensen', 'Hanna', '1974-04-03', 'Alter Teichweg', '95', '22049', 'Hamburg', '040/634578', 'h.soerensen@yahoo.de'),
(2005, 'Schnitter', 'Marten', '1964-04-17', 'Stübels', '10', '22835', 'Barsbüttel', '0176/447587', 'schni_mart@gmail.com'),
(2006, 'Maurer', 'Belinda', '1978-09-09', 'Grotelertwiete', '4a', '21075', 'Hamburg', '040/332189', 'belinda1978@yahoo.de'),
(2007, 'Gessert', 'Armin', '1978-01-29', 'Küstersweg', '3', '21079', 'Hamburg', '040/67890', 'armin@gessert.de'),
(2008, 'Haessig', 'Jean-Marc', '1982-08-30', 'Neugrabener Bahnhofstraße', '30', '21149', 'Hamburg', '0178-67013390', 'jm@haessig.de'),
(2009, 'Urocki', 'Eric', '1999-12-04', 'Elbchaussee', '228', '22605', 'Hamburg', '0152-96701390', 'urocki@outlook.de');

INSERT INTO LIEFERANT (LIEFERANTENNR, LIEFERANTENNAME, STRASSE, HAUSNR, PLZ, ORT, TELEFON, EMAIL) VALUES
(101, 'Bio-Hof Müller', 'Dorfstraße', '74', '24354', 'Weseby', '04354-9080', 'mueller@biohof.de'),
(102, 'Obst-Hof Altes Land', 'Westerjork 74', '76', '21635', 'Jork', '04162-4523', 'info@biohof-altesland.de'),
(103, 'Molkerei Henning', 'Molkereiwegkundekunde', '13', '19217', 'Dechow', '038873-8976', 'info@molkerei-henning.de');

INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, LIEFERANT, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES
(1001, 'Zucchini', 'Stück', 0.89, 100, 101, 19, 2.00, 1.60),
(1002, 'Zwiebel', 'Stück', 0.15, 50, 101, 28, 4.90, 1.20),
(1003, 'Tomate', 'Stück', 0.45, 50, 101, 18, 2.60, 1.00),
(1004, 'Schalotte', 'Stück', 0.20, 500, 101, 25, 3.30, 1.50),
(1005, 'Karotte', 'Stück', 0.30, 500, 101, 41, 10.00, 0.90),
(1006, 'Kartoffel', 'Stück', 0.15, 1500, 101, 71, 14.60, 2.00),
(1007, 'Rucola', 'Bund', 0.90, 10, 101, 27, 2.10, 2.60),
(1008, 'Lauch', 'Stück', 1.20, 35, 101, 29, 3.30, 2.10),
(1009, 'Knoblauch', 'Stück', 0.25, 250, 101, 141, 28.40, 6.10),
(1010, 'Basilikum', 'Bund', 1.30, 10, 101, 41, 5.10, 3.10),
(1011, 'Süßkartoffel', 'Stück', 2.00, 200, 101, 86, 20.00, 1.60),
(1012, 'Schnittlauch', 'Bund', 0.90, 10, 101, 28, 1.00, 3.00),
(2001, 'Apfel', 'Stück', 1.20, 750, 102, 54, 14.40, 0.30),
(3001, 'Vollmilch. 3.5%', 'Liter', 1.50, 50, 103, 65, 4.70, 3.40),
(3002, 'Mozzarella', 'Packung', 3.50, 20, 103, 241, 1.00, 18.10),
(3003, 'Butter', 'Stück', 3.00, 50, 103, 741, 0.60, 0.70),
(4001, 'Ei', 'Stück', 0.40, 300, 102, 137, 1.50, 11.90),
(5001, 'Wiener Würstchen', 'Paar', 1.80, 40, 101, 331, 1.20, 9.90),
(9001, 'Tofu-Würstchen', 'Stück', 1.80, 20, 103, 252, 7.00, 17.00),
(6408, 'Couscous', 'Packung', 1.90, 15, 102, 351, 67.00, 12.00),
(7043, 'Gemüsebrühe', 'Würfel', 0.20, 4000, 101, 1, 0.50, 0.50),
(6300, 'Kichererbsen', 'Dose', 1.00, 400, 103, 150, 21.20, 9.00),
(1013, 'Petersilie', 'Bund', 0.90, 25, 101, 36, 6.30, 3.00),
(1014, 'Majoran', 'Bund', 1.20, 15, 101, 271, 60.60, 12.70),
(1015, 'Muskat', 'Packung', 2.30, 20, 102, 525, 49.30, 5.80),
(3004, 'Kokosmilch', 'Dose', 1.60, 40, 103, 197, 2.80, 2.00),
(3005, 'Hähnchenbrustfilet', 'Packung', 5.50, 30, 101, 110, 0.00, 23.00),
(6001, 'Reis', 'Packung', 1.80, 80, 102, 351, 78.00, 7.00),
(6002, 'Sojasauce', 'Flasche', 2.50, 35, 102, 53, 4.90, 8.10),
(6003, 'Zucker', 'Packung', 1.20, 60, 102, 405, 100.00, 0.00),
(6004, 'Bambussprossen', 'Glas', 1.70, 30, 102, 27, 3.00, 2.60),
(6005, 'Currypaste grün', 'Glas', 2.90, 20, 102, 115, 13.00, 3.00),
(6006, 'Pfeffer', 'Packung', 1.50, 50, 102, 251, 64.00, 10.00),
(6007, 'Milchreis', 'Packung', 1.40, 60, 102, 350, 78.00, 7.00),
(6008, 'Vanillezucker', 'Päckchen', 0.30, 100, 102, 394, 98.00, 0.00),
(6009, 'Apfelmus', 'Glas', 1.50, 45, 102, 68, 16.00, 0.20),
(6010, 'Gemischtes Gemüse', 'Packung', 2.40, 35, 101, 45, 7.00, 2.00);

INSERT INTO BESTELLUNG (BESTELLNR, KUNDENNR, BESTELLDATUM, RECHNUNGSBETRAG) VALUES
(1, 2001, '2020-07-01', 6.21),
(2, 2002, '2020-07-08', 32.96),
(3, 2003, '2020-08-01', 24.08),
(4, 2004, '2020-08-02', 19.90),
(5, 2005, '2020-08-02', 6.47),
(6, 2006, '2020-08-10', 6.96),
(7, 2007, '2020-08-10', 2.41),
(8, 2008, '2020-08-10', 13.80),
(9, 2009, '2020-08-10', 8.67),
(10, 2007, '2020-08-15', 17.98),
(11, 2005, '2020-08-12', 8.67),
(12, 2003, '2020-08-13', 20.87);

INSERT INTO BESTELLUNGZUTAT (BESTELLNR, ZUTATENNR, MENGE) VALUES
(1, 1001, 5),
(1, 1002, 3),
(1, 1006, 2),
(1, 1004, 3),
(2, 9001, 10),
(2, 1005, 5),
(2, 1003, 4),
(2, 6408, 5),
(3, 6300, 15),
(3, 3001, 5),
(4, 5001, 7),
(4, 3003, 2),
(5, 1002, 4),
(5, 1004, 5),
(5, 1001, 5),
(7, 1009, 9),
(6, 1010, 5),
(8, 1012, 5),
(8, 1008, 7),
(9, 1007, 4),
(9, 1012, 5),
(10, 1011, 7),
(10, 4001, 7),
(11, 5001, 2),
(11, 1012, 5),
(12, 1010, 15);

COMMIT;
