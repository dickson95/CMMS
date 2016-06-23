<%-- 
    Document   : indexVendedores
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Vendedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        String rol = sesion.getRoles().getRol();
        List<Vendedores> array = (ArrayList<Vendedores>) session.getAttribute("vendedores");
        List<Proveedores> proveedores = (ArrayList<Proveedores>) session.getAttribute("proveedores");
        if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
            <script src="../assets/js/tables/vendedores.js"></script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
        </header>
        <main>
            <% if (!rol.equalsIgnoreCase("produccion") 
                            && !rol.equalsIgnoreCase("tmantenimiento")) { %>
            <h3>Lista de Vendedores</h3>
            <div class="table-responsive">
                <table class="table ">
                    <thead>
                        <tr>
                            <th class="text-center">Vendedor</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Empresa</th>
                            <th class="text-center">Código</th>
                            <th class="text-center">Estado del registro</th>
                            <th class="text-center">Ultima modificación</th>
                            <th class="text-center">Modificado por</th>
                            <th colspan="2"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Vendedores a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombre()%></td>
                            <td  class="text-center"><%= a.getEmail()%></td>
                            <td  class="text-center"><%= a.getProveedores().getNombreCompania()%></td>
                            <td  class="text-center"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <td  class="text-center">
                                <input class="open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" 
                                       data-id="<%=a.getId()%>" 
                                       data-nombre="<%= a.getNombre()%>" 
                                       data-email="<%= a.getEmail()%>" 
                                       data-proid="<%= a.getProveedores().getId()%>"
                                       data-proveedor="<%= a.getProveedores().getNombreCompania()%>"
                                       data-codigo="<%= a.getCodigo()%>" 
                                       data-estado="<%= a.getEstado()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmar(
                                                       'VendedoresC', '<%=a.getId()%>',
                                                       '<%= a.getNombre()%>', '<%= a.getEmail()%>',
                                                       '<%= a.getProveedores().getId()%>',
                                                       '<%= a.getCodigo()%>', 'Inactivo')"
                                       value="Desactivar"/>
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
                                <h4 class="modal-title">Editar vendedor</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../VendedoresC">
                                    <input class="form-control" type="hidden" name="id" id="id" value=""/>
                                    <input class="form-control" type="text" name="nombre" id="nombre" value=""/>
                                    <input class="form-control" type="email" name="email" id="email" value=""/>
                                    <select  name="proveedor" required="" class="form-control form-group">
                                        <option id="proid" selected></option>
                                        <% for (Proveedores p : proveedores) {
                                                out.print("<option value=" + p.getId() + ">"
                                                        + p.getNombreCompania() + "</option>");
                                            }%>
                                    </select>
                                    <input class="form-control" type="text" name="codigo" id="codigo" value=""/>
                                    <input class="form-control" type="hidden" name="estado" id="estado" value=""/>
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
                                <h4 class="modal-title">Nuevo vendedor</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../VendedoresC">
                                    <input class="form-control" type="text" name="nombre"  placeholder="Nombre"/>
                                    <input class="form-control" type="email" name="email" placeholder="Correo electrónico"/>
                                    Provedor<br>
                                    <select  name="proveedor" required="" class="form-control form-group">
                                        <option id="ciuid" selected></option>
                                        <% for (Proveedores p : proveedores) {
                                                out.print("<option value=" + p.getId() + ">"
                                                        + p.getNombreCompania() + "</option>");
                                            }%>
                                    </select>
                                    <input class="form-control" type="text" name="codigo" placeholder="Código de vendedor"/>
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
                <input type="text" class="btn btn-default" onclick="location.href = '../VendedoresC?valor=inactivo&btn=Vendedores'"
                       name="btn" value="Ver inactivos"/>
            </div>
            <%
                }else {
                    out.print("<h1>Lo sentimos. La página que busca no se pudo hallar.</h1>");
                }
                session.removeAttribute("vendedores");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
            response.sendRedirect("../VendedoresC?btn=Vendedores&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
