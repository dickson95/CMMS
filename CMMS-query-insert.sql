#insertar paises desde el archivo.
#insertar ciudades desde el archivo.

#Proveedores
INSERT INTO `Proveedores` VALUES 
(1,'Fatelares','8888','cale','6666','f@gmail.com','http://www.h.com',80,'telas','Inactivo','2016-06-29 18:10:02','esteban',20),
(2,'Fatelares','2949878','Calle 34','8078','fatelares@fatelares.com','http://www.fatelares.com',80,'Venta de telas para toallas','Activo','2016-07-07 18:24:58','Esteban',1338),
(3,'Coldeplast','2345678','Calle 28','6565','coldeplast@coldeplast.com','http://www.coldeplast.com',80,'Venta de plasticos para bolsas','Activo','2016-06-30 15:31:23','Esteban',75547),
(4,'tecniplast','9822345','calle 48','239485','tecniplast@tecniplast.com','http://www.tecniplas.com.co/',435,'hola','Activo','2016-06-30 15:45:25','Esteban',215),
(5,'MinTic','57757575','Calle 93','9182375','mintic@mintic.com','http://www.mintic.com',80,'Ministerio de las TIC','Activo','2016-06-30 16:05:03','Esteban',20),
(6,'mic','823','transversal sur 25','896345','mic@mic.com','http://www.mic.com',4567,'Empresa de Cristian','Activo','2016-06-30 15:35:41','Esteban',11628),
(7,'Tropicana','23896234','Avenida guayabal','979324','tropicana@tropicana.com','http://www.tropicana.com',0,'Empresa de Gemay                                    ','Activo','2016-07-06 19:24:29','Esteban',11051),
(8,'Éxito','4444444','Envigado','98687','exito@gmail.com','http://www.exito.com',0,'Nada que decir                                    ','Activo','2016-06-30 17:09:36','Esteban',7841),
(9,'DIM','1923848','caller 19','1234','dim@dim.com','http://www.dim.com',52,'                                    Equipo de fútbol','Activo','2016-07-09 02:00:37','Esteban',10839),
(10,'Jumbo','67868768','','','jumbo@gmail.com','',89,'                                    ','Activo','2016-07-09 01:50:56','Esteban',13428);

#Vendedores
INSERT INTO `Vendedores` VALUES 
(1,'Giovanny Leal','gololeal1@gmail.com',1,21564,'Activo','2016-06-23 18:45:25','Carlos'),
(2,'Dickson','dickson@gmail.com',3,354,'Activo','2016-05-17 16:45:25','esteban'),
(3,'Patricia','patricia@patricia.com',4,3554,'Inactivo','2016-06-23 16:16:37','esteban'),
(4,'Laura','laura@gmail.com',6,356,'Activo','2016-05-26 22:22:26','esteban'),
(5,'','gemay@gmail.com',7,357,'Activo','2016-07-09 02:24:19','Esteban'),
(6,'Yeison','yeison@gmail.com',2,789,'Activo','2016-06-23 16:15:11','esteban'),
(7,'Ángela Duarte','angela@gmail.com',3,123,'Inactivo','2016-06-23 16:16:35','esteban'),
(8,'Julián','hernando@gmail.com',6,9834,'Activo','2016-07-06 19:25:58','Esteban'),
(9,'Estebandido','estebanhd@gmail.com',2,5267,'Inactivo','2016-06-23 16:16:33','esteban');

#Tipos de máquinas
INSERT INTO `TiposMaquinas` VALUES 
(1,'Fileteadora','Activo','2016-05-17 22:31:37','esteban'),
(2,'Cosedora casera','Activo','2016-06-23 18:13:30','Giovanny'),
(3,'Recubridora','Activo','2016-06-23 18:14:23','Carlos'),
(4,'Plana industrial','Inactivo','2016-05-11 04:29:03','esteban'),
(5,'Activadora','Activo','2016-07-09 00:00:37','Esteban'),
(6,'Cosedora casera','Inactivo','2016-05-20 15:53:36','esteban'),
(7,'Cosedora','Activo','2016-06-23 18:12:38','Esteban'),
(8,'Refinadora','Activo','2016-07-07 18:15:21','Esteban'),
(9,'Plana','Activo','2016-06-23 18:13:12','Giovanny'),
(10,'Recubridora 2','Activo','2016-06-23 15:56:23','esteban'),
(11,'  ','Inactivo','2016-07-08 19:47:46','Esteban'),
(12,'','Inactivo','2016-07-08 20:58:39','Esteban'),
(13,'','Inactivo','2016-07-08 21:12:15','Esteban'),
(14,'Carro','Activo','2016-07-08 21:59:11','Esteban'),
(15,'Retro','Activo','2016-07-08 22:03:55','Esteban'),
(16,'Cortadora','Activo','2016-07-08 22:51:49','Esteban'),
(17,'carro nuevo','Activo','2016-07-08 23:50:55','Esteban'),
(18,'','Inactivo','2016-07-08 23:54:12','Esteban');

#Localizaciones
INSERT INTO `Localizaciones` VALUES 
(1,'Primer','0001','Activo','2016-05-20 15:56:38','esteban'),
(2,'Segundo piso','002','Inactivo','2016-07-06 19:22:45','Esteban'),
(3,'Tercer piso','0003','Activo','2016-05-13 00:32:05','esteban'),
(4,'Cuarto piso','0004','Inactivo','2016-05-27 17:19:23','esteban'),
(5,'Quinto ','0005','Inactivo','2016-06-23 16:16:45','esteban'),
(6,'Sexto ','0006','Activo','2016-06-23 16:17:05','esteban'),
(7,'Séptimo ','0007','Activo','2016-06-23 16:16:53','esteban'),
(8,'Octavo','0008','Activo','2016-06-23 16:17:00','esteban'),
(9,'Noveno piso','0009','Activo','2016-06-23 16:17:03','esteban'),
(10,'Décimo piso','0010','Inactivo','2016-06-23 16:16:44','esteban'),
(11,'Undécimo ','0011','Activo','2016-04-27 02:58:55','esteban'),
(12,'Duodécimo','0012','Inactivo','2016-05-27 17:19:19','esteban'),
(13,'Décimo tercero','0013','Activo','2016-04-27 03:00:00','esteban'),
(14,'Décimo cuarto','0014','Inactivo','2016-06-23 16:16:45','esteban'),
(15,'Decimo quinto','0015','Inactivo','2016-06-23 16:16:46','esteban'),
(16,'Piso 20','0020','Inactivo','2016-05-12 23:33:28','esteban'),
(17,'Piso 19','0019','Activo','2016-07-06 19:22:54','Esteban'),
(18,'Piso 17','0017','Inactivo','2016-06-23 16:16:47','esteban'),
(19,'Aartamento 708 Reservas del sur','577777','Activo','2016-07-09 00:40:25','Esteban'),
(20,'Apartamento Reservas del sur','146','Activo','2016-06-23 16:01:37','esteban'),
(21,'Mi pieza','23432','Activo','2016-07-09 00:14:09','Esteban'),
(22,'Pieza de laura','12343','Activo','2016-07-09 00:16:35','Esteban'),
(23,'','','Inactivo','2016-07-09 00:23:28','Esteban'),
(24,'Pieza amandita','92903','Activo','2016-07-09 00:33:41','Esteban');

#Secciones
INSERT INTO `Secciones` VALUES 
(1,'Camisas rojas',1,'Activo','2016-07-09 01:12:02','Esteban','002'),
(2,'Pantalones',5,'Activo','2016-05-26 17:58:24','esteban','001'),
(3,'Medias blancas',9,'Activo','2016-06-23 18:45:00','Carlos','006'),
(4,'Pantalones',3,'Inactivo','2016-05-27 17:20:44','esteban','004'),
(5,'Cierres',3,'Activo','2016-05-27 17:20:39','esteban','005'),
(6,'Medias',3,'Activo','2016-07-07 18:15:07','Esteban','003'),
(7,'Pantalones',7,'Activo','2016-05-27 17:20:27','esteban','007'),
(8,'Cuarto de Esteban',7,'Activo','2016-05-30 02:11:13','esteban','0003'),
(9,'Cuarto Amandita',20,'Activo','2016-07-06 19:24:00','Esteban','00001'),
(10,'',1,'Inactivo','2016-07-09 01:09:15','Esteban',''),
(11,'Mi cama',7,'Activo','2016-07-09 01:11:16','Esteban','32476');

#Máquinas
INSERT INTO `Maquinas` VALUES 
(1,'2009-12-24','2010-01-24','GEMSY TESTIL','GEM 8900','9V75B','1 HP','HBM987','GEMSY','Maquina de coser','bajo',12.8,'sin observación','esteban','Activo','2016-05-17 19:05:21',NULL,1,1,1,2,3,'2012-12-24','2011-12-24',1),
(2,'2008-03-05','2080-04-24','SINGER','S 8960','BFH12345','0,5 HP','JKO323','SINGER','Maquina de coser','Medio',12.8,'sin observación','Esteban','Inactivo','2016-06-28 21:01:20',1,6,2,2,3,3,'2012-12-24','2011-12-24',1),
(3,'2016-05-11','2016-05-11','Generals motors','Aveo','KJHLKJH','KJH','LKH','Chevrolet','                                                        JKHG                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                            ','Combustible',21,'                                                        KJHGKJHBLK                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                    \r\n                            ','Esteban','Activo','2016-07-08 01:47:17',2,1,7,2,3,2,'2016-05-12','2016-05-22',3),
(4,'2016-06-22','2016-06-15','alskdfklashf','asdfasdgfsdfgsdf','avdsfvrtbs ','bsdtbsfgbndfgbdf','dbfehrthbert','sdfgbdfgbndfnh','                                                sin notas                    \r\n                    \r\n                    ','sdfbdstbdxvdfg',555,'                                                sin notas                    \r\n                    \r\n                    ','Esteban','Inactivo','2016-06-30 17:12:58',3,1,9,1,5,8,'1999-01-01','2000-05-05',6),
(5,'2016-07-12','2016-07-12','','2016','005','12HP','79HFY7KKI9OO','SUZUKI','                                MOTOCICLETA                            \r\n                            ','0',125,'                                COLOR AZUL, DOS LLANTAS, DOS ESPEJOS, DOS PERSONAS CUPO MÁXIMO                            \r\n                            ','Esteban','Activo','2016-07-09 03:04:50',4,1,1,1,1,1,'2017-06-17','2017-07-19',9),
(6,'2016-07-20','2016-07-14',' ','12341345','123452cr','','2341234','','                            ','',0,'                            ','Esteban','Activo','2016-07-09 02:57:33',1,1,5,9,4,3,'2016-07-13','2016-07-26',3);

#Imágenes
#Debe estar nula esta tabla
#Documentos
#Misma condición de imágenes