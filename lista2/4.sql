DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS GenerateAparat()
BEGIN
    DECLARE i int;
    DECLARE gen_model VARCHAR(30);
    DECLARE producent int;
    DECLARE matryca int;
    DECLARE obiektyw int;
    DECLARE typx VARCHAR(30);
    
    SET i = 1;
    
    gen: WHILE i <= 100 DO
        SELECT model INTO gen_model FROM Aparat ORDER BY RAND() LIMIT 1;
        SELECT ID INTO producent FROM Producent ORDER BY RAND() LIMIT 1;
        SELECT ID INTO matryca FROM Matryca ORDER BY RAND() LIMIT 1;
        SELECT ID INTO obiektyw FROM Obiektyw ORDER BY RAND() LIMIT 1;
        SELECT typ INTO typx FROM Aparat ORDER BY RAND() LIMIT 1;

        INSERT INTO Aparat (model, producent, matryca, obiektyw, typ) VALUES (CONCAT(gen_model,i),producent,matryca,obiektyw,typx);

        SET i = i + 1;
    END WHILE gen;
END$$
DELIMITER ;