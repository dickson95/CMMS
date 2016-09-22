/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Roles;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Roles_Model;
import com.esteban.cmms.maven.model.Usuarios_Model;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author esteban
 */
@WebServlet(name = "UsuariosC", urlPatterns = {"/UsuariosC"})
public class Usuarios_Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String btne = request.getParameter("btn");
        String btn = btne.replaceAll("\\s", "");

        if (btn.equalsIgnoreCase("ingresar")) {
            Usuarios_Model model = new Usuarios_Model();
            HttpSession sesion = request.getSession();
            Usuarios result = new Usuarios();
            Object r;
            try {
                System.out.println(result.getContrasena());
                String con = model.getHash(request.getParameter("contrasena"));
                System.out.println(con);
                r = model.getUsuarioByUC(
                        request.getParameter("usuario"),
                        con
                );

                if (r == null) {
                    System.out.println("Resultado nulo, no accede al sistema");
                    response.sendRedirect("Static_pages/error.jsp");
                } else {
                    result = (Usuarios) r;
                    System.out.println(result.getRoles().getRol());
                    sesion.setAttribute("usuario", result);
                    sesion.setAttribute("roles", new Roles_Model().getAllRoles());
                    response.sendRedirect("Static_pages/home.jsp");
                }

            } catch (Exception e) {
                System.out.println(e);
                response.sendRedirect("Static_pages/error.jsp");
            }

        } else if (btn.equalsIgnoreCase("registrar")) {
            try {
                Roles rol = new Roles(
                        Integer.parseInt(request.getParameter("rol"))
                );
                Usuarios_Model model = new Usuarios_Model();
                String con = model.getHash(request.getParameter("contrasena"));
                Usuarios pojo = new Usuarios(
                        request.getParameter("nombre"),
                        request.getParameter("usuario"),
                        con,
                        rol, "Activo"
                );
                try {
                    model.addUsuario(pojo);
                } catch (Exception ex) {
                    System.out.println(ex);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Usuarios");

            } catch (NoSuchAlgorithmException ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }

        } else if (btn.equalsIgnoreCase("salir")) {
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            System.out.println("Sesson invalidada");
            response.sendRedirect("Usuarios");
        } else if (btn.equalsIgnoreCase("usuarios")) {
            List<Usuarios> result = new Usuarios_Model().getAllUsuarios();
            List<Roles> roles = new Roles_Model().getAllRoles();
            request.getSession();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuarios", result);
            sesion.setAttribute("roles", roles);
            response.sendRedirect("Usuarios");
        } else /**
         * Vetar usuarios
         */
        {
            if (btn.equalsIgnoreCase("vetar")) {
                try {
                    new Usuarios_Model().vetarUsuario(
                            request.getParameter("estado"),
                            Integer.parseInt(request.getParameter("id"))
                    );
                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                } finally {
                    response.sendRedirect("Usuarios");
                }

            } else if (btn.equalsIgnoreCase("actualizardatos")) {
                try {
                    Usuarios user = (Usuarios) request.getSession().getAttribute("usuario");
                    Usuarios_Model model = new Usuarios_Model();
                    Roles rol = new Roles();
                    int id = user.getId();
                    user.setNombre(request.getParameter("nombre"));
                    user.setEstado(user.getEstado());
                    user.setUsuario(user.getUsuario());
                    if (user.getRoles().getRol() == "administrador"
                            || (user.getRoles().getRol()).equals("administrador")) {
                        rol.setId(Integer.parseInt(request.getParameter("rol")));
                        user.setRoles(rol);
                    }else{
                        user.setRoles(user.getRoles());
                    }
                    
                    user.setContrasena(
                            model.getHash(request.getParameter("contrasena"))
                    );
                    model.updateUsuario(user);
                    request.getSession().invalidate();
                    List<Roles> roles = new Roles_Model().getAllRoles();
                    Usuarios user2 = model.getUsuarioById(id);
                    request.getSession().setAttribute("usuario", user2);
                    request.getSession().setAttribute("roles", roles);
                    response.sendRedirect("Usuarios/datos.jsp");
                } catch (NoSuchAlgorithmException ex) {
                    System.out.println(ex);
                    response.sendRedirect("Static_pages/errores.jsp");
                }

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
