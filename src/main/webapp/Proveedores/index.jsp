<%-- 
    Document   : indexProveedores
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Ciudades"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("Estoy en jsp");
    List<Proveedores> array = (ArrayList<Proveedores>) session.getAttribute("proveedores");
    System.out.println("Ya tomé el array");
%>
<%if (array != null) {
        System.out.println("Este es array: " + array);
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
            <script src="../assets/js/tables/proveedores.js"></script>
            <script>
                $(document).ready(function () {
                    /* Una vez que se cargo la pagina , llamo a todos los autocompletes y
                     * los inicializo */
                    $('.autocomplete').autocomplete();
                });
            </script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
            </header>
            <main>
                <h3>Lista de Proveedodes</h3>
                <div class="table-responsive">
                    <table class="table ">
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
                                <th colspan="2"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for (Proveedores a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombreCompania()%></td>
                            <td  class="text-center"><%= a.getTelefono()%></td>
                            <td  class="text-center"><%= a.getDireccion()%></td>
                            <td  class="text-center"><%= a.getCodigoPostal()%></td>
                            <td  class="text-center"><%= a.getEmail()%></td>
                            <td  class="text-center"><%= a.getPaginaWeb()%></td>
                                <td  class="text-center"><%= a.getCiudades().getNombre() + ", "
                                    + a.getCiudades().getDepartamentos().getNombre() + ", "
                                    + a.getCiudades().getDepartamentos().getPaises().getNombre()%></td>
                            <td  class="text-center"><%= a.getSaldoAdeudado()%></td>
                            <td  class="text-center"><%= a.getDescripcionProducto()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
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
                                       data-ciuid="<%= a.getCiudades().getId()%>"
                                       data-ciudad="<%= a.getCiudades().getNombre() + ", "
                                            + a.getCiudades().getDepartamentos().getNombre() + ", "
                                            + a.getCiudades().getDepartamentos().getPaises().getNombre()%>"
                                       data-deuda="<%= a.getSaldoAdeudado()%>" 
                                       data-descripcion="<%= a.getDescripcionProducto()%>"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmar(
                                                       'ProveedoresC', '<%=a.getId()%>',
                                                       'Inactivo', '<%= a.getNombreCompania()%>',
                                                       '<%= a.getTelefono()%>', '<%= a.getDireccion()%>',
                                                       '<%= a.getCodigoPostal()%>', '<%= a.getEmail()%>',
                                                       '<%= a.getPaginaWeb()%>', '<%= a.getCiudades().getId()%>',
                                                       '<%= a.getSaldoAdeudado()%>', '<%= a.getDescripcionProducto()%>')" value="Desactivar"/>
                            </td>
                        </tr>
                        <%}
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
                                    <input class="form-control" type="text" name="compania" id="compania" value=""/>
                                    <input class="form-control" type="text" name="telefono" id="telefono" value=""/>
                                    <input class="form-control" type="text" name="direccion" id="direccion" value=""/>
                                    <input class="form-control" type="text" name="c_postal" id="c_postal" value=""/>
                                    <input class="form-control" type="email" name="email" id="email" value=""/>
                                    <input class="form-control" type="url" name="p_web" id="p_web" value=""/>
                                    <select  name="ciudad" required="" class="form-control form-group">
                                        <option id="ciuid" selected></option>
                                        <% /*for (Ciudades c : ciudades) {
                                                out.print("<option value=" + c.getId() + ">"
                                                        + c.getNombre() + ", "
                                                        + c.getDepartamentos().getNombre() + ", "
                                                        + c.getDepartamentos().getPaises().getNombre() + "</option>");
                                            }*/
                                        %>
                                    </select>
                                    <input class="form-control" type="text" name="deuda" id="deuda" value=""/>
                                    <textarea class="form-control" name="descripcion" id="descripcion">
                                        
                                    </textarea>
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
                                <h4 class="modal-title">Nuevo proveedor</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-group" action="../Proveedo">
                                    <input class="form-control" type="text" name="compania" placeholder="Compañia"/>
                                    <input class="form-control" type="tel" name="telefono" placeholder="Teléfono"/>
                                    <input class="form-control" type="text" name="direccion" placeholder="Dirección"/>
                                    <input class="form-control" type="text" name="c_postal" placeholder="Código postal"/>
                                    <input class="form-control" type="email" name="email" placeholder="Correo electrónico"/>
                                    <input class="form-control" type="url" name="p_web" placeholder="Página web"/>
                                    <div class="autocomplete">
                                        <input  type="text" name="ciudad" value="" class="form-control" placeholder="Ciudad"
                                                data-source="../ProveedoresC?btn=ciudad&search=" />
                                    </div>
                                    <input class="form-control" type="text" name="deuda" placeholder="Saldo Adeudado"/>
                                    <textarea class="form-control" name="descripcion">
                                    </textarea>
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" 
                                               name="btn" value="Guardar"/>
                                        <input type="button" class="btn btn-default" 
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
                <input type="text" class="btn btn-default" data-toggle="modal" data-target="#new"
                       name="btn" value="Nuevo"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../index.jsp'"
                       name="btn" value="Inicio"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../ProveedoresC?valor=inactivo&btn=Proveedores'"
                       name="btn" value="Ver inactivos"/>
            </div>
            <%
                session.removeAttribute("proveedores");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
        response.sendRedirect("../ProveedoresC?btn=Proveedores&valor=activo");
    }
%>
