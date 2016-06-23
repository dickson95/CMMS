<%-- 
    Document   : home
    Created on : 10/05/2016, 09:53:19 PM
    Author     : esteban
--%>

<%@page import="com.esteban.cmms.maven.controller.beans.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Object s = session.getAttribute("usuario");
    if (s != null) {
        Usuarios sesion = (Usuarios) s;
        System.out.println("Home");
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="CMMS"></jsp:param>
        </jsp:include>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
    </header>
    <main>
        <h1 class="text-center">BIENVENIDO A LA GESTION DE <BR> MANTENIMIENTO COMPUTARIZADO</h1>
        <div class="text-center">
            <p>
                Este programa de mantenimiento le permitirá mantener bajo su control 
                la gestión de mantenimiento de sus máquinas de confección de 
                modo que alcance altos niveles de producción contra una vida 
                útil de la máquina extendida.

                Usar este sistema será sencillo, comuníquese con una distribución
                en la interfaz (vista) del sistema fácil de usar, en la que trabajamos
                con el objetivo de que satisfaga los más exigentes pero que 
                sea fácil de usar.

                Regule estos temas:
            </p>
            <ul>
                <li> Registro de máquinas </li>
            </ul>

        </div>
        <jsp:include page="../layouts/footer.jsp"></jsp:include>
        </main>
    </body>
</html>
<%
    //session.invalidate();
    } else {
        response.sendRedirect("../Usuarios/login.jsp");
    }
%>

