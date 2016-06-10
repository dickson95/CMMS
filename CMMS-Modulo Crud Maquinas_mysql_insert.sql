USE CMMS;
#Tabla Proveedores
	INSERT INTO Proveedores(Nombre_compania, Telefono, Direccion, Codigo_postal, 
		Email, Pagina_web, Saldo_adeudado, Descripcion_producto, Estado, UserAction)
	VALUES('Fatelares', '2949878', 'Calle 34', '8078', 'fatelares@fatelares.com', 'www.fatelares.com', 
		80.32, 'Venta de telas para toallas', 'Activo', 'esteban');
	INSERT INTO Proveedores(Nombre_compania, Telefono, Direccion, Codigo_postal, 
		Email, Pagina_web, Saldo_adeudado, Descripcion_producto, Estado, UserAction) 
	VALUES ('tecniplast', '9822345', 'calle 48', '239485', 'tecniplast@tecniplast.com', 
		'http://www.tecniplas.com.co/', 435, 'hola', 'Activo', 'esteban');

#Tabla Localizaciones
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Décimo piso', '0010', 'Activo', 'esteban');
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Décimo quinto', '0015', 'Activo', 'esteban');
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Décimo cuarto', '0014', 'Activo', 'esteban');
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Décimo tercero', '0013', 'Activo', 'esteban');
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Duodécimo', '0012', 'Activo', 'esteban');
	INSERT INTO Localizaciones(Nombre, Codigo, Estado, UserAction) 
	VALUES ('Undécimo ', '0011', 'Activo', 'esteban');

#Tabla Ciudades
INSERT INTO Ciudades(Nombre, Departamento_Id) VALUES
    ('Bello', 1),
    ('Copacabana', 1),
    ('Girardota', 1),
    ('San Pedro', 1),
    ('Entrerrios', 1),
    ('Santa Rosa de Osos', 1),
    ('Don Matías', 1),
    ('Sabaneta', 1),
    ('Cota', 3),
    ('La Estrella', 1);

#Tabla TiposMaquinas
INSERT INTO TiposMaquinas(Nombre, UserAction) VALUES
    ('Fileteadora', 'esteban'),
    ('Plana', 'esteban'),
    ('Recubridora', 'esteban');