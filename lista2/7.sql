DELIMITER $$
CREATE FUNCTION liczbaAparatow(id int) RETURNS int
BEGIN
    DECLARE result int;
    SELECT COUNT(model) INTO result FROM Aparat WHERE matryca=id;
    RETURN result;
END$$
DELIMITER ;