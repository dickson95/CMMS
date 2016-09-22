/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Localizaciones;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Localizaciones_Model;
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
@WebServlet(name = "LocalizacionesC", urlPatterns = {"/LocalizacionesC"})
public class Localizaciones_Controller extends HttpServlet {

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

        if (btn.equalsIgnoreCase("localizaciones")) {
            Localizaciones_Model model = new Localizaciones_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Localizaciones> result = new ArrayList<Localizaciones>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllLocalizaciones();
                    sesion.setAttribute("localizaciones", result);

                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Localizaciones");
            } else if (valor.equalsIgnoreCase("inactivo")) {
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("localizaciones", result);

                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Localizaciones/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            Localizaciones pojo = new Localizaciones();
            Localizaciones_Model model = new Localizaciones_Model();
            String Id = request.getParameter("localizacionId");
            //Datos para el pojo
            Usuarios user = (Usuarios) request.getSession().getAttribute("usuario");
            pojo.setId(Integer.parseInt(Id));
            pojo.setNombre(request.getParameter("nombreLocalizacion"));
            pojo.setCodigo(request.getParameter("codigo"));
            pojo.setEstado(request.getParameter("Estado"));
            pojo.setUserAction(user.getNombre());
            try {
                model.updateLocalizacion(pojo);
            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
            response.sendRedirect("Localizaciones");

        } else if (btn.equalsIgnoreCase("guardar")) {
            System.out.println("Este es guardar");
            HttpSession sesion = request.getSession();
            Usuarios user = (Usuarios) sesion.getAttribute("usuario");
            sesion.removeAttribute("localizaciones");
            String name = request.getParameter("nombreLocalizacion");

            Localizaciones pojo = new Localizaciones();
            Localizaciones_Model model = new Localizaciones_Model();
            pojo.setNombre(name);
            pojo.setCodigo(request.getParameter("codigo"));
            pojo.setEstado("Activo");
            pojo.setUserAction(user.getNombre());

            try {
                model.addLocalizacion(pojo);
            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
            response.sendRedirect("Localizaciones");
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
