/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.TiposMaquinas;
import com.esteban.cmms.maven.model.TiposMaquinas_Model;
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
@WebServlet(name = "TiposMaquinasC", urlPatterns = {"/TiposMaquinasC"})
public class TiposMaquinas_Controller extends HttpServlet {

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

        if (btn.equals("Tipos")) {
            System.out.println("Tipos");
            TiposMaquinas_Model td = new TiposMaquinas_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    List<TiposMaquinas> tip = new ArrayList<TiposMaquinas>();
                    tip = td.getAllTiposMaquinas();
                    sesion.setAttribute("tipos", tip);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("TiposMaquinas/index.jsp");
            }else if(valor.equalsIgnoreCase("inactivo")){
                try {
                    List<TiposMaquinas> tip = new ArrayList<TiposMaquinas>();
                    tip = td.listNoActive();
                    sesion.setAttribute("tipos", tip);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("TiposMaquinas/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            TiposMaquinas t = new TiposMaquinas();
            TiposMaquinas_Model td = new TiposMaquinas_Model();
            String Id = request.getParameter("tipoId");
            t.setId(Integer.parseInt(Id));
            t.setNombre(request.getParameter("nombreTipo"));
            t.setEstado(request.getParameter("Estado"));
            t.setUserAction("esteban");
            try {
                td.updateTipoMaquina(t);
            } catch (Exception ex) {
                Logger.getLogger(TiposMaquinas_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("TiposMaquinas/index.jsp");

        } else if (btn.equals("Guardar")) {
            System.out.println("Estoy en guardar");
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("tipos");
            String name = request.getParameter("nombreTipo");
            TiposMaquinas tipo = new TiposMaquinas();
            TiposMaquinas_Model td = new TiposMaquinas_Model();
            tipo.setNombre(name);
            tipo.setEstado("Activo");
            tipo.setUserAction("esteban");
            try {
                td.addTipoMaquina(tipo);
            } catch (Exception ex) {
                Logger.getLogger(TiposMaquinas_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("TiposMaquinas/index.jsp");
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
