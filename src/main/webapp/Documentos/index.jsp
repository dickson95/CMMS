<%-- 
    Document   : indexDocumentos
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Documentos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        String rol = sesion.getRoles().getRol();
        List<Documentos> array = (ArrayList<Documentos>) session.getAttribute("documentos");
        if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/documentos.js"></script>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
            </header>
            <main>
                <div class="row">
                <h3 class="col-md-6">Tipos de máquinas</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <% if (!rol.equalsIgnoreCase("produccion")  && !rol.equalsIgnoreCase("tmantenimiento")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            data-toggle="modal" data-target="#new">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                    <input type="button" class="btn btn-default" onclick="location.href = '../DocumentosC?valor=inactivo&btn=Documentos'"
                           name="btn" value="Ver inactivos"/>
                    <% } %>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../index.jsp'">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
                <div class="table-responsive">
                    <table class="table ">
                        <thead>
                            <tr>
                                <th class="text-center">Documento</th>
                                <th class="text-center">Estado de registro</th>
                                <th class="text-center">Ultima modificación</th>
                                <th class="text-center">Usuario</th>
                                <th colspan="2"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for (Documentos a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getDocumento()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <% if (!rol.equalsIgnoreCase("produccion")  && !rol.equalsIgnoreCase("tmantenimiento")) {%>
                            <td  class="text-center">
                                <input class=" open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" data-id="<%=a.getId()%>" 
                                       data-nombre="<%= a.getFchUltAction()%>" data-estado="<%= a.
                                               getEstado()%>" data-codigo="<%= a.getEstado()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="desactivar('DocumentosC', '<%=a.getId()%>',
                                                       '<%= a.getEstado()%>', '<%= a.getUserAction()%>',
                                                       'Inactivo')" value="Desactivar"/>
                            </td>
                            <% } %>
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
                                <h4 class="modal-title">Editar documento</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../DocumentosC">
                                    <input class="form-control" type="hidden" name="documentoId" id="id" value=""/>
                                    <input class="form-control" type="text" name="nombreLocalizacion" id="nombre" value=""/>
                                    <input class="form-control" type="text" name="codigo" id="codigo" value=""/>
                                    <input class="form-control" type="hidden" name="Estado" id="estado" value=""/>
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" name="btn" value="Guardar Cambios"/>
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
                                <h4 class="modal-title">Nuevo documento</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../DocumentosC">
                                    <input class="form-control" type="text" name="nombreLocalizacion" placeholder="Nombre"/>
                                    <input class="form-control" type="text" name="codigo" id="codigo" placeholder="Código"/>
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" name="btn" value="Guardar"/>
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                session.removeAttribute("documentos");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
            response.sendRedirect("../DocumentosC?btn=Documentos&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
