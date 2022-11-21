CREATE VIEW IF NOT EXISTS ProducentModel AS
SELECT nazwa, kraj, model FROM Aparat 
JOIN Producent ON Producent.ID = producent;

SELECT * FROM ProducentModel;

DELETE FROM Aparat WHERE producent IN (SELECT ID FROM Producent WHERE kraj = 'China');

SELECT * FROM ProducentModel;