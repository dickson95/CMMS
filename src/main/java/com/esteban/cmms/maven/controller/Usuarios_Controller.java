/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Usuarios_Model;
import java.io.IOException;
import java.util.ArrayList;
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
                    r = model.getUsuarioByUC(
                            request.getParameter("usuario"),
                            request.getParameter("contrasena")
                    );
                    
                    if(r == null){
                        System.out.println("Resultado nulo, no accede al sistema");
                        response.sendRedirect("Static_pages/error.jsp");
                    }else{
                        result = (Usuarios) r;
                        System.out.println(result.getUsuario());
                        sesion.setAttribute("usuario", result);
                        response.sendRedirect("Static_pages/home.jsp");
                    }
                    
                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/error.jsp");
                }
                
        } else if (btn.equalsIgnoreCase("registrar")) {
            Usuarios pojo = new Usuarios(
                    request.getParameter("usuario"),
                    request.getParameter("contrasena"),
                    "admin"
            );
            Usuarios_Model model = new Usuarios_Model();
            try {
                model.addUsuario(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Usuarios_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Usuarios/login.jsp");

        } else if (btn.equalsIgnoreCase("guardar")) {
            System.out.println("Este es guardar");
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("usuarios");
            
            Usuarios pojo = new Usuarios();
            Usuarios_Model model = new Usuarios_Model();
            
            try {
                model.addUsuario(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Usuarios_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Usuarios/index.jsp");
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
