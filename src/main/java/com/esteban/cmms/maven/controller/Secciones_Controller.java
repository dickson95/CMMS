/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Localizaciones;
import com.esteban.cmms.maven.controller.beans.Secciones;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Localizaciones_Model;
import com.esteban.cmms.maven.model.Secciones_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "SeccionesC", urlPatterns = {"/SeccionesC"})
public class Secciones_Controller extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        if (btn.equalsIgnoreCase("secciones")) {
            Secciones_Model model = new Secciones_Model();
            Localizaciones_Model lmodel = new Localizaciones_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Secciones> result = new ArrayList<Secciones>();
            List<Localizaciones> resultl = new ArrayList<Localizaciones>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllSecciones();
                    resultl = lmodel.getAllLocalizaciones();
                    sesion.setAttribute("secciones", result);
                    sesion.setAttribute("localizaciones", resultl);

                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Secciones");
            } else if (valor.equalsIgnoreCase("inactivo")) {
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("secciones", result);

                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Secciones/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            Secciones_Model model = new Secciones_Model();
            Localizaciones l = new Localizaciones(Integer.parseInt(request.getParameter("localizacion")));
            //Datos para el pojo
            Usuarios user = (Usuarios) request.getSession().getAttribute("usuario");
            Secciones pojo = new Secciones(l,
                    Integer.parseInt(request.getParameter("seccionId")),
                    request.getParameter("nombreSeccion"),
                    request.getParameter("Estado"),
                    user.getNombre(),
                    request.getParameter("codigo"));
            try {
                model.updateSeccion(pojo);
            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
            response.sendRedirect("Secciones");

        } else if (btn.equalsIgnoreCase("guardar")) {

            HttpSession sesion = request.getSession();
            sesion.removeAttribute("secciones");
            sesion.removeAttribute("localizaciones");
            Usuarios user = (Usuarios) sesion.getAttribute("usuario");
            int id = Integer.parseInt(request.getParameter("localizacion"));
            Localizaciones_Model lmodel = new Localizaciones_Model();
            Localizaciones obj = lmodel.getLocalizacionById(id);
            Secciones pojo = new Secciones(obj, request.getParameter("nombreSeccion"),
                    "Activo", user.getNombre(), request.getParameter("codigo"));
            Secciones_Model model = new Secciones_Model();

            try {
                model.addSeccion(pojo);
            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
            response.sendRedirect("Secciones");
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
