DELIMITER $$
CREATE TRIGGER IF NOT EXISTS addModelAndProducent BEFORE INSERT ON Aparat
FOR EACH ROW
BEGIN

    IF 0 = (SELECT COUNT(ID) FROM Producent WHERE ID = NEW.producent) THEN
        INSERT INTO Producent (ID) VALUE (NEW.producent);
    END IF;

END$$
DELIMITER ;