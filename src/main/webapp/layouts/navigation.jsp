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
