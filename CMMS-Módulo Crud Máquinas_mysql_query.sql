#Consulta Proveedores
SELECT 
    P.Id,
    P.Nombre_compania,
    P.Telefono,
    P.Direccion,
    P.Codigo_postal,
    C.Id as 'Id Ciudad',
    C.Nombre as 'Ciudad',
    D.Id as 'Id Departamento',
    D.Nombre as 'Departamento',
    PA.Id as 'Id País',
    PA.Nombre as 'País',
    P.Email,
    P.Pagina_web,
    P.Saldo_adeudado,
    P.Descripcion_producto,
    P.Estado,
    P.FchUltAction,
    P.UserAction
FROM Proveedores P, Ciudades C, Departamentos D, Paises PA
WHERE P.Estado='Activo' and P.Ciudad_Id=C.Id and 
C.Departamento_Id=D.Id and D.Pais_Id=PA.Id;	
