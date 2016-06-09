<%-- 
    Document   : edit
    Created on : 30/05/2016, 10:10:43 PM
    Author     : esteban
--%>
<%@page import="com.esteban.cmms.maven.controller.beans.Maquinas"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Secciones"%>
<%@page import="com.esteban.cmms.maven.controller.beans.TiposMaquinas"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Vendedores"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Vendedores> vendedores = (ArrayList<Vendedores>) session.getAttribute("vendedores");
    List<TiposMaquinas> tipos_maquinas = (ArrayList<TiposMaquinas>) session.getAttribute("tipos_maquinas");
    List<Proveedores> proveedores = (ArrayList<Proveedores>) session.getAttribute("proveedores");
    List<Secciones> secciones = (ArrayList<Secciones>) session.getAttribute("secciones");
    List<Maquinas> maquinas = (ArrayList<Maquinas>) session.getAttribute("maquinas");
    Maquinas maquina = (Maquinas) session.getAttribute("maquina");
    System.out.println("Secciones;" + secciones);
    System.out.println("tm;" + tipos_maquinas);
    System.out.println("pro;" + proveedores);
    System.out.println("maquinas;" + maquinas);
    System.out.println("vendedores;" + vendedores);
    if (vendedores == null || tipos_maquinas == null
            || proveedores == null || secciones == null || maquinas == null) {
        response.sendRedirect("../MaquinasC?btn=edit&id=" + maquina.getId() + "");
    } else {
%>
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
                <h2>Editar máquina</h2>
                <div>
                    <form method="GET" action="../MaquinasC">
                        <input class="form-control" type="date"     
                               name="f_compra" value="<%= maquina.getFchCompra()%>"/>
                    <input class="form-control" type="date"      
                           name="f_marcha" value="<%= maquina.getFchPuestaMarcha()%>"/>
                    <input class="form-control" type="text"     
                           name="fabricante" value="<%= maquina.getFabricante()%>"/>
                    <input class="form-control" type="text"     
                           name="modelo" value="<%= maquina.getModelo()%>"/>
                    <input class="form-control" type="text"    
                           name="codigo" value="<%= maquina.getCodigo()%>"/>
                    <input class="form-control" type="text"      
                           name="potencia" value="<%= maquina.getPotencia()%>"/>
                    <input class="form-control" type="text"     
                           name="serial" value="<%= maquina.getSerial()%>"/>
                    <input class="form-control" type="text"      
                           name="marca" value="<%= maquina.getMarca()%>"/>
                    <input class="form-control" type="text"     
                           name="c_energia" value="<%= maquina.getConsumoEnergia()%>"/>
                    <input class="form-control" type="text"     
                           name="peso" value="<%= maquina.getPeso()%>"/>
                    <input class="form-control" type="text"    
                           name="t_garantia" value="<%= maquina.getTiempoGarantia()%>"/>
                    <input class="form-control" type="text"      
                           name="t_vida" value="<%= maquina.getTiempoVida()%>"/>
                    <input class="form-control" type="date"    
                           name="v_garantia" value="<%= maquina.getVencimientoGarantia()%>"/>
                    <input class="form-control" type="date"      
                           name="v_vida" value="<%= maquina.getVencimientoVida()%>"/>
                    <select  name="vendedor" required="" class="form-control form-group">
                        <% for (Vendedores c : vendedores) {
                                out.print("<option value=" + c.getId() + ">" + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="proveedor" required="" class="form-control form-group">
                        <option value="<%= maquina.getProveedores().getId()%>"
                                selected=""><%= maquina.getProveedores().getNombreCompania()%></option>
                        <% for (Proveedores c : proveedores) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombreCompania() + "</option>");
                            }%>
                    </select>
                    <select  name="tipo_maquina" required="" class="form-control form-group">
                        <option value="<%= maquina.getTiposMaquinas().getId()%>"
                                selected=""><%= maquina.getTiposMaquinas().getNombre()%></option>
                        <% for (TiposMaquinas c : tipos_maquinas) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="seccion" required="" class="form-control form-group">
                        <option value="<%= maquina.getSecciones().getId()%>"
                                selected=""><%= maquina.getSecciones().getNombre()%></option>
                        <% for (Secciones c : secciones) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="maquina_padre" required="" class="form-control form-group">
                        <option value="<%= maquina.getMaquinas().getId()%>"
                                selected=""><%= maquina.getMaquinas().getModelo() %></option>
                        <% for (Maquinas c : maquinas) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getModelo() + "</option>");
                            }%>
                    </select>
                    <textarea class="form-control" name="descripcion">
<%= maquina.getDescripcion()%>
                    </textarea>
                    <textarea class="form-control" name="observacion">
<%= maquina.getObservacion()%>
                    </textarea>
                    <input type="hidden" value="edit" name="action"/>
                    <input type="hidden" value="<%= maquina.getId() %>" name="id"/>
                    <input class="btn btn-block btn-primary" type="submit"
                           name="btn" value="Guardar"/>
                </form>
            </div>
            <div>
                <input type="button" class="btn btn-default" onclick="location.href = 'index.jsp'"
                       name="btn" value="Atras"/>
            </div>
        </main>
    </body>
</html>
<%
        session.removeAttribute("vendedores");
        session.removeAttribute("tipos_maquinas");
        session.removeAttribute("proveedores");
        session.removeAttribute("secciones");
        session.removeAttribute("maquinas");

    }
%>

