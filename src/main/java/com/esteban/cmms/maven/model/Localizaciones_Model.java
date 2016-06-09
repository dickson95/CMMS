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
