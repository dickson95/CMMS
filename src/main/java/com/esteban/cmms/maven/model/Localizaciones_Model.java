/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Localizaciones;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Localizaciones_Model {

    /**
     * Añade una única nueva localidad a la base de datos
     * @param obj Objeto de tipo Localizaciones
     */
    public void addLocalizacion(Localizaciones obj) {
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
     * Elimina una única localidad de la base de datos de forma permanente
     * @param objid entero (int) para eliminar el registro
     */
    public void deleteLocalizacion(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Localizaciones obj = (Localizaciones) session.load(Localizaciones.class, new Integer(objid));
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
     * Actualiza una localidad de acuerdo con los datos suministrados, algunos
     * son obligatorios otros opcionales. El Id es impresindible para la actualización
     * @param obj Objeto de tipo localizaciones
     */
    public void updateLocalizacion(Localizaciones obj) {
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
     * Busca todas las localizaciones activas existentes en la base de datos
     * @return Una lista de tipo localizaciones con los datos encontrados 
     */
    public List<Localizaciones> getAllLocalizaciones() {
        List<Localizaciones> obj = new ArrayList<Localizaciones>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Localizaciones where "
                    + "Estado='Activo' ORDER BY Codigo").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     * Busca las localizaciones que están inactivas en la base de datos
     * @return Una lista de tipo localizaciones con los datos encontrados
     * en la tabla
     */
    public List<Localizaciones> listNoActive() {
        List<Localizaciones> obj = new ArrayList<Localizaciones>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Localizaciones"
                    + " where Estado='Inactivo' ORDER BY Codigo").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     *Obtiene un registro de la tabla localizaciones con todos sus datos
     * @param objid un entero para encontrar un único registro que corresponda
     * @return si corresponde, un objeto localizaciones con la información
     */
    public Localizaciones getLocalizacionById(int objid) {
        Localizaciones obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Localizaciones where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Localizaciones) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
