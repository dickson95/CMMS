/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Ciudades;
import com.esteban.cmms.maven.controller.beans.Proveedores;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Ciudades_Model;
import com.esteban.cmms.maven.model.Proveedores_Model;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProveedoresC", urlPatterns = {"/ProveedoresC"})
public class Proveedores_Controller extends HttpServlet {

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
        
        if (btn.equalsIgnoreCase("proveedores")) {
            Proveedores_Model model = new Proveedores_Model();
            Ciudades_Model modelc = new Ciudades_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Proveedores> result = new ArrayList<Proveedores>();
            List<Ciudades> resultc = new ArrayList<Ciudades>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllProveedores();
                    resultc = modelc.getAllCiudades();
                    sesion.setAttribute("proveedores", result);
                    sesion.setAttribute("ciudades", resultc);
                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Proveedores");
            } else if (valor.equalsIgnoreCase("inactivo")) {
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("proveedores", result);
                    
                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Proveedores/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            HttpSession sesion = request.getSession();
            String Id = request.getParameter("id");
            Proveedores_Model model = new Proveedores_Model();
            Ciudades c = new Ciudades(Integer.parseInt(
                    request.getParameter("ciudad")));
            System.out.println("Este es el Id: " + Id);
            Usuarios user = (Usuarios)request.getSession().getAttribute("usuario");
            Proveedores pojo = new Proveedores(
                    Integer.parseInt(Id),
                    request.getParameter("compania"),
                    request.getParameter("telefono"),
                    request.getParameter("direccion"),
                    request.getParameter("c_postal"),
                    request.getParameter("email"),
                    request.getParameter("p_web"),
                    Long.parseLong(request.getParameter("deuda")),
                    request.getParameter("descripcion"),
                    c,
                    request.getParameter("estado"),
                    user.getNombre()
            );
            
            try {
                model.updateProveedor(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Proveedores_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.removeAttribute("proveedores");
            sesion.removeAttribute("ciudades");
            response.sendRedirect("Proveedores");
            
        } else if (btn.equalsIgnoreCase("guardar")) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("proveedores");
            sesion.removeAttribute("ciudades");
            Usuarios user = (Usuarios)sesion.getAttribute("usuario");
            Ciudades c = new Ciudades(Integer.parseInt(
                    request.getParameter("ciudad")));
            Proveedores pojo = new Proveedores(
                    c,
                    request.getParameter("compania"),
                    request.getParameter("telefono"),
                    request.getParameter("direccion"),
                    request.getParameter("c_postal"),
                    request.getParameter("email"),
                    request.getParameter("p_web"),
                    Long.parseLong(request.getParameter("deuda")),
                    request.getParameter("descripcion"),
                    "Activo",
                    user.getNombre()
            );
            Proveedores_Model model = new Proveedores_Model();
            
            try {
                model.addProveedor(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Proveedores_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Proveedores");
        } else if (btn.equalsIgnoreCase("ciudad")) {
            List<Ciudades> c = new Ciudades_Model().getAllCiudades(request.getParameter("search"));
            List<String> ciudades = new ArrayList<>();
            for (Ciudades ciudad : c) {
                ciudades.add(ciudad.getNombre()+", "
                        + ""+ciudad.getDepartamentos().getNombre()+", "
                        + ""+ciudad.getDepartamentos().getPaises().getNombre()+"");
            }
            JsonElement json = new Gson().toJsonTree(ciudades);
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(json);
            out.flush();
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
