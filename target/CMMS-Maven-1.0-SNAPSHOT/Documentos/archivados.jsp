<%-- 
    Document   : LocalizacionesArchivadas
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>
<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Localizaciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<Localizaciones> array = (ArrayList<Localizaciones>) session.getAttribute("localizaciones");
        System.out.println("Este es array: " + array);
%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/localizaciones.js"></script>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"></jsp:param>
            </jsp:include>
            </header>
            <main>
                <h3>Documentos archivados</h3>
                <div class="table-responsive">
                    <table class="table  table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Codigo</th>
                                <th class="text-center">Estado de registro</th>
                                <th class="text-center">Ultima modificación</th>
                                <th class="text-center">Usuario</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for (Localizaciones a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getNombre()%></td>
                            <td  class="text-center"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <td  class="text-center">
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="desactivar('LocalizacionesC', '<%=a.getId()%>',
                                                       '<%= a.getNombre()%>', '<%= a.getCodigo()%>', 'Activo')" value="Activar"/>
                            </td>
                        </tr>
                        <%}
                            session.removeAttribute("localizaciones");
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
            response.sendRedirect("../LocalizacionesC?btn=Localizaciones&valor=inactivo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
