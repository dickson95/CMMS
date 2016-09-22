<%-- 
    Document   : navigation
    Created on : 21/04/2016, 05:05:50 PM
    Author     : esteban
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Roles"%>
<%@page import="java.util.List"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object usuario = session.getAttribute("usuario");
    String rol = null;
    Usuarios user = new Usuarios();
    /**
     * Control objeto usuario not null, sólo asígna un rol si existe
     * de lo contrarión analizará toda la barra de navegación con el rol 
     * como nulo
     */
    if (usuario != null) {
        user = (Usuarios) usuario;
        rol = user.getRoles().getRol();
    }
%>

<!--Barra de navegación-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <% if (rol != null) { %>
        <div class="navbar-header">
            <a class="navbar-brand" href="../index.jsp">CMMS</a>
        </div>
        <%} else { %>
        <div class="navbar-header">
            <a class="navbar-brand" href="../index.jsp">SISTEMA DE MANTENIMIENTO ASISTIDO POR ORDENADOR</a>
        </div>
        <%} %>
        <% if (rol != null) { %>
        
        <!--Botón para el menú comprimido-->
        <div class="nav navbar navbar-right">
            <button type="button" class="navbar-toggle collapsed" 
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav">
                <li><a href="../TiposMaquinasC?btn=Tipos&valor=activo">Tipos de máquinas</a></li>
                <li><a href="../LocalizacionesC?btn=Localizaciones&valor=activo">Localidades</a></li>
                <li><a href="../SeccionesC?btn=Secciones&valor=activo">Secciones</a></li>
                    <% if (!rol.equalsIgnoreCase("produccion")
                                && !rol.equalsIgnoreCase("tmantenimiento")) { %>
                <li><a href="../ProveedoresC?btn=Proveedores&valor=activo">Proveedores</a></li>
                <li><a href="../VendedoresC?btn=Vendedores&valor=activo">Vendedores</a></li>
                    <%
                        }
                    %>
                <li><a href="../ImagenesC?btn=Imagenes&valor=activo">Imágenes</a></li>
                <li><a href="../MaquinasC?btn=Maquinas&valor=activo">Maquinas</a></li>
                    <% if (rol.equalsIgnoreCase("administrador")) { %>
                <li><a href="../UsuariosC?btn=Usuarios&valor=activo">Usuarios</a></li>
                    <%
                        }
                    %>
            </ul>
            <ul class="nav navbar-nav navbar-right"> 
                <li><a href="../UsuariosC?btn=salir" class="open-Modal">
                        <span class="glyphicon glyphicon-log-out"></span>&nbsp;Salir</a></li>
                <li><a href="../Usuarios/datos.jsp">Mi cuenta</a></li>
            </ul>

        </div>
        <%
            }
        %>
    </div>
</nav>
