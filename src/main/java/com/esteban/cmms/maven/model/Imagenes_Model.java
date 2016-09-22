/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Imagenes;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Imagenes_Model {
    /**
     * 
     * @param obj Objeto de tipo imágenes para añadir un nuevo registro
     */
    public void addImagen(Imagenes obj) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.save(obj);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }
    
    /**
     * 
     * @param objid Un entero (int) para eliminar un imagen del sistema
     */
    public void deleteImagen(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Imagenes obj = (Imagenes) session.load(Imagenes.class, new Integer(objid));
            session.delete(obj);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }
    
    /**
     * 
     * @param obj Objeto tipo imágenes para actualizar un solo registro, debe 
     * estar diligenciado el id en el pojo para poder ser actualizado el registro
     */
    public void updateImagen(Imagenes obj) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.update(obj);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }
    
    /**
     * 
     * @param estado El estado al que se desea actualizar el registro, estos para
     * este sistema pueden se 'Activo' o 'Inactivo'
     * @param id El id del registro que desea cambiar de estado, lo pasa como un 
     * entero (int)
     * @param user Información del usuario que realiza la operación.
     */
    public void estadoImagen(String estado, int id, String user){
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Query query = session.createQuery("UPDATE Imagenes SET "
                    + "Estado = :estado, "
                    + "UserAction = :user "
                    + "WHERE Id = :id");
            query.setString("estado", estado);
            query.setString("user", user);
            query.setInteger("id", id);
            query.executeUpdate();
            System.out.println("Cambia de estado...");
            session.getTransaction().commit();
        }catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        }finally{
            session.flush();
            session.close();
        }
    }
    
    /**
     * 
     * @return Listado con todas las imágenes existentes
     */
    public List<Imagenes> getAllImagenes() {
        List<Imagenes> obj = new ArrayList<Imagenes>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Imagenes as im"
                    + " left join fetch im.maquinas"
                    + " where im.estado = 'Activo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     * 
     * @return Listado de las imágenes que han sido desactivadas
     */
    public List<Imagenes> listNoActive() {
        List<Imagenes> obj = new ArrayList<Imagenes>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Imagenes as im"
                    + " left join fetch im.maquinas"
                    + " where im.estado = 'Inactivo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene una imágen única por el id que se pasa como parámetro
     * @param objid un entero (int)
     * @return única imagen de acuerdo con el id
     */
    public Imagenes getImagenById(int objid) {
        Imagenes obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Imagenes where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Imagenes) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
