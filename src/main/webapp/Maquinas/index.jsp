<%-- 
    Document   : indexMaquinas
    Created on : 7/04/2016, 11:38:41 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Localizaciones"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Maquinas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Maquinas> array = (ArrayList<Maquinas>) session.getAttribute("maquinas");
%>
<%if (array != null) {%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <jsp:include page="../layouts/aplication.jsp"></jsp:include>
        <script src="../assets/js/tables/maquinas.js"></script>
    </head>
    <body>
        <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
        </header>
        <main>
            <h3>Lista de Maquinas</h3>
            <div class="table-responsive">
                <table class="table ">
                    <thead>
                        <tr>
                            <th class="text-center">Código</th>
                            <th class="text-center">Consumo de energía</th>
                            <th class="text-center">Fabricante</th>
                            <th class="text-center">Marca</th>
                            <th class="text-center">Modelo</th>
                            <th class="text-center">Potencia</th>
                            <th class="text-center">Serial</th>
                            <th class="text-center">Descripción</th>
                            <th class="text-center">Observación</th>
                            <th class="text-center">Fecha de compra</th>
                            <th class="text-center">Día de inicio</th>
                            <th class="text-center">Peso</th>
                            <th class="text-center">Tiempo de garantía</th>
                            <th class="text-center">Tiempo de vida</th>
                            <th class="text-center">Empresar proveedora</th>
                            <th class="text-center">Vendedor</th>
                            <th class="text-center">Tipo de máquina</th>
                            <th class="text-center">Secciones</th>
                            <th class="text-center">Maquina padre</th>
                            <th class="text-center">Estado de registro</th>
                            <th class="text-center">Última modificación</th>
                            <th class="text-center">Modificado por</th>
                            <th colspan="2"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Maquinas a : array) {%>
                        <tr>
                            <td  class="text-left"><%= a.getCodigo()%></td>
                            <td  class="text-center"><%= a.getConsumoEnergia()%></td>
                            <td  class="text-center"><%= a.getFabricante()%></td>
                            <td  class="text-center"><%= a.getMarca()%></td>
                            <td  class="text-center"><%= a.getModelo()%></td>
                            <td  class="text-center"><%= a.getPotencia()%></td>
                            <td  class="text-center"><%= a.getSerial()%></td>
                            <td  class="text-center"><%= a.getDescripcion()%></td>
                            <td  class="text-center"><%= a.getObservacion()%></td>
                            <td  class="text-center"><%= a.getFchCompra()%></td>
                            <td  class="text-center"><%= a.getFchPuestaMarcha()%></td>
                            <td  class="text-center"><%= a.getPeso()%></td>
                            <td  class="text-center"><%= a.getTiempoGarantia() + ""
                                    + " Hasta el " + a.getVencimientoGarantia()%></td>
                            <td  class="text-center"><%= a.getTiempoVida() + ""
                                    + " Hasta el " + a.getVencimientoVida()%></td>
                            <td  class="text-center"><%= a.getProveedores().getNombreCompania()%></td>
                            <td  class="text-center"><%= a.getVendedores().getNombre()%></td>
                            <td  class="text-center"><%= a.getTiposMaquinas().getNombre()%></td>
                            <td  class="text-center"><%= a.getSecciones().getNombre()%></td>
                            <% if(a.getMaquinas()==null){%>
                                <td  class="text-center">Sin máquina padre</td>
                            <%}else{%>
                                <td  class="text-center"><%= a.getMaquinas().getModelo() %></td>
                            <%}%>
                            <td  class="text-center"><%= a.getEstado()%></td>
                            <td  class="text-center"><%= a.getFchUltAction()%></td>
                            <td  class="text-center"><%= a.getUserAction()%></td>
                            <td  class="text-center">
                                <input class="open-Modal btn btn-primary" type="button" 
                                    name="btn" value="Editar" onclick="location.
                                    href='../MaquinasC?btn=edit&id=<%= a.getId() %>' "/>
                            </td>
                            <td>
                                <input class="btn btn-danger" type="button" name="btn" 
                                       onclick="confirmacion('MaquinasC', '<%=a.getId()%>',
                                                       '<%= a.getCodigo()%>', '<%= a.getConsumoEnergia()%>',
                                                       '<%= a.getSerial()%>',
                                                       'Inactivo')" value="Desactivar"/>
                            </td>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>

            </div>
            <!--Botones generales-->
            <div class="text-center">
                <input type="text" class="btn btn-default" onclick="location.href='../MaquinasC?btn=new'"
                       name="btn" value="Nuevo"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../index.jsp'"
                       name="btn" value="Inicio"/>&nbsp;|
                <input type="text" class="btn btn-default" onclick="location.href = '../MaquinasC?valor=inactivo&btn=Maquinas'"
                       name="btn" value="Ver inactivos"/>
            </div>
            <%
                session.removeAttribute("maquinas");
            %>
            <jsp:include page="../layouts/footer.jsp"></jsp:include>
        </main>
    </body>
</html>
<%} else {
        response.sendRedirect("../MaquinasC?btn=Maquinas&valor=activo");
    }
%>
