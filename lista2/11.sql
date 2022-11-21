ALTER TABLE Producent ADD COLUMN IF NOT EXISTS liczbaModeli int NOT NULL;
UPDATE Producent SET liczbaModeli = (SELECT Count(model) FROM Aparat WHERE producent=ID);


DROP TRIGGER IF EXISTS addModelAndProducent;


DELIMITER $$
CREATE TRIGGER IF NOT EXISTS addModelAndProducent BEFORE INSERT ON Aparat
FOR EACH ROW
BEGIN
    IF 0 = (SELECT COUNT(ID) FROM Producent WHERE ID = NEW.producent) THEN
        INSERT INTO Producent (ID, liczbaModeli) VALUE (NEW.producent, (SELECT COUNT(model) FROM Aparat WHERE producent = Producent.ID));
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER IF NOT EXISTS updateLiczbaModeliOnInsert AFTER INSERT ON Aparat
FOR EACH ROW
BEGIN
    UPDATE Producent SET liczbaModeli = (SELECT Count(model) FROM Aparat WHERE producent=ID);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER IF NOT EXISTS updateLiczbaModeliOnDelete AFTER DELETE ON Aparat
FOR EACH ROW
BEGIN
    UPDATE Producent SET liczbaModeli = (SELECT Count(model) FROM Aparat WHERE producent=ID);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER IF NOT EXISTS updateLiczbaModeliOnUpdate AFTER UPDATE ON Aparat
FOR EACH ROW
BEGIN
    UPDATE Producent SET liczbaModeli = (SELECT COUNT(model) FROM Aparat WHERE producent=ID );
END$$
DELIMITER ;