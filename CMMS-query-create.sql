#Paises
CREATE TABLE `Paises` (
  `Codigo` varchar(2) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#Ciudades
CREATE TABLE `Ciudades` (
  `idCiudades` int(11) NOT NULL AUTO_INCREMENT,
  `Paises_Codigo` varchar(2) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`idCiudades`),
  KEY `Paises_Codigo` (`Paises_Codigo`),
  KEY `Ciudad` (`Ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=269413 DEFAULT CHARSET=utf8;


#Proveedores
CREATE TABLE `Proveedores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_compania` varchar(50) NOT NULL,
  `Telefono` varchar(12) NOT NULL DEFAULT 'No hay datos',
  `Direccion` varchar(100) DEFAULT 'No hay datos',
  `Codigo_postal` varchar(100) DEFAULT 'No hay datos',
  `Email` varchar(100) NOT NULL DEFAULT 'No hay datos',
  `Pagina_web` varchar(100) DEFAULT 'No hay datos',
  `Saldo_adeudado` decimal(10,0) NOT NULL,
  `Descripcion_producto` text NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  `Ciudad_idCiudades` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Proveedores_fk0` (`Ciudad_idCiudades`),
  CONSTRAINT `Proveedores_fk0` FOREIGN KEY (`Ciudad_idCiudades`) REFERENCES `Ciudades` (`idCiudades`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#Vendedores
CREATE TABLE `Vendedores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Proveedor_Id` int(11) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Estado` varchar(50) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Vendedores_fk0` (`Proveedor_Id`),
  CONSTRAINT `Vendedores_fk0` FOREIGN KEY (`Proveedor_Id`) REFERENCES `Proveedores` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#Localizaciones
CREATE TABLE `Localizaciones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Codigo` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

#Secciones
CREATE TABLE `Secciones` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Localizacion_Id` int(11) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  `Codigo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Secciones_fk0` (`Localizacion_Id`),
  CONSTRAINT `Secciones_fk0` FOREIGN KEY (`Localizacion_Id`) REFERENCES `Localizaciones` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#Roles
CREATE TABLE `Roles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) NOT NULL,
  `Tipos` tinyint(1) NOT NULL,
  `Localizaciones` tinyint(1) NOT NULL,
  `Secciones` tinyint(1) NOT NULL,
  `Proveedores` tinyint(1) NOT NULL,
  `Vendedores` tinyint(1) NOT NULL,
  `Imagenes` tinyint(1) NOT NULL,
  `Documentos` tinyint(1) NOT NULL,
  `Maquinas` tinyint(1) NOT NULL,
  `Usuarios` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#Usuarios
CREATE TABLE `Usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varbinary(50) NOT NULL,
  `Contrasena` varchar(1000) NOT NULL,
  `Rol_Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Estado` varchar(50) DEFAULT 'Activo',
  `Fch_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Usuarios_fk0` (`Rol_Id`),
  CONSTRAINT `Usuarios_fk0` FOREIGN KEY (`Rol_Id`) REFERENCES `Roles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#Tipos de Máquinas
CREATE TABLE `TiposMaquinas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#Máquinas
CREATE TABLE `Maquinas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FchCompra` date NOT NULL,
  `Fch_puesta_marcha` date NOT NULL,
  `Fabricante` varchar(50) DEFAULT 'No hay información',
  `Modelo` varchar(50) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Potencia` varchar(50) DEFAULT 'No hay información',
  `Serial` varchar(50) NOT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Descripcion` text,
  `ConsumoEnergia` varchar(50) DEFAULT 'No hay información',
  `Peso` float DEFAULT '0',
  `Observacion` text,
  `UserAction` varchar(50) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Maquina_padre_Id` int(11) DEFAULT NULL,
  `Vendedor_Id` int(11) DEFAULT NULL,
  `Tipo_maquina_Id` int(11) NOT NULL,
  `Secciones_Id` int(11) NOT NULL,
  `Tiempo_garantia` int(11) NOT NULL,
  `Tiempo_vida` int(11) NOT NULL,
  `Vencimiento_garantia` date NOT NULL,
  `Vencimiento_vida` date NOT NULL,
  `Proveedor_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Maquinas_fk0` (`Maquina_padre_Id`),
  KEY `Maquinas_fk1` (`Vendedor_Id`),
  KEY `Maquinas_fk2` (`Tipo_maquina_Id`),
  KEY `Maquinas_fk3` (`Secciones_Id`),
  KEY `Maquinas_fk4` (`Proveedor_Id`),
  CONSTRAINT `Maquinas_fk0` FOREIGN KEY (`Maquina_padre_Id`) REFERENCES `Maquinas` (`Id`),
  CONSTRAINT `Maquinas_fk1` FOREIGN KEY (`Vendedor_Id`) REFERENCES `Vendedores` (`Id`),
  CONSTRAINT `Maquinas_fk2` FOREIGN KEY (`Tipo_maquina_Id`) REFERENCES `TiposMaquinas` (`Id`),
  CONSTRAINT `Maquinas_fk3` FOREIGN KEY (`Secciones_Id`) REFERENCES `Secciones` (`Id`),
  CONSTRAINT `Maquinas_fk4` FOREIGN KEY (`Proveedor_Id`) REFERENCES `Proveedores` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#Imágenes
CREATE TABLE `Imagenes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Imagen` varchar(2000) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  `Maquina_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Imagenes_fk0` (`Maquina_Id`),
  CONSTRAINT `Imagenes_fk0` FOREIGN KEY (`Maquina_Id`) REFERENCES `Maquinas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#Documentos
CREATE TABLE `Documentos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Documento` blob NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo',
  `FchUltAction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserAction` varchar(50) NOT NULL,
  `Maquina_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Documentos_fk0` (`Maquina_Id`),
  CONSTRAINT `Documentos_fk0` FOREIGN KEY (`Maquina_Id`) REFERENCES `Maquinas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

