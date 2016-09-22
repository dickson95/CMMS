<%-- 
    Document   : indexImagenes
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Maquinas"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Imagenes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<Imagenes> array = (ArrayList<Imagenes>) session.getAttribute("imagenes");
        List<Maquinas> maquinas = (ArrayList<Maquinas>) session.getAttribute("maquinas");
        System.out.println("imágenes" + array);
        if (array != null) { 
            String rol = sesion.getRoles().getRol();
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Imagenes"/>
        </jsp:include>
        <script src="../assets/js/tables/imagenes.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <div class="row">
                <h3 class="col-md-6">Imágenes</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            data-toggle="modal" data-target="#new">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                    <% if (rol.equalsIgnoreCase("administrador")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../ImagenesC?valor=inactivo&btn=Imagenes'">
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
                            <th class="text-center">Imagen</th>
                            <th class="text-center">Maquina</th>
                            <th class="text-center">Estado de registro</th>
                            <th class="text-center">Ultima modificación</th>
                            <th class="text-center">Usuario</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Imagenes a : array) {%>
                        <tr>
                            <td class="text-left col-md-1"><img class="img-responsive" src="images_cli/<%= a.getImagen()%>" alt="Maquina"></td>
                            <td class="text-center"><%= a.getMaquinas().getMarca()%></td>
                            <td class="text-center"><%= a.getEstado()%></td>
                            <td class="text-center"><%= a.getFchUltAction()%></td>
                            <td class="text-center"><%= a.getUserAction()%></td>
                            <td class="text-center">
                                <input
                                    class=" open-Modal btn btn-primary" type="button"
                                    data-toggle="modal" data-target="#edit" name="btn" value="Editar"
                                    data-id="<%=a.getId()%>" 
                                    data-imagen="<%= a.getImagen()%>"
                                    data-estado="<%= a.getEstado()%>"
                                    data-maquina="<%= a.getMaquinas().getMarca()%>"
                                    data-maqid="<%= a.getMaquinas().getId()%>"
                                    />
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn"
                                       onclick="confirmacion('ImagenesC', '<%=a.getId()%>',
                                                       'Inactivo', this)"
                                       value="Eliminar" />
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <!-- Modal editar-->
            <div class="modal fade" id="edit" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Editar imagen</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-group" action="../ImagenesC" enctype="multipart/form-data" method="POST">
                                <input type="hidden" name="id" id="id" value="" /> 
                                <input type="hidden" name="imagen-v" id="imagen" value=""/>
                                <label>Imagen&nbsp;<span class="text-danger">*</span></label>
                                <input class="form-control" required="" type="file" name="imagen"/>
                                <label>Máquina&nbsp;<span class="text-danger">*</span></label>
                                <select  name="maquina" required="" class="form-control form-group">
                                    <option id="maqid" value="" selected=""></option>
                                    <% for (Maquinas c : maquinas) {
                                            out.print("<option value=" + c.getId() + ">"
                                                    + c.getTiposMaquinas().getNombre()+"-"+c.getCodigo() + "</option>");
                                        }%>
                                </select>
                                <input type="hidden" name="estado" id="estado" value="" />
                                <div class="modal-footer">
                                    <label class="text-danger pull-left">* Campos obligatorios</label>
                                     <input type="button"
                                           class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                    <input class="btn btn-primary" type="submit" name="btn"
                                           value="Actualizar" /> 
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
                            <form class="form-group" action="../ImagenesC" 
                                  enctype="multipart/form-data" method="POST">
                                <label>Imagen&nbsp;<span class="text-danger">*</span></label>
                                <input class="form-control" required="" type="file" name="imagen"/> 
                                <label>Máquina&nbsp;<span class="text-danger">*</span></label>
                                <select  name="maquina" required="" class="form-control form-group">
                                    <% for (Maquinas c : maquinas) {
                                            out.print("<option value=" + c.getId() + ">"
                                                    + c.getTiposMaquinas().getNombre()+"-"+c.getCodigo() + "</option>");
                                        }%>
                                </select>
                                <div class="modal-footer">
                                    <label class="text-danger pull-left">* Campos obligatorios</label>
                                    <input type="button" class="btn btn-default"
                                           data-dismiss="modal" value="Cancelar">
                                    <input class="btn btn-primary" type="submit" name="btn"
                                           value="Guardar" />
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <%
                session.removeAttribute("imagenes");
                session.removeAttribute("maquinas");
            %> 
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%
        } else {
            response.sendRedirect("../ImagenesC?btn=Imagenes&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
