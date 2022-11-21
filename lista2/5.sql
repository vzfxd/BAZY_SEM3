DELIMITER $$
CREATE FUNCTION IF NOT EXISTS findModel(id int) RETURNS varchar(30)
BEGIN
    DECLARE result varchar(30);
    SELECT model INTO result FROM Aparat JOIN Matryca ON Aparat.Matryca = Matryca.ID WHERE Aparat.producent = id ORDER BY przekatna DESC LIMIT 1;
    RETURN result;
END$$
DELIMITER ;