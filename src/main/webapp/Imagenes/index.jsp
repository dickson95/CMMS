<%-- 
    Document   : indexImagenes
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Imagenes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Imagenes> array = (ArrayList<Imagenes>) session.getAttribute("imagenes");%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        <script src="../assets/js/tables/imagenes.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
        </header>
        <main>
            <h3>Lista de Imagenes</h3>
            <div class="table-responsive">
                <table class="table ">
                    <thead>
                        <tr>
                            <th class="text-center">Imagen</th>
                            <th class="text-center">Estado de registro</th>
                            <th class="text-center">Ultima modificación</th>
                            <th class="text-center">Usuario</th>
                            <th colspan="2"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Imagenes a : array) {%>
                        <tr>
                            <td class="text-left"><%= a.getImagen()%></td>
                            <td class="text-center"><%= a.getEstado()%></td>
                            <td class="text-center"><%= a.getFchUltAction()%></td>
                            <td class="text-center"><%= a.getUserAction()%></td>
                            <td class="text-center"><input
                                    class=" open-Modal btn btn-primary" type="button"
                                    data-toggle="modal" data-target="#edit" name="btn" value="Editar"
                                    data-id="<%=a.getId()%>" data-nombre="<%= a.getFchUltAction()%>"
                                    data-estado="<%= a.
                                            getEstado()%>"
                                    data-codigo="<%= a.getEstado()%>" /></td>
                            <td><input class="btn btn-danger" type="button" name="btn"
                                       onclick="desactivar('ImagenesC', '<%=a.getId()%>',
                                                       '<%= a.getEstado()%>', '<%= a.getUserAction()%>',
                                                       'Inactivo')"
                                       value="Desactivar" /></td>
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
                                <h4 class="modal-title">Editar imagen</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../ImagenesC">
                                    <input class="form-control" type="hidden" name="imagenId" id="id"
                                           value="" /> <input class="form-control" type="text"
                                           name="nombreLocalizacion" id="nombre" value="" /> <input
                                           class="form-control" type="text" name="codigo" id="codigo"
                                           value="" /> <input class="form-control" type="hidden"
                                           name="Estado" id="estado" value="" />
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" name="btn"
                                               value="Guardar Cambios" /> <input type="button"
                                               class="btn btn-default" data-dismiss="modal" value="Cancelar">
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
                                <h4 class="modal-title">Nuevo imagen</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../ImagenesC" enctype="multipart/form-data">
                                    <input class="form-control" type="file" name="imagen"/> 
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" name="btn"
                                               value="Guardar" /> <input type="button" class="btn btn-default"
                                               data-dismiss="modal" value="Cancelar">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--Botones generales-->
            <div class="text-center">
                <input type="text" class="btn btn-default" data-toggle="modal"
                       data-target="#new" name="btn" value="Nuevo" />&nbsp;| <input
                       type="text" class="btn btn-default"
                       onclick="location.href = '../index.jsp'" name="btn" value="Inicio" />&nbsp;|
                <input type="text" class="btn btn-default"
                       onclick="location.href = '../ImagenesC?valor=inactivo&btn=Imagenes'"
                       name="btn" value="Ver inactivos" />
            </div>
            <%
                session.removeAttribute("imagenes");
            %> 
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
        </main>
    </body>
</html>
<%} else {
        response.sendRedirect("../ImagenesC?btn=Imagenes&valor=activo");
    }
%>
