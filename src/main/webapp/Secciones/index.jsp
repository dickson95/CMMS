<%-- 
    Document   : indexSecciones
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.esteban.cmms.maven.controller.beans.Localizaciones"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Secciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Secciones> array = (ArrayList<Secciones>) session.getAttribute("secciones");
    List<Localizaciones> localizaciones = (ArrayList<Localizaciones>) session.getAttribute("localizaciones");
%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        <script src="../assets/js/tables/secciones.js"></script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
            </header>
            <main>
                <h3>Lista de Secciones</h3>
                <div class="table-responsive">
                    <table class="table ">
                        <thead>
                            <tr>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Codigo</th>
                                <th class="text-center">Localidad</th>
                                <th class="text-center">Estado de registro</th>
                                <th class="text-center">Ultima modificación</th>
                                <th class="text-center">Usuario</th>
                                <th colspan="2"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for (Secciones a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombre()%></td>
                            <td  class="text-center"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getLocalizaciones().getNombre()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <td  class="text-center">
                                <input class=" open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" data-id="<%=a.getId()%>" 
                                       data-nombre="<%= a.getNombre()%>" data-estado="<%= a.
                                               getEstado()%>" data-codigo="<%= a.getCodigo()%>"
                                               data-locid="<%= a.getLocalizaciones().getId() %>"
                                               data-locnom="<%= a.getLocalizaciones().getNombre() %>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion('SeccionesC', '<%=a.getId()%>',
                                        '<%= a.getNombre()%>', '<%= a.getCodigo()%>',
                                        '<%= a.getLocalizaciones().getId() %>',
                                        'Inactivo')" value="Desactivar"/>
                            </td>
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
                                <h4 class="modal-title">Editar sección</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../SeccionesC">
                                    <input class="form-control" type="hidden" name="seccionId" id="id" value=""/>
                                    <input class="form-control" type="text" name="nombreSeccion" id="nombre" value=""/>
                                    <input class="form-control" type="text" name="codigo" id="codigo" value=""/>
                                    <select class="form-control" name="localizacion">
                                        <option id="locid" selected></option>
                                        <% 
                                            for (Localizaciones l : localizaciones) {
                                                out.print("<option value=" + l.getId() + ">" + l.getNombre() + "</option>");
                                            }%>
                                    </select>
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
                                <h4 class="modal-title">Nueva sección</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../SeccionesC">
                                    <input class="form-control form-group" required="" type="text" name="nombreSeccion" placeholder="Nombre"/>
                                    <input class="form-control form-group" required=""  type="text" name="codigo" placeholder="Código"/>
                                    <select  name="localizacion" required="" class="form-control form-group">
                                        <% for (Localizaciones l : localizaciones) {
                                                out.print("<option value=" + l.getId() + ">" + l.getNombre() + "</option>");
                                            }%>
                                    </select>
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
            <!--Botones generales-->
            <div class="text-center">
                <input type="text" class="btn btn-default" data-toggle="modal" data-target="#new"
                       name="btn" value="Nuevo"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../index.jsp'"
                       name="btn" value="Inicio"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../SeccionesC?valor=inactivo&btn=Secciones'"
                       name="btn" value="Ver inactivos"/>
            </div>
            <%
                session.removeAttribute("secciones");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
        response.sendRedirect("../SeccionesC?btn=Secciones&valor=activo");
    }
%>