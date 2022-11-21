DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS GenerateAparat()
BEGIN
    DECLARE i int;
    DECLARE producent int;
    DECLARE matryca int;
    DECLARE obiektyw int;
    DECLARE typx VARCHAR(30);
    
    SET i = 1;
    
    gen: WHILE i <= 100 DO
        SELECT ID INTO producent FROM Producent ORDER BY RAND() LIMIT 1;
        SELECT ID INTO matryca FROM Matryca ORDER BY RAND() LIMIT 1;
        SELECT ID INTO obiektyw FROM Obiektyw ORDER BY RAND() LIMIT 1;
        SELECT typ INTO typx FROM Aparat ORDER BY RAND() LIMIT 1;

        INSERT INTO Aparat (model, producent, matryca, obiektyw, typ) VALUES (CONCAT('generatedModel',i),producent,matryca,obiektyw,typx);

        SET i = i + 1;
    END WHILE gen;
END$$
DELIMITER ;