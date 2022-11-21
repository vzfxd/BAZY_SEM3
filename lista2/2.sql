CREATE TABLE IF NOT EXISTS Matryca(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    przekatna decimal(4,2) NOT NULL,
    rozdzielczosc decimal(3,1) NOT NULL,
    typ VARCHAR(10) NOT NULL,
    CHECK(przekatna >= 0),
    CHECK(rozdzielczosc >= 0)
);

ALTER TABLE Matryca AUTO_INCREMENT=100; 

CREATE TABLE IF NOT EXISTS Obiektyw(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(30) NOT NULL,
    minPrzeslona float NOT NULL,
    maxPrzeslona float NOT NULL,
    CHECK(minPrzeslona >= 0),
    CHECK(maxPrzeslona >= 0),
    CHECK(maxPrzeslona >= minPrzeslona)
);

CREATE TABLE IF NOT EXISTS Producent(
    ID int AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(50),
    kraj VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Aparat(
    model VARCHAR(30) PRIMARY KEY,
    producent INT,
    matryca INT,
    obiektyw INT,
    typ enum('kompaktowy','lustrzanka','profesjonalny','inny') NOT NULL,
    FOREIGN KEY (producent) REFERENCES Producent(ID),
    FOREIGN KEY (matryca) REFERENCES Matryca(ID),
    FOREIGN KEY (obiektyw) REFERENCES Obiektyw(ID)
);