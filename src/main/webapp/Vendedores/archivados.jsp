<%-- 
    Document   : ProveedoresArchivados
    Created on : 7/04/2016, 11:38:41 PM 
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Vendedores"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Vendedores> array = (ArrayList<Vendedores>) session.getAttribute("vendedores");
    System.out.println("Este es array: " + array);
%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
            <script src="../assets/js/tables/vendedores.js"></script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
            </header>
            <main>
            <h3>Lista de Vendedores no Activos</h3>
            <div class="table-responsive">
                <table class="table  table-hover">
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
                        <td>
                            <input class="btn btn-danger" type="button" name="btn" 
                                   onclick="confirmar(
                                                   'VendedoresC', '<%=a.getId()%>',
                                                   '<%= a.getNombre()%>', '<%= a.getEmail()%>',
                                                   '<%= a.getProveedores().getId()%>',
                                                   '<%= a.getCodigo()%>', 'Activo')"
                                   value="Activar"/>
                        </td>
                    </tr>
                    <%}
                        session.removeAttribute("vendedores");
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
        response.sendRedirect("../VendedoresC?btn=Vendedores&valor=inactivo");
    }%>
