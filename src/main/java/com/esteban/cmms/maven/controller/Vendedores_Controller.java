/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Proveedores;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.controller.beans.Vendedores;
import com.esteban.cmms.maven.model.Proveedores_Model;
import com.esteban.cmms.maven.model.Vendedores_Model;
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
@WebServlet(name = "VendedoresC", urlPatterns = {"/VendedoresC"})
public class Vendedores_Controller extends HttpServlet {

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

        if (btn.equalsIgnoreCase("Vendedores")) {
            Vendedores_Model model = new Vendedores_Model();
            Proveedores_Model lmodel = new Proveedores_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Vendedores> result = new ArrayList<Vendedores>();
            List<Proveedores> resultl = new ArrayList<Proveedores>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllVendedores();
                    resultl = lmodel.getAllProveedores();
                    sesion.setAttribute("vendedores", result);
                    sesion.setAttribute("proveedores", resultl);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Vendedores");
            }else if(valor.equalsIgnoreCase("inactivo")){
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("vendedores", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Vendedores/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            Vendedores_Model model = new Vendedores_Model();
            Proveedores p = new Proveedores(Integer.parseInt(request.getParameter("proveedor")));
            Usuarios user = (Usuarios)request.getSession().getAttribute("usuario");
            Vendedores pojo = new Vendedores(
                Integer.parseInt(request.getParameter("id")),
                p,
                request.getParameter("nombre"),
                request.getParameter("estado"),
                request.getParameter("email"),
                Integer.parseInt(request.getParameter("codigo")),
                user.getNombre()
            );
            try {
                model.updateVendedor(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Vendedores_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Vendedores");

        } else if (btn.equalsIgnoreCase("guardar")) {
            
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("vendedores");
            Usuarios user = (Usuarios)request.getSession().getAttribute("usuario");
            Proveedores p = new Proveedores(Integer.parseInt(
                    request.getParameter("proveedor")));
            Vendedores pojo = new Vendedores(
                p,
                request.getParameter("nombre"),
                request.getParameter("email"),
                "Activo",
                Integer.parseInt(request.getParameter("codigo")),
                user.getNombre()
            );
            Vendedores_Model model = new Vendedores_Model();           
            
            try {
                model.addVendedor(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Vendedores_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Vendedores");
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
