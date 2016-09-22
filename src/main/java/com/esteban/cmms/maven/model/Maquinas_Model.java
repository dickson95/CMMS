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

    /**
     * Añade una nueva máquina o registro a la tabla en la base de datos
     * @param obj Objet de tipo maquinas correctamente diligenciado, sin el id
     * ya que la base de datos controla este indicador
     */
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
    
    /**
     * Elimina una máquina de la base de datos
     * @param objid entero (int) del registro que se desea eliminar, este corresponde
     * a id en la tabla del registro que desea eliminar
     */
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

    /**
     * Actualiza un registro de la tabla máquinas con base a los datos suministrados
     * en el parámetro
     * @param obj objeto tipo Maquinas con el id correctamente diligenciado, de lo
     * contrario no se actualizará nungún registro
     */
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
    
    /**
     * Actualiza los estados de las máquinas para que sigan o no disponibles en 
     * el funcionamiento del sistema
     * @param estado El estado al que se desea actualizar el registro, para este
     * sistema puede se 'Activo' o 'Inactivo'
     * @param id el entero (int) correspondiente al id del registro en la tabla 
     * de la base de datos
     * @param user el usuario que realiza la acción
     */
    public void estadoMaquina(String estado, Integer id, String user) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Query query = session.createQuery("UPDATE Maquinas SET "
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

    /**
     *Obtiene un listado con todas las máquinas en estado activo que hay en la 
     * tabla de las máquinas
     * @return un listado tipo máquinas con toda la información correspondiente.
     */
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
                    + " left join fetch maq.maquinas"
                    + " where maq.estado = 'Activo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     * Obtiene un listado de todas las máquinas que están inactivas en la tabla
     * de máquinas
     * @return Un listado de tipo máquinas con la información correspondiente
     */
    public List<Maquinas> listNoActive() {
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
                    + " left join fetch maq.maquinas"
                    + " where maq.estado = 'Inactivo'").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene un único registro de acuerdo con los parámetros recibidos
     * @param objid entero igual al id del registro que quiere obtener
     * @return Un objeto tipo máquinas de acuerdo con el id que se suministró
     */
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
