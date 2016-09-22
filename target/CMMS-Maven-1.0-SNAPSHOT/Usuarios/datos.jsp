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
    System.out.println(s);
    if (s != null) {
        Usuarios user = (Usuarios) s;
        List<Roles> roles = new ArrayList<Roles>();
        System.out.println("Lista de roles inicializada");
        if (user != null) {
            String rol = null;
            System.out.println("User distinto de nulo");
            try {
                rol = user.getRoles().getRol();
                System.out.println(rol);
            } catch (Exception e) {
                System.out.println(e);
            }
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
            <div>
                <section>
                    <div class="row">
                        <div class="pull-left col-md-6 text-left">
                            <h3>Mis datos</h3>
                        </div>
                        <div class="pull-right col-md-6 text-right">
                            <button type="button" class="btn btn-default" aria-label="Left Align"
                                    data-toggle="modal" data-target="#modify">
                                Actualizar mis datos
                            </button>
                        </div>
                    </div>
                    <div class="panel panel-body panel-info text-left">
                        <blockquote>
                            <p>
                                <label>Nombre:&nbsp;</label> <span><%=user.getNombre()%></span>
                            </p>
                            <p>
                                <label>Usuario:&nbsp;</label> <span><%=user.getUsuario()%></span>
                            </p>
                            <p>
                                <label>Papel en el sistema:&nbsp;</label> <span><%=user.getRoles().getRol()%></span>
                            </p>
                            <p>
                                <label>Estado en el sistema:&nbsp;</label> <span><%=user.getEstado()%></span>
                            </p>
                            <%
                                System.out.println("Datos impresos correctamente");
                            %>
                        </blockquote>
                    </div>

                </section>
            </div>
            <%
                System.out.println("Formulario empieza");
                try {
                    if (rol.equals("administrador") || rol == "administrador") {
                        System.out.println("Voy a tomar los roles");
                        roles = (ArrayList<Roles>) session.getAttribute("roles");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                System.out.println("Pase la asignación de roles");
            %>

            <!--ventana para configuración de la cuenta-->
            <div class="modal fade" id="modify" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Configuración de cuenta</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-group" action="../UsuariosC">
                                <div>
                                    <label>Nombre&nbsp;<span class="text-danger">*</span></label>
                                    <input class="form-control form-group" id="nombremodify"
                                           type="text" name="nombre"  value="<%=user.getNombre()%>"/>
                                    <span class="help-block"></span>
                                </div>
                                <div>
                                    <label class="text-danger">*</label>
                                    <input class="form-control form-group" id="usuariomodify"
                                           type="email" name="usuario" readonly="" value="<%=user.getUsuario()%>"/>
                                    <span class="help-block"></span>
                                </div>
                                <div>
                                    <label class="text-danger">*</label>
                                    <input class="form-control form-group" id="contrasenamodify"
                                           type="password" name="contrasena" placeholder="Contraseña nueva"/>
                                    <span class="help-block"></span>
                                </div>
                                <div>
                                    <label class="text-danger">*</label>
                                    <input class="form-control form-group" id="contrasenaconfirmodify"
                                           type="password" name="contrasena" placeholder="Confirmar contraseña"/>
                                    <span class="help-block"></span>
                                </div>

                                <%
                                    try {
                                        if (rol.equals("administrador")) {
                                %>
                                <label>Rol&nbsp;<span class="text-danger">*</span></label>
                                <select name="rol" required="" class="form-control form-group"> 
                                    <%for (Roles a : roles) {%>
                                    <option value="<%= a.getId()%>"><%= a.getRol()%></option>
                                    <%}%>
                                </select>
                                <%
                                        }
                                    } catch (Exception e) {
                                        System.out.println(e);
                                    }
                                %>
                                <div class="modal-footer">
                                    <label class="text-danger pull-left">* Campos obligatorios</label>
                                    <input class="btn btn-primary" id="btnmodify"
                                           type="submit" name="btn" value="Actualizar datos"/>
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%
        } else {
            response.sendRedirect("../UsuariosC?btn=Usuarios&valor=activo");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
