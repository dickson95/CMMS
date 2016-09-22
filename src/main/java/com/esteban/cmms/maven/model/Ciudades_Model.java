/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Ciudades;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Ciudades_Model {
    
    /**
     * @param obj Recibe un objeto de tipo Ciudades para ingresar un nuevo
     * registro en la base de datos
     */

    public void addCiudad(Ciudades obj) {
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
     * @param objid Elimina una ciudad con solo pasarle el Id del registro 
     * que se desesa eliminar
     */

    public void deleteCiudad(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Ciudades obj = (Ciudades) session.load(Ciudades.class, new Integer(objid));
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
     * @param obj Recibe un objeto de tipo Ciudades para  ser actualizado,
     * todos los datos del pojo deben estar correctamente diligenciados
     * principalmente el Id para actualizar el registro.
     */
    public void updateCiudad(Ciudades obj) {
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
     * @param ciudad Necesita el nombre de la ciudad que desea buscar
     * @param pais Código del país que corresponde a la ciudad
     * @return si la ciudad y el código del país corresponden retorna todos los
     * datos de la ciudad solicitada
     */
    
    public Ciudades getCiudad(String ciudad, String pais) {
        Ciudades obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Query query = session.createQuery("from Ciudades as ci "
                    + "left join fetch ci.paises "
                    + "where ci.ciudad = :ciudad "
                    + "and ci.paises.codigo = :pais");
            query.setString("ciudad", ciudad);
            query.setString("pais", pais);
            obj = (Ciudades) query.uniqueResult();
            
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    /**
     * @param l es el String que se necesita para buscar cualquier coincidencia
     * en el listado total de ciudades
     * @return si el parámetro corresponde, retorna un máximo de 4 ciudades cómo
     * sugerencia
     */
    public List<Ciudades> getAllCiudades(String l) {
        List<Ciudades> obj = new ArrayList<Ciudades>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Ciudades as ci "
                    + "left join fetch ci.paises "
                    + "where ci.ciudad like '%"+l+"%'").setMaxResults(4).list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * @param objid Recibe un entero (int) para obtener una ciudad por el id en
     * la base de datos
     * @return Retorna un solo registro  con los datos de la ciudad solicitada.
     */
    public Ciudades getCiudadById(int objid) {
        Ciudades obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Ciudades where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Ciudades) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
