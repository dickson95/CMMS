USE CMMS;

ALTER TABLE `Maquinas` DROP FOREIGN KEY `Maquinas_fk0`;

ALTER TABLE `Maquinas` DROP FOREIGN KEY `Maquinas_fk1`;

ALTER TABLE `Maquinas` DROP FOREIGN KEY `Maquinas_fk2`;

ALTER TABLE `Maquinas` DROP FOREIGN KEY `Maquinas_fk3`;

ALTER TABLE `Documentos` DROP FOREIGN KEY `Documentos_fk0`;

ALTER TABLE `Imagenes` DROP FOREIGN KEY `Imagenes_fk0`;

ALTER TABLE `Proveedores` DROP FOREIGN KEY `Proveedores_fk0`;

ALTER TABLE `Secciones` DROP FOREIGN KEY `Secciones_fk0`;

ALTER TABLE `Ciudades` DROP FOREIGN KEY `Ciudades_fk0`;

ALTER TABLE `Departamentos` DROP FOREIGN KEY `Departamentos_fk0`;

ALTER TABLE `Vendedores` DROP FOREIGN KEY `Vendedores_fk0`;

DROP TABLE IF EXISTS `Maquinas`;

DROP TABLE IF EXISTS `Documentos`;

DROP TABLE IF EXISTS `Imagenes`;

DROP TABLE IF EXISTS `Proveedores`;

DROP TABLE IF EXISTS `TiposMaquinas`;

DROP TABLE IF EXISTS `Localizaciones`;

DROP TABLE IF EXISTS `Secciones`;

DROP TABLE IF EXISTS `Paises`;

DROP TABLE IF EXISTS `Ciudades`;

DROP TABLE IF EXISTS `Departamentos`;

DROP TABLE IF EXISTS `Vendedores`;

CREATE TABLE `Maquinas` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`FchCompra` DATE NOT NULL,
	`Fch_puesta_marcha` DATE NOT NULL,
	`Fabricante` varchar(50) DEFAULT 'No hay información',
	`Modelo` varchar(50) NOT NULL,
	`Codigo` varchar(50) NOT NULL,
	`Potencia` varchar(50) DEFAULT 'No hay información',
	`Serial` varchar(50) NOT NULL,
	`Marca` varchar(50),
	`Descripcion` TEXT,
	`ConsumoEnergia` varchar(50) DEFAULT 'No hay información',
	`Peso` FLOAT DEFAULT '0.0',
	`Observacion` TEXT,
	`UserAction` varchar(50) NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`Maquina_padre_Id` INT,
	`Vendedor_Id` INT,
	`Tipo_maquina_Id` INT NOT NULL,
	`Seccion_Id` INT NOT NULL,
        `Proveedor_Id` INT NOT NULL,
	`Tiempo_garantia` INT NOT NULL,
	`Tiempo_vida` INT NOT NULL,
	`Vencimiento_garantia` DATE NOT NULL,
	`Vencimiento_vida` DATE NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Documentos` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Documento` blob NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	`Maquina_Id` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Imagenes` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Imagen` varchar(2000) NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	`Maquina_Id` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Proveedores` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre_compania` varchar(50) NOT NULL,
	`Telefono` varchar(12) NOT NULL DEFAULT 'No hay datos',
	`Direccion` varchar(100) DEFAULT 'No hay datos',
	`Codigo_postal` varchar(100) DEFAULT 'No hay datos',
	`Ciudad_Id` INT,
	`Email` varchar(100) NOT NULL DEFAULT 'No hay datos',
	`Pagina_web` varchar(100) DEFAULT 'No hay datos',
	`Saldo_adeudado` DECIMAL(9,3) NOT NULL,
	`Descripcion_producto` TEXT NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `TiposMaquinas` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Localizaciones` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Codigo` varchar(50) NOT NULL UNIQUE,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Secciones` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` INT NOT NULL,
	`Localizacion_Id` INT NOT NULL,
	`Estado` varchar(10) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	`Codigo` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Paises` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Ciudades` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Departamento_Id` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Departamentos` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Pais_Id` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Vendedores` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Email` varchar(50) NOT NULL,
	`Proveedor_Id` INT,
	`Codigo` INT,
	`Estado` varchar(50) NOT NULL DEFAULT 'Activo',
	`FchUltAction` TIMESTAMP NOT NULL,
	`UserAction` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE Usuarios(
    Id int AUTO_INCREMENT,
    Usuario varchar(15),
    Contrasena varchar(16),
    Rol varchar(20),
    PRIMARY KEY(`Id`)
);

ALTER TABLE `Maquinas` ADD CONSTRAINT `Maquinas_fk0` FOREIGN KEY (`Maquina_padre_Id`) REFERENCES `Maquinas`(`Id`);

ALTER TABLE `Maquinas` ADD CONSTRAINT `Maquinas_fk1` FOREIGN KEY (`Vendedor_Id`) REFERENCES `Vendedores`(`Id`);

ALTER TABLE `Maquinas` ADD CONSTRAINT `Maquinas_fk2` FOREIGN KEY (`Tipo_maquina_Id`) REFERENCES `TiposMaquinas`(`Id`);

ALTER TABLE `Maquinas` ADD CONSTRAINT `Maquinas_fk3` FOREIGN KEY (`Seccion_Id`) REFERENCES `Secciones`(`Id`);

ALTER TABLE `Maquinas` ADD CONSTRAINT `Maquinas_fk4` FOREIGN KEY (`Proveedor_Id`) REFERENCES `Proceedores`(`Id`);

ALTER TABLE `Documentos` ADD CONSTRAINT `Documentos_fk0` FOREIGN KEY (`Maquina_Id`) REFERENCES `Maquinas`(`Id`);

ALTER TABLE `Imagenes` ADD CONSTRAINT `Imagenes_fk0` FOREIGN KEY (`Maquina_Id`) REFERENCES `Maquinas`(`Id`);

ALTER TABLE `Proveedores` ADD CONSTRAINT `Proveedores_fk0` FOREIGN KEY (`Ciudad_Id`) REFERENCES `Ciudades`(`Id`);

ALTER TABLE `Secciones` ADD CONSTRAINT `Secciones_fk0` FOREIGN KEY (`Localizacion_Id`) REFERENCES `Localizaciones`(`Id`);

ALTER TABLE `Ciudades` ADD CONSTRAINT `Ciudades_fk0` FOREIGN KEY (`Departamento_Id`) REFERENCES `Departamentos`(`Id`);

ALTER TABLE `Departamentos` ADD CONSTRAINT `Departamentos_fk0` FOREIGN KEY (`Pais_Id`) REFERENCES `Paises`(`Id`);

ALTER TABLE `Vendedores` ADD CONSTRAINT `Vendedores_fk0` FOREIGN KEY (`Proveedor_Id`) REFERENCES `Proveedores`(`Id`);

