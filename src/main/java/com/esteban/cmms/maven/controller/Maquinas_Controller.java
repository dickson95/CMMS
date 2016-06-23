/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Maquinas;
import com.esteban.cmms.maven.controller.beans.Proveedores;
import com.esteban.cmms.maven.controller.beans.Secciones;
import com.esteban.cmms.maven.controller.beans.TiposMaquinas;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.controller.beans.Vendedores;
import com.esteban.cmms.maven.model.Maquinas_Model;
import com.esteban.cmms.maven.model.Proveedores_Model;
import com.esteban.cmms.maven.model.Secciones_Model;
import com.esteban.cmms.maven.model.TiposMaquinas_Model;
import com.esteban.cmms.maven.model.Vendedores_Model;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "MaquinasC", urlPatterns = {"/MaquinasC"})
public class Maquinas_Controller extends HttpServlet {

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

        if (btn.equalsIgnoreCase("maquinas")) {
            Maquinas_Model model = new Maquinas_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Maquinas> result = new ArrayList<Maquinas>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllMaquinas();

                    sesion.setAttribute("maquinas", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Maquinas/index.jsp");
            } else if (valor.equalsIgnoreCase("inactivo")) {
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("maquinas", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Maquinas/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardar")) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("maquinas");
            String action = request.getParameter("action");
            String fe_compra = request.getParameter("f_compra");
            String fe_marcha = request.getParameter("f_marcha");
            String ve_garantia = request.getParameter("v_garantia");
            String ve_vida = request.getParameter("v_vida");
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date f_compra = null;
            Date f_marcha = null;
            Date v_garantia = null;
            Date v_vida = null;
            try {
                f_compra = formato.parse(fe_compra);
                f_marcha = formato.parse(fe_marcha);
                v_garantia = formato.parse(ve_garantia);
                v_vida = formato.parse(ve_vida);
                System.out.println(f_compra + "," + f_marcha + "," + v_garantia + "," + v_vida);
            } catch (ParseException ex) {
                System.out.println(ex);
            }
            Vendedores v = new Vendedores(
                    Integer.parseInt(request.getParameter("vendedor"))
            );
            Proveedores p = new Proveedores(
                    Integer.parseInt(request.getParameter("proveedor"))
            );
            TiposMaquinas tm = new TiposMaquinas(
                    Integer.parseInt(request.getParameter("tipo_maquina"))
            );
            Secciones s = new Secciones(
                    Integer.parseInt(request.getParameter("seccion"))
            );
            Maquinas m = new Maquinas(
                    Integer.parseInt(request.getParameter("maquina_padre"))
            );
            Maquinas ma = new Maquinas();
            ma.setMaquinas(m);
            Usuarios user = (Usuarios)sesion.getAttribute("usuario");
            Maquinas pojo = new Maquinas(
                    f_compra, f_marcha,
                    request.getParameter("fabricante"),
                    request.getParameter("modelo"),
                    request.getParameter("codigo"),
                    request.getParameter("potencia"),
                    request.getParameter("serial"),
                    request.getParameter("marca"),
                    request.getParameter("c_energia"),
                    Float.parseFloat(request.getParameter("peso")),
                    Integer.parseInt(request.getParameter("t_garantia")),
                    Integer.parseInt(request.getParameter("t_vida")),
                    v_garantia, v_vida, v, p, tm, s,
                    ma.getMaquinas(),
                    request.getParameter("descripcion"),
                    request.getParameter("observacion"),
                    user.getNombre(), "Activo"
            );
            Maquinas_Model model = new Maquinas_Model();
            try {
                if (action.equalsIgnoreCase("new")) {
                    model.addMaquina(pojo);
                } else if (action.equalsIgnoreCase("edit")) {
                    System.out.println("Este es para editar");
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    pojo.setId(id);
                    model.updateMaquina(pojo);
                }
            } catch (Exception ex) {
                Logger.getLogger(Maquinas_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Maquinas");
        } else if (btn.equalsIgnoreCase("edit")) {
            HttpSession sesion = request.getSession();
            Maquinas result = new Maquinas_Model().
                    getMaquinaById(Integer.parseInt(request.getParameter("id")));

            List<Vendedores> vendedores = new Vendedores_Model().getAllVendedores();
            List<TiposMaquinas> tipos_maquinas = new TiposMaquinas_Model().getAllTiposMaquinas();
            List<Proveedores> proveedores = new Proveedores_Model().getAllProveedores();
            List<Secciones> secciones = new Secciones_Model().getAllSecciones();
            List<Maquinas> maquinas = new Maquinas_Model().getAllMaquinas();
            sesion.setAttribute("vendedores", vendedores);
            sesion.setAttribute("tipos_maquinas", tipos_maquinas);
            sesion.setAttribute("proveedores", proveedores);
            sesion.setAttribute("secciones", secciones);
            sesion.setAttribute("maquinas", maquinas);
            sesion.setAttribute("maquina", result);

            response.sendRedirect("Maquinas/edit.jsp");
        } else if (btn.equalsIgnoreCase("new")) {
            try {
                List<Vendedores> vendedores = new Vendedores_Model().getAllVendedores();
                List<TiposMaquinas> tipos_maquinas = new TiposMaquinas_Model().getAllTiposMaquinas();
                List<Proveedores> proveedores = new Proveedores_Model().getAllProveedores();
                List<Secciones> secciones = new Secciones_Model().getAllSecciones();
                List<Maquinas> maquinas = new Maquinas_Model().getAllMaquinas();
                HttpSession sesion = request.getSession();
                sesion.setAttribute("vendedores", vendedores);
                sesion.setAttribute("tipos_maquinas", tipos_maquinas);
                sesion.setAttribute("proveedores", proveedores);
                sesion.setAttribute("secciones", secciones);
                sesion.setAttribute("maquinas", maquinas);
                response.sendRedirect("Maquinas/new.jsp");
            } catch (Exception e) {
                Logger.getLogger(Maquinas_Controller.class.getName()).log(Level.SEVERE, null, e);
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
