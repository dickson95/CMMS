<%-- 
    Document   : indexUsuarios
    Created on : 14/06/2016, 05:57:02 PM
    Author     : esteban
--%>
<%@page import="com.esteban.cmms.maven.controller.beans.Roles"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    if (s != null) {
        Usuarios sesion = (Usuarios) s;

        List<Usuarios> array = (ArrayList<Usuarios>) session.getAttribute("usuarios");
        List<Roles> roles = (ArrayList<Roles>) session.getAttribute("roles");

        if (array != null) {
            System.out.println("Usuarios");
            String rol = sesion.getRoles().getRol();
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Usuarios"/>
        </jsp:include>
        <script src="../assets/js/tables/usuarios.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"/>
            </jsp:include>
        </header>
        <main class="container">
            <%if (rol.equals("administrador")) {%>
            <div>
                <section class="col-md-12">
                    <div class="row">
                        <div class="col-sm-6 text-left">
                            <h3>Usuarios del sistema</h3>
                        </div>
                        <!--Botones generales-->
                        <div class="col-md-6 text-right">
                            <button type="button" class="btn btn-default" aria-label="Left Align"
                                    data-toggle="modal" data-target="#newuser">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <span class="glyphicon glyphicon-folder-close"></span>
                            </button>
                            <button type="button" class="btn btn-default" aria-label="Left Align" 
                                    onclick="location.href = '../index.jsp'">
                                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table tablas">
                            <thead>
                                <tr>
                                    <th class="text-left">Usuario</th>
                                    <th class="text-left">Nombre</th>
                                    <th class="text-left">Registro</th>
                                    <th class="text-left">Estado</th>
                                    <th class="text-left">Rol</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Usuarios a : array) {%>
                                <tr>
                                    <td  class="text-left"><%= a.getUsuario()%></td>
                                    <td  class="text-left"><%= a.getNombre()%></td>
                                    <td  class="text-left"><%= a.getFch_registro()%></td>
                                    <td  class="text-left"><%= a.getEstado()%></td>
                                    <td  class="text-left"><%= a.getRoles().getRol()%></td>
                                    <td>
                                        <% if (a.getEstado().equals("Vetado")) {%>
                                        <input class="btn btn-danger" type="button" name="btn" 
                                               onclick="confirmacion(
                                                               'UsuariosC',
                                                               '<%=a.getId()%>',
                                                               this, 'Activo'
                                                               )" value="Activar"/>
                                        <% } else {%>
                                        <input class="btn btn-danger" type="button" name="btn" 
                                               onclick="confirmacion(
                                                               'UsuariosC',
                                                               '<%=a.getId()%>',
                                                               this, 'Vetado'
                                                               )" value="Vetar"/>
                                        <% } %>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <!--Modal nuevo-->
                        <div class="modal fade" id="newuser" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Nuevo usuario</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-group" action="../UsuariosC">
                                            <label class="text-danger">*</label>
                                            <div>
                                                <input class="form-control form-group" id="nombre"
                                                       type="text" name="nombre"  placeholder="Nombre"/>
                                                <span class="help-block"></span>
                                            </div>
                                            <div>
                                                <label class="text-danger">*</label>
                                                <input class="form-control form-group" id="usuario"
                                                       type="email" name="usuario"  placeholder="Usuario"/>
                                                <span class="help-block"></span>
                                            </div>
                                            <div>
                                                <label class="text-danger">*</label>
                                                <input class="form-control form-group" id="contrasena"
                                                       type="password" name="contrasena" placeholder="Contraseña"/>
                                                <span class="help-block"></span>
                                            </div>
                                            <label>Rol&nbsp;<span class="text-danger">*</span></label>
                                            <select name="rol" required="" class="form-control form-group"> 
                                                <%for (Roles a : roles) {%>
                                                <option value="<%= a.getId()%>"><%= a.getRol()%></option>
                                                <%}%>
                                            </select>
                                            <div class="modal-footer">
                                                <label class="text-danger pull-left">* Campos obligatorios</label>
                                                <input class="btn btn-primary" id="btnnew"
                                                       type="submit" name="btn" value="Registrar"/>
                                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%
                        session.removeAttribute("usuarios");
                    %> 
                </section>
            </div>
            <%
                } else {
                    session.removeAttribute("usuarios");
                    out.print("<h1>Lo sentimos. La página que busca no se pudo hallar.</h1>");
                }
            %>
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%} else {
            response.sendRedirect("../UsuariosC?btn=Usuarios&valor=activo");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
