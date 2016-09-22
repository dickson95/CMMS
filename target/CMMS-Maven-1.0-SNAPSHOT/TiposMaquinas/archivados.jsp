<%-- 
    Document   : indexTipos
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.TiposMaquinas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<TiposMaquinas> ti = (ArrayList<TiposMaquinas>) session.getAttribute("tipos");

        if (ti != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp"/>
        <script src="../assets/js/tables/tiposMaquinas.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"/>
            </jsp:include>
        </header>
        <main class="container">
            <h3>Lista de Tipos no Activos</h3>
            <div class="table-responsive">
                <table class="table  table-hover tablas">
                    <thead>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Estado de registro</th>
                    <th class="text-center">Ultima modificación</th>
                    <th class="text-center">Usuario</th>
                    <th></th>
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
                                                       '<%=t.getId()%>', '<%= t.getNombre()%>', 'Activo', this)" value="Activar"/>
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
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%
        } else {
            response.sendRedirect("../TiposMaquinasC?btn=Tipos&valor=inactivo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
