<%-- 
    Document   : aplication
    Created on : 10/05/2016, 09:41:44 PM
    Author     : esteban
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
        <title><% if (request.getParameter("title") != null) {out.print(request.getParameter("title"));} else {out.print("Sistema de gestión de mantenimiento");}%></title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/jquery-1.12.3.js"></script>
        <script src="../assets/js/jquery.dataTables.min.js"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js"></script>
        <script src="../assets/js/jquery-ui-1.11.4/jquery-ui.js"></script>
        <script src="../assets/js/aplication.js"></script>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="../assets/css/dataTables.bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/js/jquery-ui-1.11.4/jquery-ui.css" type="text/css" />
        