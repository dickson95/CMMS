/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.TiposMaquinas;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class TiposMaquinas_Model {

    /**
     * Añade un nuevo tipo de máquina a la tabla
     *
     * @param obj un objeto TiposMaquinas correctamente diligenciado, no es
     * necesario suministrar el id para este caso
     */
    public void addTipoMaquina(TiposMaquinas tipom) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.save(tipom);
            System.out.println("Guardé el tipom");
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
     * Elimina un tipo de máquina de forma definitiva de la tabla en la base de
     * datos
     *
     * @param objid entero que corresponde al registro que quiere eliminar
     */
    public void deleteTipoMaquina(int tipomid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            TiposMaquinas tipom = (TiposMaquinas) session.load(TiposMaquinas.class, new Integer(tipomid));
            session.delete(tipom);
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
     * Actualiza un tipo de máquina
     *
     * @param obj Objeto de tiposMaquinas, es necesario que el id este incluido
     * en los datos del pojo para una correcta actualización
     */
    public void updateTipoMaquina(TiposMaquinas tipom) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            session.update(tipom);
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
     * Obtiene una lista de los tipos de máquinas con estado activo
     *
     * @return lista de tiposMaquinas con los datos correspondientes
     */
    public List<TiposMaquinas> getAllTiposMaquinas() {
        List<TiposMaquinas> tiposm = new ArrayList<TiposMaquinas>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            tiposm = session.createQuery("from TiposMaquinas where "
                    + "Estado='Activo' ORDER BY Nombre").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return tiposm;
    }

    /**
     * Obtiene una lista de los tipos de máquinas con estado inactivo
     *
     * @return lista de tiposMaquinas con los datos correspondientes
     */
    public List<TiposMaquinas> listNoActive() {
        List<TiposMaquinas> tiposm = new ArrayList<TiposMaquinas>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            tiposm = session.createQuery("from TiposMaquinas"
                    + " where Estado='Inactivo' ORDER BY Nombre").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return tiposm;
    }

    /**
     * Obtiene un único registro de la base de datos en la tabla tiposMaquinas
     *
     * @param objid entero correspondiente al id del registro en la base de
     * datos
     * @return un único resultado tiposMaquinas con los datos del registro.
     */
    public TiposMaquinas getTipoMaquinaById(int tipomid) {
        TiposMaquinas tipom = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from TiposMaquinas where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", tipomid);
            tipom = (TiposMaquinas) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return tipom;
    }
}
