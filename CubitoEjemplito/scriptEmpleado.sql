SELECT * FROM Person.Person
SELECT * FROM [HumanResources].[Department] 
SELECT * FROM [Sales].[SalesPersonQuotaHistory]
SELECT * FROM [HumanResources].[EmployeeDepartmentHistory]


CREATE DATABASE DWSUELDOS
--DROP TABLE DMEMPLEADO
CREATE TABLE DMEMPLEADO(
idEmpleado INT NOT NULL PRIMARY KEY,
FirstName NVARCHAR(50),
MiddleName NVARCHAR(50),
LastName NVARCHAR(50)
);

CREATE TABLE DMDEPARTAMENTO(
idDepartamento INT NOT NULL PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL 
);


--CREATE TABLE DMTIEMPO(
--idTiempo INT NOT NULL PRIMARY KEY,
--StartDate date NOT NULL 
--);
--DROP TABLE DMTIEMPO
--DROP TABLE HSUELDO

CREATE TABLE HSUELDO(
idSueldo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
idEmpleado INT NOT NULL FOREIGN KEY REFERENCES DMEMPLEADO(idEmpleado),
idDepartamento INT NOT NULL FOREIGN KEY REFERENCES DMDEPARTAMENTO(idDepartamento),
SalesQuota MONEY NOT NULL,
StartDate date NOT NULL
);


SELECT        HumanResources.Department.DepartmentID, Person.Person.BusinessEntityID, REPLACE(Sales.SalesPersonQuotaHistory.SalesQuota,',','.') AS sueldo, 
                         HumanResources.EmployeeDepartmentHistory.StartDate
FROM            HumanResources.EmployeeDepartmentHistory INNER JOIN
                         HumanResources.Department ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID INNER JOIN
                         Person.Person ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.Person.BusinessEntityID INNER JOIN
                         Sales.SalesPersonQuotaHistory ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Sales.SalesPersonQuotaHistory.BusinessEntityID