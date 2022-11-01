CREATE DATABASE DWEJEMPLO;
USE DWEJEMPLO
GO

CREATE TABLE DMVENDEDOR(
IDVENDEDOR INT NOT NULL PRIMARY KEY,
FirstName nvarchar(50) NOT NULL,
MiddleName nvarchar(50) NULL,
LastName nvarchar(50) NOT NULL
);
CREATE TABLE DMTIEMPO(
IDTIEMPO INT NOT NULL PRIMARY KEY,
OrderDate datetime NOT NULL);

CREATE TABLE HVENTAS(
IDHVENTAS INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IDVENDEDOR INT NOT NULL FOREIGN KEY REFERENCES DMVENDEDOR,
IDTIEMPO INT NOT NULL FOREIGN KEY REFERENCES DMTIEMPO,
totalDue money NOT NULL
);



SELECT * FROM DMVENDEDOR;