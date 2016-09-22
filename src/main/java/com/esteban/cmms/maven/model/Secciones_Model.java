/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Secciones;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Secciones_Model {
    
    /**
     * Añade una nueva sección a la tabla
     * @param obj un objeto de tipo Secciones correctamente diligenciado, no es
     * necesario suministrar el id para este caso
     */

    public void addSeccion(Secciones obj) {
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
     * Elimina una sección de forma definitiva de la tabla en la base de datos
     * @param objid entero que corresponde al registro que quiere eliminar
     */
    public void deleteSeccion(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Secciones obj = (Secciones) session.load(Secciones.class, new Integer(objid));
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
     * Actualiza una sección
     * @param obj Objeto de tipo secciones, es necesario que el id este incluido
     *  en los datos del pojo para una correcta actualización
     */
    public void updateSeccion(Secciones obj) {
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
     * Obtiene una lista de las secciones con estado activo
     * @return lista de tipo Secciones con los datos correspondientes
     */
    public List<Secciones> getAllSecciones() {
        List<Secciones> obj = new ArrayList<Secciones>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Secciones as sec "
                    + "left join fetch sec.localizaciones "
                    + "where sec.estado = 'Activo' "
                    + "order by sec.codigo asc").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     * Obtiene una lista de las secciones con estado inactivo
     * @return lista de tipo Secciones con los datos correspondientes
     */
    public List<Secciones> listNoActive() {
        List<Secciones> obj = new ArrayList<Secciones>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Secciones as sec "
                    + "left join fetch sec.localizaciones "
                    + "where sec.estado = 'Inactivo' "
                    + "order by sec.codigo asc").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene un único registro de la base de datos en la tabla secciones
     * @param objid entero correspondiente al id del registro en la base de datos
     * @return un único resultado tipo Secciones con los datos del registro.
     */
    public Secciones getSeccionById(int objid) {
        Secciones obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Secciones where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Secciones) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
