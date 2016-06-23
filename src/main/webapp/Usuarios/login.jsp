<%-- 
    Document   : login
    Created on : 9/06/2016, 11:30:10 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../layouts/aplication.jsp">
            <jsp:param name="title" value="Ingresar"></jsp:param>
        </jsp:include>
        </head>
        <body>
            <header>
            <jsp:include page="../layouts/navigation.jsp"></jsp:include>
        </header>
        <main>
            <div class="container">
                <form class="form-signin" method="get" action="../UsuariosC"><!--Ruta para ejecutar el servlet-->
                    <h2 class="form-signin-heading"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Ingresar</h2>
                    <label for="inputEmail" class="sr-only">Correo electrónico</label>
                    <input name="usuario" type="text" id="inputEmail" class="form-control" placeholder="Correo electrónico" required autofocus>
                    <label for="inputPassword" class="sr-only">Contraseña</label>
                    <input name="contrasena" type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required>
                    <input class="btn btn-lg btn-primary btn-block" type="submit" name="btn" value="Ingresar">    

                </form>
            </div>
        </main>
    </body>
</html>
