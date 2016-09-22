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

    /**
     * Añade un nuevo proveedor a la tabla
     * @param obj un objeto de tipo Proveedores correctamente diligenciado, no es
     * necesario suministrar el id para este caso
     */
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
    
    /**
     * Elimina un proveedor de forma definitiva de la tabla en la base de datos
     * @param objid entero que corresponde al registro que quiere eliminar
     */
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

    /**
     * Actualiza un proveedor
     * @param obj Objeto de tipo proveedores, es necesario que el id este incluido
     *  en los datos del pojo para una correcta actualización
     */
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

    /**
     * Obtiene una lista de los proveedores con estado activo
     * @return lista de tipo Proveedores con los datos correspondientes
     */
    public List<Proveedores> getAllProveedores() {
        List<Proveedores> obj = new ArrayList<Proveedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Proveedores as pro "
                    + "left join fetch pro.ciudades ci "
                    + "left join fetch ci.paises "
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
    /**
     * Obtiene una lista de los proveedores con estado inactivo
     * @return lista de tipo Proveedores con los datos correspondientes
     */
    public List<Proveedores> listNoActive() {
        List<Proveedores> obj = new ArrayList<Proveedores>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Proveedores as pro "
                    + "left join fetch pro.ciudades ci "
                    + "left join fetch ci.paises "
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
    /**
     * Obtiene un único registro de la base de datos en la tabla proveedores
     * @param objid entero correspondiente al id del registro en la base de datos
     * @return un único resultado tipo Proveedores con los datos del registro.
     */
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
    /**
     * Actualiza los estados de los proveedores para que sigan o no disponibles en 
     * el funcionamiento del sistema
     * @param estado El estado al que se desea actualizar el registro, para este
     * sistema puede se 'Activo' o 'Inactivo'
     * @param id el entero (int) correspondiente al id del registro en la tabla 
     * de la base de datos
     * @param user el usuario que realiza la acción
     */
    public void estadoProveedor(String estado, Integer id, String user) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Query query = session.createQuery("UPDATE Proveedores SET "
                    + "Estado = :estado, "
                    + "UserAction = :user "
                    + "WHERE Id = :id");
            query.setString("estado", estado);
            query.setString("user", user);
            query.setInteger("id", id);
            query.executeUpdate();
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
}
