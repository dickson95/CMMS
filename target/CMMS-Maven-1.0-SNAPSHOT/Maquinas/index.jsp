<%-- 
    Document   : indexMaquinas
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Localizaciones"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Maquinas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        String rol = sesion.getRoles().getRol();
        List<Maquinas> array = (ArrayList<Maquinas>) session.getAttribute("maquinas");
%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Maquinas"></jsp:param>
        </jsp:include>
        <script src="../assets/js/tables/maquinas.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=rol%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <div class="row">
                <h3 class="col-md-6">Máquinas</h3>
                <!--Botones generales-->
                <div class="text-right col-md-6">
                    <% if (!rol.equalsIgnoreCase("produccion")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../MaquinasC?btn=new'">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                    <% if (rol.equalsIgnoreCase("administrador")) {%>
                    <button type="button" class="btn btn-default" aria-label="Left Align" 
                            onclick="location.href = '../MaquinasC?valor=inactivo&btn=Maquinas'">
                        <span class="glyphicon glyphicon-folder-close"></span>
                    </button>
                    <%
                            }
                        }
                    %>
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
                            <th class="text-center">Código</th>
                            <th class="text-center">Fabricante</th>
                            <th class="text-center">Marca</th>
                            <th class="text-center">Modelo</th>
                            <th class="text-center">Descripción</th>
                            <th class="text-center">Tiempo de garantía</th>
                            <th class="text-center">Empresar proveedora</th>
                            <th class="text-center">Tipo de máquina</th>
                            <th class="text-center">Secciones</th>
                            <th class="text-center">Última modificación</th>
                            <th class="text-center">Modificado por</th>
                                <% if (!rol.equalsIgnoreCase("produccion")) {%>
                            <th></th>
                            <th></th>
                                <% }  %>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Maquinas a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getFabricante()%></td>
                            <td  class="text-center"><%= a.getMarca()%></td>
                            <td  class="text-center"><%= a.getModelo()%></td>
                            <td  class="text-center"><%= a.getDescripcion()%></td>
                            <td  class="text-center"><%=" Hasta el " + a.getVencimientoGarantia()%></td>
                            <td  class="text-center"><%= a.getProveedores().getNombreCompania()%></td>
                            <td  class="text-center"><%= a.getTiposMaquinas().getNombre()%></td>
                            <td  class="text-center"><%= a.getSecciones().getNombre()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <% if (!rol.equalsIgnoreCase("produccion")) {%>
                            <td  class="text-center">
                                <input class="open-Modal btn btn-primary" type="button" 
                                       name="btn" value="Editar" onclick="location.
                                                       href = '../MaquinasC?btn=edit&id=<%= a.getId()%>'"/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion(
                                                       'MaquinasC',
                                                       '<%= a.getId()%>',
                                                       'Inactivo',
                                                       this
                                                       )" value="Eliminar"/>
                            </td>
                            <% }  %>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>

            </div>
            <%
                session.removeAttribute("maquinas");
            %>
            <jsp:include page="../layouts/footer.jsp"/>
        </main>
    </body>
</html>
<%} else {
            response.sendRedirect("../MaquinasC?btn=Maquinas&valor=activo");
        }
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
