<%-- 
    Document   : LocalizacionesArchivadas
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

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
        System.out.println("Este es array: " + array);
        if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Imagenes archivadas"/>
        </jsp:include>
        <script src="../assets/js/tables/imagenes.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"/>
            </jsp:include>
        </header>
        <main class="container">
            <h3>Lista de Imagenes</h3>
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
                            <td>
                                <input class="btn btn-danger" type="button" name="btn"
                                       onclick="confirmacion('ImagenesC', '<%=a.getId()%>',
                                                       'Activo', this)"
                                       value="Activar" />
                            </td>
                        </tr>
                        <%}%>
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
            session.removeAttribute("imagenes");
            session.removeAttribute("maquinas");
        } else {
            response.sendRedirect("../ImagenesC?btn=Imagenes&valor=inactivo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
