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
            <jsp:include page="../layouts/navigation.jsp">
                <jsp:param name="title" value="Iniciar"/>
            </jsp:include>
        </header>
        <main class="container">
            <div class="row">
                <section class="col-md-6 panel panel-body panel-info">
                    <h1 class="text-center">BIENVENIDO A LA GESTION DE <BR> MANTENIMIENTO COMPUTARIZADO</h1>
                    <div class="text-left">
                        <p class="text-justify text-muted">
                            Este programa de mantenimiento le permitirá mantener bajo su control 
                            la gestión de mantenimiento de sus máquinas de confección de 
                            modo que alcance altos niveles de producción contra una vida 
                            útil de la máquina extendida.

                            Usar este sistema será sencillo, comuníquese con una distribución
                            en la interfaz (vista) del sistema fácil de usar, en la que trabajamos
                            con el objetivo de que satisfaga los más exigentes pero que 
                            sea fácil de usar.

                            Gestione estos temas:
                        </p>
                        <ul>
                            <li> Determine las localidades </li>
                            <li> Clasifique sus máquinas por tipos </li>
                            <li> Añada imágenes para identificar sus máquinas </li>
                            <li> Identifique sus proveedores y contactos </li>
                            <li> Ingrese la ficha técnica de sus máquinas </li>
                        </ul>

                    </div>
                </section>
                <section class="col-md-6">
                    <div>
                        <form class="form-signin" method="get" action="../UsuariosC"><!--Ruta para ejecutar el servlet-->
                            <h2 class="form-signin-heading"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Ingresar</h2>
                            <label for="inputEmail" class="sr-only">Correo electrónico</label>
                            <input name="usuario" type="email" id="inputEmail" class="form-control form-group" placeholder="Correo electrónico" required autofocus>
                            <label for="inputPassword" class="sr-only">Contraseña</label>
                            <input name="contrasena" type="password" id="inputPassword" class="form-control form-group" placeholder="Contraseña" required>
                            <div class="pull-right col-md-4">
                                <input class="btn btn-primary btn-block" type="submit" name="btn" value="Ingresar">    
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </main>
        <jsp:include page="../layouts/footer.jsp"/>
    </body>
</html>
