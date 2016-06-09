<%-- 
    Document   : new
    Created on : 27/05/2016, 12:55:53 PM
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
    System.out.println("Secciones;" + secciones);
    if (vendedores==null || tipos_maquinas==null
            || proveedores==null || secciones==null || maquinas==null) {
        response.sendRedirect("../MaquinasC?btn=new");
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
                <h2>Nueva máquina</h2>
                <div>
                    <form method="GET" action="../MaquinasC">
                        <input class="form-control" type="date"     
                               name="f_compra"/>
                        <input class="form-control" type="date"      
                               name="f_marcha"/>
                        <input class="form-control" type="text"     
                               name="fabricante" placeholder="fabricante"/>
                        <input class="form-control" type="text"     
                               name="modelo" placeholder="modelo"/>
                        <input class="form-control" type="text"    
                               name="codigo" placeholder="codigo"/>
                        <input class="form-control" type="text"      
                               name="potencia" placeholder="potencia"/>
                        <input class="form-control" type="text"     
                               name="serial" placeholder="serial"/>
                        <input class="form-control" type="text"      
                               name="marca" placeholder="marca"/>
                        <input class="form-control" type="text"     
                               name="c_energia" placeholder="c_energia"/>
                        <input class="form-control" type="number"     
                               name="peso" placeholder="peso"/>
                        <input class="form-control" type="number"    
                               name="t_garantia" placeholder="timepo garantia"/>
                        <input class="form-control" type="number"      
                               name="t_vida" placeholder="timepo vida"/>
                        <input class="form-control" type="date"    
                               name="v_garantia"/>
                        <input class="form-control" type="date"      
                               name="v_vida"/>
                        <select  name="vendedor" required="" class="form-control form-group">
                        <% for (Vendedores c : vendedores) {
                                out.print("<option value=" + c.getId() + ">" + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="proveedor" required="" class="form-control form-group">
                        <% for (Proveedores c : proveedores) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombreCompania() + "</option>");
                            }%>
                    </select>
                    <select  name="tipo_maquina" required="" class="form-control form-group">
                        <% for (TiposMaquinas c : tipos_maquinas) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="seccion" required="" class="form-control form-group">

                        <% for (Secciones c : secciones) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getNombre() + "</option>");
                            }%>
                    </select>
                    <select  name="maquina_padre" required="" class="form-control form-group">

                        <% for (Maquinas c : maquinas) {
                                out.print("<option value=" + c.getId() + ">"
                                        + c.getModelo() + "</option>");
                            }%>
                    </select>
                    <textarea class="form-control" name="descripcion">
                    </textarea>
                    <textarea class="form-control" name="observacion">
                    </textarea>
                    <input type="hidden" value="new" name="action"/>
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
