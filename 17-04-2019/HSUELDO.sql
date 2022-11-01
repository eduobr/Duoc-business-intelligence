CREATE DATABASE EOH002
GO
USE EOH002

DROP TABLE DMEMPLEADO

CREATE TABLE DMEMPLEADO(
idEmpleado INT NOT NULL PRIMARY KEY,
FirstName nvarchar(255),
MiddleName nvarchar(255),
LastName nvarchar(255),
);

CREATE TABLE DMDEPARTAMENTO(
idDepartamento INT NOT NULL PRIMARY KEY,
GroupName nvarchar(255) NOT NULL,
ProductNumber nvarchar(25)NOT NULL
);

DROP TABLE DMTIEMPO

/*CREATE TABLE DMTIEMPO(
idTiempo INT NOT NULL PRIMARY KEY,
StartDate nvarchar(255) NOT NULL,
);*/

DROP TABLE HSUELDO

CREATE TABLE DMTARIFA(
idTarifa INT NOT NULL PRIMARY KEY,
Rate MONEY NOT NULL
);

CREATE TABLE HSUELDO(
idSueldo INT NOT NULL PRIMARY KEY identity(1,1),
idEmpleado INT NOT NULL FOREIGN KEY REFERENCES DMEMPLEADO(idEmpleado),
idTarifa INT NOT NULL FOREIGN KEY REFERENCES DMTARIFA(idTarifa),
idDepartamento INT NOT NULL FOREIGN KEY REFERENCES DMDEPARTAMENTO(idDepartamento),
SalesQuota MONEY NOT NULL
--StartDate date NOT NULL,
);


SELECT        HumanResources.Department.DepartmentID, HumanResources.EmployeeDepartmentHistory.BusinessEntityID, 
                         HumanResources.EmployeeDepartmentHistory.StartDate, HumanResources.EmployeePayHistory.Rate, Sales.SalesPersonQuotaHistory.SalesQuota
FROM            HumanResources.Department INNER JOIN
                         HumanResources.EmployeeDepartmentHistory ON 
                         HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID INNER JOIN
                         HumanResources.EmployeePayHistory ON 
                         HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID INNER JOIN
                         Sales.SalesPersonQuotaHistory ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Sales.SalesPersonQuotaHistory.BusinessEntityID
