 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Imagenes;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Imagenes_Model;
import java.io.File;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author esteban
 */
@WebServlet(name = "ImagenesC", urlPatterns = {"/ImagenesC"})
public class Imagenes_Controller extends HttpServlet {

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

        if (btn.equalsIgnoreCase("imagenes")) {
            Imagenes_Model model = new Imagenes_Model();
            HttpSession sesion = request.getSession();
            String valor = request.getParameter("valor");
            List<Imagenes> result = new ArrayList<Imagenes>();
            if (valor.equalsIgnoreCase("activo")) {
                try {
                    result = model.getAllImagenes();
                    sesion.setAttribute("imagenes", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Imagenes");
            }else if(valor.equalsIgnoreCase("inactivo")){
                try {
                    result = model.listNoActive();
                    sesion.setAttribute("imagenes", result);

                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect("Imagenes/archivados.jsp");
            }
        } else if (btn.equalsIgnoreCase("guardarcambios")) {
            Imagenes pojo = new Imagenes();
            Imagenes_Model model = new Imagenes_Model();
            String Id = request.getParameter("imagenId");
            //Datos para el pojo
            Usuarios user = (Usuarios)request.getSession().getAttribute("usuario");
            pojo.setId(Integer.parseInt(Id));
            pojo.setEstado(request.getParameter("nombreImagen"));
            pojo.setEstado(request.getParameter("codigo")); 
            pojo.setEstado(request.getParameter("Estado"));
            pojo.setUserAction(user.getNombre());
            try {
                model.updateImagen(pojo);
            } catch (Exception ex) {
                Logger.getLogger(Imagenes_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("Imagenes");

        } else if (btn.equalsIgnoreCase("guardar")) {
            try {
                HttpSession sesion = request.getSession();
                sesion.removeAttribute("imagenes");
                Usuarios user = (Usuarios)sesion.getAttribute("usuario");
                FileItemFactory itemFactory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(itemFactory);
                
                List<FileItem> items = upload.parseRequest(request);
                
                for (FileItem item : items) {
                    if(!item.isFormField()){
                        String contentType = item.getContentType();
                        if(!contentType.equals("image/png")){ //|| !contentType.equals("image/jpg")
                              continue;
                        }
                        File img = new File("/home/esteban/NetBeansProjects/"
                                + "CMMS-Hibernate/web/Imagenes/images_cli",
                                new Date()+item.getName());
                        item.write(img);
                        
                    }
                }
                Imagenes pojo = new Imagenes();
                Imagenes_Model model = new Imagenes_Model();
                pojo.setEstado(request.getParameter("codigo"));
                pojo.setEstado("Activo");
                pojo.setUserAction(user.getNombre());
                model.addImagen(pojo);
                response.sendRedirect("Imagenes");
            } catch (FileUploadException ex) {
                Logger.getLogger(Imagenes_Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Imagenes_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
