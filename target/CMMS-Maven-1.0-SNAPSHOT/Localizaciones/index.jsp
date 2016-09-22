<%-- 
    Document   : indexLocalizaciones
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Localizaciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<Localizaciones> array = (ArrayList<Localizaciones>) session.getAttribute("localizaciones");

        if (array != null) {
            System.out.println("Localizaciones");
            String rol = sesion.getRoles().getRol();
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Localizaciones"/>
        </jsp:include>
        <script src="../assets/js/tables/localizaciones.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"/>
            </jsp:include>
        </header>
        <main class="container">
            <div class="row">
                <h3 class="col-md-6">Localidades</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            data-toggle="modal" data-target="#new">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                    <% if (rol.equalsIgnoreCase("administrador")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" name="btn"
                            onclick="location.href = '../LocalizacionesC?valor=inactivo&btn=Localizaciones'"
                            value="ver inactivos">
                        <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>
                    </button>
                    <% } %>
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
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Codigo</th>
                            <th class="text-center">Estado de registro</th>
                            <th class="text-center">Ultima modificación</th>
                            <th class="text-center">Usuario</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Localizaciones a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombre()%></td>
                            <td  class="text-center"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <td  class="text-center">
                                <input class=" open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" data-id="<%=a.getId()%>" 
                                       data-nombre="<%= a.getNombre()%>" data-estado="<%= a.
                                               getEstado()%>" data-codigo="<%= a.getCodigo()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="desactivar('LocalizacionesC', '<%=a.getId()%>',
                                                       '<%= a.getNombre()%>', '<%= a.getCodigo()%>',
                                                       'Inactivo', this)" value="Eliminar"/>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <!-- Modal editar-->
                <div class="modal fade" id="edit" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Editar localizacion</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../LocalizacionesC">
                                    <input class="form-control" type="hidden" name="localizacionId" id="id" value=""/>
                                    <div>
                                        <label>Localizadad&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control form-group" required="" type="text" name="nombreLocalizacion" id="nombre" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <div>
                                        <label>Código&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control form-group" required="" type="text" name="codigo" id="codigo" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <input class="form-control" type="hidden" name="Estado" id="estado" value=""/>
                                    <div class="modal-footer">
                                        <span class="text-danger pull-left">* Campos obligatorios</span>
                                        <input class="btn btn-primary" type="submit" id="btnedit"
                                               name="btn" value="Guardar Cambios"/>
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
                <!--Modal nuevo-->
                <div class="modal fade" id="new" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Nuevo localizacion</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../LocalizacionesC">
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control form-group" id="notnull"
                                               type="text" name="nombreLocalizacion" 
                                               placeholder="Localidad"/>
                                        <span class="help-block"></span>
                                    </div>
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control form-group" 
                                               type="text" name="codigo" id="codigonew" 
                                               placeholder="Código"/>
                                        <span class="help-block"></span>
                                    </div>
                                    <div class="modal-footer">
                                        <span class="text-danger pull-left">* Campos obligatorios</span>
                                        <input class="btn btn-primary" id="btnnew"
                                               type="submit" name="btn" value="Guardar"/>
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                session.removeAttribute("localizaciones");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
            response.sendRedirect("../LocalizacionesC?btn=Localizaciones&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
