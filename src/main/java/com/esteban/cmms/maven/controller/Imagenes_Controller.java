/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller;

import com.esteban.cmms.maven.controller.beans.Imagenes;
import com.esteban.cmms.maven.controller.beans.Maquinas;
import com.esteban.cmms.maven.controller.beans.Usuarios;
import com.esteban.cmms.maven.model.Imagenes_Model;
import com.esteban.cmms.maven.model.Maquinas_Model;
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
        if (btne==null) {
            try {
                HttpSession sesion = request.getSession();
                sesion.removeAttribute("imagenes");
                Usuarios user = (Usuarios) sesion.getAttribute("usuario");
                FileItemFactory itemFactory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(itemFactory);
                String btn = null;
                Maquinas m = new Maquinas();
                List<FileItem> items = upload.parseRequest(request);
                Imagenes pojo = new Imagenes();
                pojo.setUserAction(user.getNombre());
                
                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        String contentType = item.getContentType();
                        if (!contentType.equals("image/png")) { //|| !contentType.equals("image/jpg")
                            continue;
                        }
                        File img = new File("/home/esteban/NetBeansProjects/"
                                + "CMMS-Maven/src/main/webapp/Imagenes/images_cli",
                                new Date() + item.getName());
                        item.write(img);
                        pojo.setImagen(img.getName());
                    }
                    if(item.isFormField()){
                        if(item.getFieldName().equalsIgnoreCase("maquina")){
                            int idm = Integer.parseInt(item.getString());
                            System.out.println("Maquina");
                            m.setId(idm);
                            pojo.setMaquinas(m);
                        }else if(item.getFieldName().equalsIgnoreCase("btn")){
                            System.out.println("Guardar cambios");
                            btn = item.getString().replaceAll("\\s", "");                            
                        }else if(item.getFieldName().equalsIgnoreCase("id")){
                            System.out.println("id imagen");
                            pojo.setId(Integer.parseInt(item.getString()));
                        }
                    }
                }
                pojo.setEstado("Activo");
                System.out.println("ste es el boton"+btn);
                if(btn.equalsIgnoreCase("actualizar")){
                    new Imagenes_Model().updateImagen(pojo);
                }else{
                    new Imagenes_Model().addImagen(pojo);
                }                
                response.sendRedirect("Imagenes");

            } catch (FileUploadException ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
                response.sendRedirect("Static_pages/errores.jsp");
            }
        } else {
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
                        sesion.setAttribute("maquinas", new Maquinas_Model().getAllMaquinas());

                    } catch (Exception e) {
                        System.out.println(e);
                        response.sendRedirect("Static_pages/errores.jsp");
                    }
                    response.sendRedirect("Imagenes");
                } else if (valor.equalsIgnoreCase("inactivo")) {
                    try {
                        result = model.listNoActive();
                        sesion.setAttribute("imagenes", result);

                    } catch (Exception e) {
                        System.out.println(e);
                        response.sendRedirect("Static_pages/errores.jsp");
                    }
                    response.sendRedirect("Imagenes/archivados.jsp");
                }
            } else if (btn.equalsIgnoreCase("estado")) {
                System.out.println("Definición de estado");
                System.out.println("Nuevo estado: "+request.getParameter("estado"));
                Usuarios user = (Usuarios) 
                        request.getSession().getAttribute("usuario");
                try {
                    new Imagenes_Model().estadoImagen(
                            request.getParameter("estado"),
                            Integer.parseInt(request.getParameter("id")),
                            user.getNombre()
                    );
                } catch (Exception ex) {
                    System.out.println(ex);
                        response.sendRedirect("Static_pages/errores.jsp");
                }
                System.out.println("Estado definido con éxito");
                response.sendRedirect("Imagenes");

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
