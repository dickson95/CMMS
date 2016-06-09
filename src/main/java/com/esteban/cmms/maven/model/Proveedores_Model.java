/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Proveedores;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Proveedores_Model {

    public void addProveedor(Proveedores obj) {
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
    

    public void deleteProveedor(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Proveedores obj = (Proveedores) session.load(Proveedores.class, new Integer(objid));
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

    public void updateProveedor(Proveedores obj) {
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

    public List<Proveedores> getAllProveedores() {
        List<Proveedores> obj = new ArrayList<Proveedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Proveedores as pro "
                    + "left join fetch pro.ciudades ci "
                    + "left join fetch ci.departamentos dep "
                    + "left join fetch dep.paises "
                    + "where pro.estado = 'Activo' "
                    + "order by pro.nombreCompania").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    public List<Proveedores> listNoActive() {
        List<Proveedores> obj = new ArrayList<Proveedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Proveedores as pro "
                    + "left join fetch pro.ciudades ci "
                    + "left join fetch ci.departamentos dep "
                    + "left join fetch dep.paises "
                    + "where pro.estado = 'Inactivo' "
                    + "order by pro.nombreCompania").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    public Proveedores getProveedorById(int objid) {
        Proveedores obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Proveedores where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Proveedores) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
