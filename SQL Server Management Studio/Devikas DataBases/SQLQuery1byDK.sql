CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);

select * from Persons

INSERT INTO Persons (PersonID,LastName,FirstName, Address, City)
VALUES (1, 'test', 'test2', 'Techversant', 'Tvm');

UPDATE Persons
SET LastName='Devika', FirstName='Ravi'
WHERE PersonID=1;

INSERT INTO Persons (PersonID,LastName,FirstName, Address, City)
VALUES (2, 'Anu', 'Abhirami', 'Techversant', 'Tvm');

DELETE FROM Persons WHERE FirstName='Abhirami';

DELETE FROM Persons WHERE FirstName='test';

DELETE FROM Persons WHERE Address='test';

SET ROWCOUNT 1
DELETE FROM Persons WHERE PersonID=1
SET ROWCOUNT 0
