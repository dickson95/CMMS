<%-- 
    Document   : navigation
    Created on : 21/04/2016, 05:05:50 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="../index.jsp">CMMS</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                    <li><a href="../TiposMaquinasC?btn=Tipos&valor=activo">Tipos</a></li>
                    <li><a href="../LocalizacionesC?btn=Localizaciones&valor=activo">Localidades</a></li>
                    <li><a href="../SeccionesC?btn=Secciones&valor=activo">Secciones</a></li>
                    <li><a href="../ProveedoresC?btn=Proveedores&valor=activo">Proveedores</a></li>
                    <li><a href="../VendedoresC?btn=Vendedores&valor=activo">Vendedores</a></li>
                    <li><a href="../ImagenesC?btn=Imagenes&valor=activo">Imágenes</a></li>
                    <li><a href="../DocumentosC?btn=Documentos&valor=activo">Documentos</a></li>
                    <li><a href="../MaquinasC?btn=Maquinas&valor=activo">Maquinas</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" class="open-Modal" data-toggle="modal" 
                       data-target="#login">Ingresar</a></li>
                <li><a href="#" class="open-Modal" data-toggle="modal" 
                       data-target="#registrarse">Registrarse</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" 
                       role="button" aria-haspopup="true" aria-expanded="false">Tablas<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../TiposMaquinasC?btn=Tipos&valor=activo">Tipos</a></li>
                        <li><a href="../LocalizacionesC?btn=Localizaciones&valor=activo">Localidades</a></li>
                        <li><a href="../SeccionesC?btn=Secciones&valor=activo">Secciones</a></li>
                        <li><a href="../ProveedoresC?btn=Proveedores&valor=activo">Proveedores</a></li>
                        <li><a href="../VendedoresC?btn=Vendedores&valor=activo">Vendedores</a></li>
                        <li><a href="../ImagenesC?btn=Imagenes&valor=activo">Imágenes</a></li>
                        <li><a href="../DocumentosC?btn=Documentos&valor=activo">Documentos</a></li>
                        <li><a href="../MaquinasC?btn=Maquinas&valor=activo">Maquinas</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Ingresar</h4>
            </div>
            <div class="modal-body">
                <form class="form-group" action="../UsuariosC">
                    <input class="form-control" type="text" name="usuario"  placeholder="Usuario"/>
                    <input class="form-control" type="password" name="contrasena" placeholder="Contraseña"/>
                    <div class="modal-footer">
                        <input class="btn btn-primary" type="submit" name="btn" value="Ingresar"/>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="registrarse" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Registrarse</h4>
            </div>
            <div class="modal-body">
                <form class="form-group" action="../UsuariosC">
                    <input class="form-control" type="text" name="usuario"  placeholder="Usuario"/>
                    <input class="form-control" type="password" name="contrasena" placeholder="Contraseña"/>
                    <div class="modal-footer">
                        <input class="btn btn-primary" type="submit" name="btn" value="Registrar"/>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
