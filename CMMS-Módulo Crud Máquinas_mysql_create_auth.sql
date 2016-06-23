#ALTER TABLE `Usuarios` DROP FOREIGN KEY `Usuarios_fk0`;
USE CMMS;
DROP TABLE IF EXISTS `Usuarios`;

DROP TABLE IF EXISTS `Roles`;


CREATE TABLE `Usuarios` (
	`Id` INT NOT NULL AUTO_INCREMENT,
        `Nombre` varchar(100) NOT NULL,
	`Usuario` VARBINARY(50) NOT NULL,
	`Contrasena` varchar(40) NOT NULL,
	`Rol_Id` INT NOT NULL,
        `Estado` varchar(50) DEFAULT 'Activo',
        `Fch_registro` TIMESTAMP,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Roles` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Rol` varchar(50) NOT NULL,
	`Tipos` BOOLEAN NOT NULL,
	`Localizaciones` BOOLEAN NOT NULL,
	`Secciones` BOOLEAN NOT NULL,
	`Proveedores` BOOLEAN NOT NULL,
	`Vendedores` BOOLEAN NOT NULL,
	`Imagenes` BOOLEAN NOT NULL,
	`Documentos` BOOLEAN NOT NULL,
	`Maquinas` BOOLEAN NOT NULL,
	`Usuarios` BOOLEAN NOT NULL,
	PRIMARY KEY (`Id`)
);

ALTER TABLE `Usuarios` ADD CONSTRAINT `Usuarios_fk0` FOREIGN KEY (`Rol_Id`) REFERENCES `Roles`(`Id`);
