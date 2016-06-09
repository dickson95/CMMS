/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Documentos;
import com.esteban.cmms.maven.model.Documentos_Model;
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
@WebServlet(name = "DocumentosC", urlPatterns = {"/DocumentosC"})
public class Documentos_Controller extends HttpServlet {

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
        String btne = request.getParameter("btn");
        String btn = btne.replaceAll("\\s", "");

        if (btn.equalsIgnoreCase("documentos")) {
            Documentos_Model model = new Documentos_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Documentos> result = new ArrayList<Documentos>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllDocumentos();
                    sesion.setAttribute("documentos", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Documentos/index.jsp");
            }else if(valor.equalsIgnoreCase("inactivo")){
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("documentos", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Documentos/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            Documentos pojo = new Documentos();
            Documentos_Model model = new Documentos_Model();
            String Id = request.getParameter("documentoId");
            //Datos para el pojo
            pojo.setId(Integer.parseInt(Id));
            pojo.setEstado(request.getParameter("nombreDocumento"));
            pojo.setEstado(request.getParameter("codigo")); 
            pojo.setEstado(request.getParameter("Estado"));
            pojo.setUserAction("esteban");
            try {
                model.updateDocumento(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Documentos_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Documentos/index.jsp");

        } else if (btn.equalsIgnoreCase("guardar")) {
            System.out.println("Este es guardar");
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("documentos");
            String name = request.getParameter("nombreDocumento");
            
            Documentos pojo = new Documentos();
            Documentos_Model model = new Documentos_Model();
            pojo.setEstado(name);
            pojo.setEstado(request.getParameter("codigo"));
            pojo.setEstado("Activo");
            pojo.setUserAction("esteban");
            
            try {
                model.addDocumento(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Documentos_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Documentos/index.jsp");
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
