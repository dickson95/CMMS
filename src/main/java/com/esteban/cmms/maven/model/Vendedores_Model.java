/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Vendedores;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Vendedores_Model {
    /**
     * Añade un nuevo vendedor a la tabla
     *
     * @param obj un objeto tipo Vendedores correctamente diligenciado, no es
     * necesario suministrar el id para este caso
     */
    public void addVendedor(Vendedores obj) {
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
     * Elimina un vendedor de forma definitiva de la tabla en la base de
     * datos
     *
     * @param objid entero que corresponde al registro que quiere eliminar
     */
    public void deleteVendedor(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Vendedores obj = (Vendedores) session.load(Vendedores.class, new Integer(objid));
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
     * Actualiza un vendedor
     *
     * @param obj Objeto de tipo Vendedores, es necesario que el id este incluido
     * en los datos del pojo para una correcta actualización
     */
    public void updateVendedor(Vendedores obj) {
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
     * Obtiene una lista de los vendedores con estado activo
     *
     * @return lista de tipo Vendedores con los datos correspondientes
     */
    public List<Vendedores> getAllVendedores() {
        List<Vendedores> obj = new ArrayList<Vendedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Vendedores as a "
                    + "left join fetch a.proveedores"
                    + " where a.estado = 'Activo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     * Obtiene una lista de los vendedores con estado inactivo
     *
     * @return lista de tipo Vendedores con los datos correspondientes
     */
    public List<Vendedores> listNoActive() {
        List<Vendedores> obj = new ArrayList<Vendedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Vendedores as a "
                    + "left join fetch a.proveedores"
                    + " where a.estado = 'Inactivo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene un único registro de la base de datos en la tabla vendedores
     *
     * @param objid entero correspondiente al id del registro en la base de
     * datos
     * @return un único resultado tipo Vendedores con los datos del registro.
     */
    public Vendedores getVendedorById(int objid) {
        Vendedores obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Vendedores where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Vendedores) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
