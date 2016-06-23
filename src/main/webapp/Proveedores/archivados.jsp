<%-- 
    Document   : ProveedoresArchivados
    Created on : 7/04/2016, 11:38:41 PM 
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<Proveedores> array = (ArrayList<Proveedores>) session.getAttribute("proveedores");%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
            <script src="../assets/js/tables/proveedores.js"></script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"></jsp:param>
            </jsp:include>
        </header>
        <main>
            <h3>Lista de Proveedores no Activos</h3>
            <div class="table-responsive">
                <table class="table  table-hover">
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
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmar(
                                                       'ProveedoresC', '<%=a.getId()%>',
                                                       'Activo', '<%= a.getNombreCompania()%>',
                                                       '<%= a.getTelefono()%>', '<%= a.getDireccion()%>',
                                                       '<%= a.getCodigoPostal()%>', '<%= a.getEmail()%>',
                                                       '<%= a.getPaginaWeb()%>', '<%= a.getCiudades().getId()%>',
                                                       '<%= a.getSaldoAdeudado()%>', '<%= a.getDescripcionProducto()%>')" 
                                       value="Activar"/>
                            </td>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>
            </div>
            <div class="text-center">
                <input type="text" class="btn btn-default" onclick="location.href = 'index.jsp'"
                       name="btn" value="Atras"/>
            </div>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
            </main>
        </body>
    </html>
<%} else {
            response.sendRedirect("../ProveedoresC?btn=Proveedores&valor=inactivo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
