<%-- 
    Document   : edit
    Created on : 30/05/2016, 10:10:43 PM
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
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="rol" value="<%=sesion.getRoles().getRol()%>"></jsp:param>
            </jsp:include>
        </header>
        <main class="container">
            <div class="text-center">
                <h2>Editar máquina</h2>
            </div>
            <div class="container panel panel-body panel-default">
                <form method="GET" action="../MaquinasC">
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha de compra&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="date"     
                                   name="f_compra" value="<%= maquina.getFchCompra()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha de puesta en marcha&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="date"      
                                   name="f_marcha" value="<%= maquina.getFchPuestaMarcha()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fabricante</label>
                            <input class="form-control" type="text"     
                                   name="fabricante" value="<%= maquina.getFabricante()%>"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Modelo&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="text"     
                                   name="modelo" value="<%= maquina.getModelo()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Código de inventario&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="text"    
                                   name="codigo" value="<%= maquina.getCodigo()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Potencia</label>
                            <input class="form-control" type="text"      
                                   name="potencia" value="<%= maquina.getPotencia()%>"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Serial&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="text"     
                                   name="serial" value="<%= maquina.getSerial()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Marca</label>
                            <input class="form-control" type="text"      
                                   name="marca" value="<%= maquina.getMarca()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Consumo de energía</label>
                            <input class="form-control" type="text"     
                                   name="c_energia" value="<%= maquina.getConsumoEnergia()%>"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Peso kg</label>
                            <input class="form-control" type="text"     
                                   name="peso" value="<%= maquina.getPeso()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tiempo de garantía (meses)&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="text"    
                                   name="t_garantia" value="<%= maquina.getTiempoGarantia()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tiempo de vida (meses)&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="text"      
                                   name="t_vida" value="<%= maquina.getTiempoVida()%>"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha final de garantía&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="date"    
                                   name="v_garantia" value="<%= maquina.getVencimientoGarantia()%>"/>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Fecha final de vida&nbsp;<span class="text-danger">*</span></label>
                            <input class="form-control" type="date"      
                                   name="v_vida" value="<%= maquina.getVencimientoVida()%>"/>
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
                                <option value="<%= maquina.getProveedores().getId()%>"
                                        selected=""><%= maquina.getProveedores().getNombreCompania()%></option>
                                <% for (Proveedores c : proveedores) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getNombreCompania() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Tipo de máquina&nbsp;<span class="text-danger">*</span></label>
                            <select  name="tipo_maquina" required="" class="form-control form-group">
                                <option value="<%= maquina.getTiposMaquinas().getId()%>"
                                        selected=""><%= maquina.getTiposMaquinas().getNombre()%></option>
                                <% for (TiposMaquinas c : tipos_maquinas) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getNombre() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Sección&nbsp;<span class="text-danger">*</span></label>
                            <select  name="seccion" required="" class="form-control form-group">
                                <option value="<%= maquina.getSecciones().getId()%>"
                                        selected=""><%= maquina.getSecciones().getNombre()%></option>
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
                            <select  name="maquina_padre" required="" class="form-control form-group">
                                <% 
                                    System.out.println("Maquina padre");
                                    if(maquina.getMaquinas() != null){ %>
                                <option value="<%= maquina.getMaquinas().getId()%>"
                                        selected=""><%= maquina.getMaquinas().getModelo()%></option>
                                <% } %>
                                <% for (Maquinas c : maquinas) {
                                        out.print("<option value=" + c.getId() + ">"
                                                + c.getModelo() + "</option>");
                                    }%>
                            </select>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Descripción</label>
                            <textarea class="form-control" name="descripcion">
                                <%= maquina.getDescripcion()%>
                            </textarea>
                        </div>
                        <div class="col-md-3 col-md-offset-1">
                            <label>Observación</label>
                            <textarea class="form-control" name="observacion">
                                <%= maquina.getObservacion()%>
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
                    <input type="hidden" value="edit" name="action"/>
                    <input type="hidden" value="<%= maquina.getId()%>" name="id"/>

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

