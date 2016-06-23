<%-- 
    Document   : navigation
    Created on : 21/04/2016, 05:05:50 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object roles = session.getAttribute("usuario");
    String rol = null;
    if (roles != null) {
        Usuarios role = (Usuarios) roles;
        rol = role.getRoles().getRol();
    }
    System.out.println("este es rol" + rol);
%>
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
        <div>
            <% if (rol != null) { %>
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
                <li><a href="../DocumentosC?btn=Documentos&valor=activo">Documentos</a></li>
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
            </ul>
            <%
            } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" class="open-Modal" data-toggle="modal" 
                       data-target="#login">
                        <span class="glyphicon glyphicon-log-in"></span>&nbsp;Ingresar</a></li>
                        <%
                            }
                        %>
            </ul>
        </div>
    </div>
</nav>
<%
    if (rol == null) {
%>
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
<%
    }
%>
