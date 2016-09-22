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
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Proveedores> result = new ArrayList<Proveedores>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllProveedores();
                    sesion.setAttribute("proveedores", result);
                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Proveedores");
            } else if (valor.equalsIgnoreCase("inactivo")) {
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("proveedores", result);

                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("Static_pages/errores.jsp");
                }
                response.sendRedirect("Proveedores/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardar") || btn.equalsIgnoreCase("guardarcambios")) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("proveedores");
            Usuarios user = (Usuarios) sesion.getAttribute("usuario");
            String ciudadp = request.getParameter("ciudad");
            String ciudad = ciudadp.replaceAll("\\s", "");
            String[] p_c = ciudad.split(",");
            Ciudades c = new Ciudades_Model().getCiudad(p_c[0], p_c[2]);
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
                if (btn.equalsIgnoreCase("guardar")) {
                    model.addProveedor(pojo);
                } else if (btn.equalsIgnoreCase("guardarcambios")) {
                    String Id = request.getParameter("id");
                    pojo.setId(Integer.parseInt(Id));
                    model.updateProveedor(pojo);
                }

            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
            response.sendRedirect("Proveedores");
        } else if (btn.equalsIgnoreCase("ciudad")) {
            System.out.println("URL: " + request.getRequestURL());
            List<Ciudades> c = new Ciudades_Model().getAllCiudades(request.getParameter("q"));
            List<String> ciudades = new ArrayList<>();
            for (Ciudades ciudad : c) {
                ciudades.add(ciudad.getCiudad() + ", "
                        + "" + ciudad.getPaises().getPais() + ", "
                        + "" + ciudad.getPaises().getCodigo() + "");
            }
            JsonElement json = new Gson().toJsonTree(ciudades);
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(json);
            out.flush();
        } else if (btn.equalsIgnoreCase("archivar") || btn.equalsIgnoreCase("activar")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String estado = request.getParameter("estado");
            Usuarios user = (Usuarios) request.getSession().getAttribute("usuario");
            new Proveedores_Model().estadoProveedor(estado, id, user.getNombre());
            response.sendRedirect("Proveedores");
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
