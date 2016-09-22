<%-- 
    Document   : new
    Created on : 27/05/2016, 12:55:53 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Maquinas"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Secciones"%>
<%@page import="com.esteban.cmms.maven.controller.beans.TiposMaquinas"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Proveedores"%>
<%@page import="com.esteban.cmms.maven.controller.beans.Vendedores"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Object s = session.getAttribute("usuario");
    System.out.println("ya tome el usuario" + s);
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        List<Vendedores> vendedores = (ArrayList<Vendedores>) session.getAttribute("vendedores");
        List<TiposMaquinas> tipos_maquinas = (ArrayList<TiposMaquinas>) session.getAttribute("tipos_maquinas");
        List<Proveedores> proveedores = (ArrayList<Proveedores>) session.getAttribute("proveedores");
        List<Secciones> secciones = (ArrayList<Secciones>) session.getAttribute("secciones");
        List<Maquinas> maquinas = (ArrayList<Maquinas>) session.getAttribute("maquinas");
        System.out.println("Secciones;" + secciones);
        if (vendedores == null || tipos_maquinas == null
                || proveedores == null || secciones == null || maquinas == null) {
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
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <div class="text-center">
                <h2>Nueva máquina</h2>
            </div>
            <div class="container panel panel-body panel-default">
                <form method="GET" action="../MaquinasC">
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha de compra&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="date"     
                                   name="f_compra" required=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha de puesta en marcha&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="date"      
                                   name="f_marcha" required=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fabricante</label>
                            <input class="form-control form-group" type="text"     
                                   name="fabricante" placeholder="Fabricante" value=" "/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Modelo&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="text"     
                                   name="modelo" placeholder="Modelo" required=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Código de inventario&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="text"  required=""  
                                   name="codigo" placeholder="Codigo de inventario"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Potencia</label>
                            <input class="form-control form-group" type="text"      
                                   name="potencia" placeholder="Potencia" value=""/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Serial&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="text"     
                                   name="serial" placeholder="Serial" required=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Marca</label>
                            <input class="form-control form-group" type="text"      
                                   name="marca" placeholder="Marca" value=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Consumo de energía</label>
                            <input class="form-control form-group" type="text"  value=""  
                                   name="c_energia" placeholder="Consumo de energía"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Peso kg</label>
                            <input class="form-control form-group" type="number"     
                                   name="peso" placeholder="Peso" value=""/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tiempo de garantía (meses)&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="number" required=""   
                                   name="t_garantia" placeholder="Timepo de garantia"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tiempo de vida (meses)&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="number"  required=""    
                                   name="t_vida" placeholder="Timepo de vida"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha final de garantía&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="date"  required=""  
                                   name="v_garantia"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha final de vida&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control form-group" type="date" required=""   
                                   name="v_vida"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Vendedor&nbsp;<span class="text-danger">*</span></label>
                            <select  name="vendedor" required="" class="form-control form-group">
                                <% for (Vendedores c : vendedores) {
                                        out.print("<option value=" + c.getId() + ">" + c.getNombre() + "</option>");
                                    }%>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Proveedor&nbsp;<span class="text-danger">*</span></label>
                            <select  name="proveedor" required="" class="form-control form-group">
                                <% for (Proveedores c : proveedores) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getNombreCompania() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tipo de máquina&nbsp;<span class="text-danger">*</span></label>
                            <select  name="tipo_maquina" required="" class="form-control form-group">
                                <% for (TiposMaquinas c : tipos_maquinas) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getNombre() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Sección&nbsp;<span class="text-danger">*</span></label>
                            <select  name="seccion" required="" class="form-control form-group">

                                <% for (Secciones c : secciones) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getNombre() + "</option>");
                                    }%>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Máquina padre&nbsp;<span class="text-danger">*</span></label>
                            <select  name="maquina_padre" class="form-control form-group">

                                <% for (Maquinas c : maquinas) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getModelo() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">

                            <label>Descripción</label>
                            <textarea class="form-control form-group" name="descripcion">
                            </textarea>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Observaciones</label>
                            <textarea class="form-control form-group" name="observacion">
                            </textarea>
                        </div>
                    </div>
                    <div class="row col-md-offset-1">
                        <span class="text-danger">*</span>Campos obligatorios
                    </div>
                    <div class="row form-group">
                        <div class="col-md-offset-1">
                            <button type="button" class="btn btn-default" onclick="location.href = 'index.jsp'"
                                    name="btn" value="Atras">Atras</button>
                            <input class="btn btn-primary" type="submit"
                                   name="btn" value="Guardar"/>
                        </div>                        
                    </div>
                    <input type="hidden" value="new" name="action"/>
                </form>
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
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>
