<%-- 
    Document   : indexTipos
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.TiposMaquinas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        String rol = sesion.getRoles().getRol();
        List<TiposMaquinas> ti = (ArrayList<TiposMaquinas>) session.getAttribute("tipos");
        if (ti != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Tipos de máquinas"/>
        </jsp:include>
        <script src="../assets/js/tables/tiposMaquinas.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <div class="row">
                <h3 class="col-md-6">Tipos de máquinas</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <% if (!rol.equalsIgnoreCase("produccion") && !rol.equalsIgnoreCase("tmantenimiento")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            data-toggle="modal" data-target="#new">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                        <% if (rol.equalsIgnoreCase("administrador")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" name="btn"
                            onclick="location.href = '../TiposMaquinasC?valor=inactivo&btn=Tipos'"
                            value="ver inactivos">
                        <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>
                    </button>
                    <%
                            }
                        }
                    %>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../index.jsp'">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table tablas">
                    <thead>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Estado de registro</th>
                    <th class="text-center">Ultima modificación</th>
                    <th class="text-center">Usuario</th>
                        <% if (!rol.equalsIgnoreCase("produccion") && !rol.equalsIgnoreCase("tmantenimiento")) {%>
                    <th></th>
                    <th></th>
                        <% } %>
                    </thead>
                    <tbody>
                        <%for (TiposMaquinas t : ti) {%>
                        <tr>
                            <td  class="text-left"><%= t.getNombre()%></td>
                            <td  class="text-center"><%= t.getEstado()%></td>
                            <td  class="text-center"><%= t.getFchUltAction()%></td>
                            <td  class="text-center"><%= t.getUserAction()%></td>
                            <% if (!rol.equalsIgnoreCase("produccion") && !rol.equalsIgnoreCase("tmantenimiento")) {%>
                            <td  class="text-center">
                                <input class=" open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" data-id="<%=t.getId()%>" data-nombre="<%= t.getNombre()%>"
                                       data-estado="<%= t.getEstado()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion('TiposMaquinasC', '<%=t.getId()%>',
                                                       '<%= t.getNombre()%>', 'Inactivo', this)" value="Eliminar"/>
                            </td>
                            <% } %>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>
                <!-- Modal editar-->
                <div class="modal fade" id="edit" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Editar tipo</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../TiposMaquinasC">
                                    <input class="form-control" type="hidden" name="tipoId" id="id" value=""/>
                                    <label>Tipo de máquina&nbsp;<span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" required=""
                                           name="nombreTipo" id="nombre" value=""/>
                                    <span class="help-block"></span>
                                    <input class="form-control" type="hidden" name="Estado" id="estado" value=""/>
                                    <div class="modal-footer">
                                        <span class="text-danger pull-left">* Campos obligatorios</span>
                                        <input class="btn btn-primary" id="btnedit"
                                               type="submit" name="btn" value="Guardar Cambios"/>
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
                                <h4 class="modal-title">Nuevo tipo</h4>
                            </div>
                            <div class="modal-body">
                                <form id="tipomaquina" class="form-group" action="../TiposMaquinasC">
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control" type="text" 
                                               name="nombreTipo" id="notnull"
                                               placeholder="Tipo de máquina"/>
                                        <span class="help-block"></span>
                                    </div>

                                    <div class="modal-footer">
                                        <span class="text-danger pull-left">* Campos obligatorios</span>
                                        <input class="btn btn-primary" type="submit" 
                                               id="btnnew" name="btn" value="Guardar"/>
                                        <input type="button" class="btn btn-default"
                                               data-dismiss="modal" value="Cancelar">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                session.removeAttribute("tipos");
            %>
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%
        } else {
            response.sendRedirect("../TiposMaquinasC?btn=Tipos&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
