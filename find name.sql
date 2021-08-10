CREATE PROCEDURE Findname @name varchar(50)
AS
SELECT @name = '%' + RTRIM(@name) + '%';
SELECT c.cname, t.tel
FROM Client c JOIN Telefon t ON c.cid = t.cid
WHERE c.cname LIKE @name;
