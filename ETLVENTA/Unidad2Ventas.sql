CREATE TABLE DMCLIENTE(
	idCliente int NOT NULL PRIMARY KEY,
	nombre NVARCHAR(255) NULL,
	apellido nvarchar(255) NULL,
	edad smallint NULL,
	estado_civil nvarchar(255) NULL
);

CREATE TABLE DMSUCURSAL(
	idSucursal int NOT NULL PRIMARY KEY,
	nombre_sucursal NVARCHAR(255) NULL,
	comuna_nombre NVARCHAR(255) NULL,
	provincia_nombre NVARCHAR(255) NULL,
	region NVARCHAR(255) NULL
);

CREATE TABLE DMDETALLE(
	idDetalle int NOT NULL PRIMARY KEY,
	cantidad int NULL,
	precioUnitario INT NULL,
	total int NULL,
	nombre nvarchar(255) NULL,
	familia NVARCHAR(255) NULL
);

CREATE TABLE DMVENDEDOR(
	idVendedor int NOT NULL PRIMARY KEY,
	nombre NVARCHAR(255),
	apellido NVARCHAR(255)
);

CREATE TABLE HVENTA(
	idVenta int FOREIGN KEY REFERENCES DMVENDEDOR(idVendedor) IDENTITY(1,1),
	idSucursal int FOREIGN KEY REFERENCES DMSUCURSAL(idSucursal),
	idCliente int FOREIGN KEY REFERENCES DMCLIENTE(idCliente),
	idDetalle int FOREIGN KEY REFERENCES DMDETALLE(idDetalle),
	impuesto int NUll,
	idVendedor int NULL,
	fecha datetime Null,
);