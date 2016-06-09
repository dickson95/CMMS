/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Maquinas;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Maquinas_Model {

    public void addMaquina(Maquinas obj) {
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
    

    public void deleteMaquina(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Maquinas obj = (Maquinas) session.load(Maquinas.class, new Integer(objid));
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

    public void updateMaquina(Maquinas obj) {
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

    public List<Maquinas> getAllMaquinas() {
        List<Maquinas> obj = new ArrayList<Maquinas>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Maquinas as maq"
                    + " left join fetch maq.proveedores"
                    + " left join fetch maq.secciones"
                    + " left join fetch maq.tiposMaquinas"
                    + " left join fetch maq.vendedores"
                    + " left join fetch maq.maquinas").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    public List<Maquinas> listNoActive() {
        List<Maquinas> obj = new ArrayList<Maquinas>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Maquinas"
                    + " where Estado='Inactivo' ORDER BY Codigo").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    public Maquinas getMaquinaById(int objid) {
        Maquinas obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Maquinas maq"
                    + " left join fetch maq.proveedores"
                    + " left join fetch maq.secciones"
                    + " left join fetch maq.tiposMaquinas"
                    + " left join fetch maq.vendedores"
                    + " left join fetch maq.maquinas"
                    + " where maq.id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Maquinas) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
