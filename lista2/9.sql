CREATE IF NOT EXISTS VIEW Lustrzanki AS
SELECT Aparat.model, Producent.nazwa, przekatna, rozdzielczosc, minPrzeslona, maxPrzeslona FROM Aparat 
JOIN Matryca ON Matryca.ID = matryca
JOIN Obiektyw ON Obiektyw.ID = obiektyw
JOIN Producent ON Producent.ID = producent
WHERE kraj <>'China' AND Aparat.typ = 'lustrzanka';