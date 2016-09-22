<%-- 
    Document   : indexProveedores
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Ciudades"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        String rol = sesion.getRoles().getRol();
        List<Proveedores> array = (ArrayList<Proveedores>) session.getAttribute("proveedores");

        if (array != null) {
            System.out.println("Proveedores");
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Proveedores"/>
        </jsp:include>
        <script src="../assets/js/tables/proveedores.js"></script>
        <style>
            ul.ui-autocomplete{
                z-index: 1100;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <% if (!rol.equalsIgnoreCase("produccion")
                        && !rol.equalsIgnoreCase("tmantenimiento")) { %>
            <div class="row">
                <h3 class="col-md-6">Proveedores</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <% if (!rol.equalsIgnoreCase("matenimiento")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            data-toggle="modal" data-target="#new">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                    <% } %>
                    <% if (rol.equalsIgnoreCase("administrador")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../ProveedoresC?valor=inactivo&btn=Proveedores'">
                        <span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>
                    </button>
                    <% } %>
                    <% if (!rol.equalsIgnoreCase("matenimiento")) { %>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../index.jsp'">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                    </button>
                    <% } %>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table tablas">
                    <thead>
                        <tr>
                            <th class="text-center">Compañia</th>
                            <th class="text-center">Teléfono</th>
                            <th class="text-center">Dirección</th>
                            <th class="text-center">Código postal</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Pagina web</th>
                            <th class="text-center">Ciudad</th>
                            <th class="text-center">Saldo Adeudado</th>
                            <th class="text-center">Descripción del producto</th>
                            <th class="text-center">Estado del registro</th>
                            <th class="text-center">Ultima modificación</th>
                            <th class="text-center">Modificado por</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (Proveedores a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombreCompania()%></td>
                            <td  class="text-center"><%= a.getTelefono()%></td>
                            <td  class="text-center"><%= a.getDireccion()%></td>
                            <td  class="text-center"><%= a.getCodigoPostal()%></td>
                            <td  class="text-center"><%= a.getEmail()%></td>
                            <td  class="text-center"><%= a.getPaginaWeb()%></td>
                            <td  class="text-center"><%= a.getCiudades().getCiudad() + ", "
                                    + a.getCiudades().getPaises().getPais()%></td>
                            <td  class="text-center"><%= a.getSaldoAdeudado()%></td>
                            <td  class="text-center"><%= a.getDescripcionProducto()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <% if (!rol.equalsIgnoreCase("matenimiento")) {%>
                            <td  class="text-center">
                                <input class="open-Modal btn btn-primary" type="button" 
                                       data-toggle="modal" data-target="#edit"
                                       name="btn" value="Editar" 
                                       data-id="<%=a.getId()%>" 
                                       data-estado="<%= a.getEstado()%>" 
                                       data-compania="<%= a.getNombreCompania()%>" 
                                       data-telefono="<%= a.getTelefono()%>"
                                       data-direccion="<%= a.getDireccion()%>"
                                       data-c_postal="<%= a.getCodigoPostal()%>" 
                                       data-email="<%= a.getEmail()%>" 
                                       data-p_web="<%= a.getPaginaWeb()%>"
                                       data-ciudad="<%= a.getCiudades().getCiudad() + ", "
                                               + a.getCiudades().getPaises().getPais() + ", "
                                               + a.getCiudades().getPaises().getCodigo() + ""%>"
                                       data-deuda="<%= a.getSaldoAdeudado()%>" 
                                       data-descripcion="<%= a.getDescripcionProducto()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion(
                                                       'ProveedoresC', '<%=a.getId()%>',
                                                       'Inactivo', this)" value="Eliminar"/>
                            </td>
                            <% } %>
                        </tr>
                        <%
                            }
                            session.removeAttribute("proveedores");
                        %>
                    </tbody>
                </table>
                <!-- Modal editar-->
                <div class="modal fade" id="edit" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Editar proveedor</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../ProveedoresC">
                                    <input class="form-control" type="hidden" name="id" id="id" value=""/>
                                    <input class="form-control" type="hidden" name="estado" id="estado" value=""/>
                                    <div>
                                        <label>Compañia&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="compania" id="compania" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <div>
                                        <label>Teléfono&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="telefono" id="telefono" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <label>Dirección&nbsp;<span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="direccion" id="direccion" value=""/>
                                    <label>Código postal&nbsp;<span class="text-danger">*</span></label>
                                    <input class="form-control" type="text" name="c_postal" id="c_postal" value=""/>
                                    <div>
                                        <label>Correo electrónico&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control" type="email" name="email" id="email" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <label>Página web&nbsp;<span class="text-danger">*</span></label>
                                    <input class="form-control" type="url" name="p_web" id="p_web" value=""/>
                                    <label>Ciudad&nbsp;<span class="text-danger">*</span></label>
                                    <div class="ui-widget">
                                        <div>
                                            <input  id="cityedit" type="text" name="ciudad" value="" 
                                                    class="form-control" placeholder="Ciudad"
                                                    autocomplete="off"/>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div>
                                        <label>Saldo adeudado&nbsp;<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="deuda" id="deuda" value=""/>
                                        <span class="help-block"></span>
                                    </div>
                                    <label>Descripción de productos</label>
                                    <textarea class="form-control" name="descripcion" id="descripcion">
                                    </textarea>
                                    <div class="modal-footer">
                                        <label class="text-danger pull-left">* Campos obligatorios</label>
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
                                <h4 class="modal-title">Nuevo proveedor</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../ProveedoresC">
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control form-group" type="text" id="companew"
                                               name="compania" placeholder="Compañia"/>

                                        <span class="help-block"></span>
                                    </div>
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control form-group" type="tel" id="telnew"
                                               name="telefono" placeholder="Teléfono"/>
                                        <span class="help-block"></span>
                                    </div>
                                    <input class="form-control form-group" type="text" 
                                           name="direccion" placeholder="Dirección"/>
                                    <input class="form-control form-group" type="text" 
                                           name="c_postal" placeholder="Código postal"/>
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control form-group" type="email" id="emailnew"
                                               name="email" placeholder="Correo electrónico"/>
                                        <span class="help-block"></span>
                                    </div>
                                    <input class="form-control form-group" type="url" 
                                           name="p_web" placeholder="Página web"/>
                                    <span class="text-danger">*</span>
                                    <div class="ui-widget">
                                        <div>
                                            <input  id="city" type="text" name="ciudad" value="" 
                                                    class="form-control" placeholder="Ciudad"
                                                    autocomplete="off"/>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <span class="text-danger">*</span>
                                    <div>
                                        <input class="form-control" type="text" id="saldnew"
                                               name="deuda" placeholder="Saldo Adeudado"/>
                                        <span class="help-block"></span>
                                    </div>
                                    <label>Descripcion</label>
                                    <textarea class="form-control" name="descripcion">
                                    </textarea>
                                    <div class="modal-footer">
                                        <label class="text-danger pull-left">* Campos obligatorios</label>
                                        <input class="btn btn-primary" id="btnnew"
                                               type="submit" name="btn" value="Guardar"/>
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
                } else {
                    out.print("<h1>Lo sentimos. La página que busca no se pudo hallar.</h1>");
                }
                session.removeAttribute("proveedores");
            %>
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%
        } else {
            response.sendRedirect("../ProveedoresC?btn=Proveedores&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
