<%-- 
    Document   : indexTipos
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.TiposMaquinas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<TiposMaquinas> ti = (ArrayList<TiposMaquinas>) session.getAttribute("tipos");%>
<%if (ti != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        <script src="../assets/js/tables/tiposMaquinas.js"></script>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
            </header>
            <main>
                <h3>Lista de Tipos no Activos</h3>
                <div class="table-responsive">
                    <table class="table  table-hover">
                        <thead>
                        <th class="text-center">
                            Nombre
                        </th>
                        <th class="text-center">Estado de registro</th>
                        <th class="text-center">Ultima modificación</th>
                        <th class="text-center">Usuario</th>
                        <th class="text-center">
                            Acciones
                        </th>
                        </thead>
                        <tbody>
                        <%for (TiposMaquinas t : ti) {%>
                        <tr>
                            <td  class="text-left"><%= t.getNombre()%></td>
                            <td  class="text-center"><%= t.getEstado()%></td>
                            <td  class="text-center"><%= t.getFchUltAction()%></td>
                            <td  class="text-center"><%= t.getUserAction()%></td>
                            <td  class="text-center">
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion('TiposMaquinasC',
                                                       '<%=t.getId()%>', '<%= t.getNombre()%>', 'Activo')" value="Activar"/>
                            </td>
                        </tr>
                        <%}
                            session.removeAttribute("tipos");
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
        response.sendRedirect("../TiposMaquinasC?btn=Tipos&valor=inactivo");
    }%>
