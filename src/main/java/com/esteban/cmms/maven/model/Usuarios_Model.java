/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Usuarios;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author esteban
 */
public class Usuarios_Model {

    private MessageDigest md;
    private byte[] buffer, digest;
    private String hash = "";

    /**
     * Encripta cadenas de texto
     * @param message cadena de texto que se desea encriptar
     * @return cadena encripatada
     * @throws NoSuchAlgorithmException 
     */
    public String getHash(String message) throws NoSuchAlgorithmException {
        buffer = message.getBytes();
        md = MessageDigest.getInstance("SHA1");
        md.update(buffer);
        digest = md.digest();

        for (byte aux : digest) {
            int b = aux & 0xff;
            if (Integer.toHexString(b).length() == 1) {
                hash += "0";
            }
            hash += Integer.toHexString(b);
        }
        return hash;
    }

    /**
     * Añade un nuevo usuario a la tabla
     *
     * @param obj un objeto de tipo Usuarios correctamente diligenciado, no es
     * necesario suministrar el id para este caso
     */
    public void addUsuario(Usuarios obj) {
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
     * Elimina un usuario de forma definitiva de la tabla en la base de datos
     *
     * @param objid entero que corresponde al registro que quiere eliminar
     */
    public void deleteUsuario(int objid) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Usuarios obj = (Usuarios) session.load(Usuarios.class, new Integer(objid));
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
     * Actualiza un usuario
     *
     * @param obj Objeto de tipo Usuarios, es necesario que el id este incluido
     * en los datos del pojo para una correcta actualización
     */
    public void updateUsuario(Usuarios obj) {
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
     * Veta los usuarios en el sistema para que no tengan más acceso al mismo
     *
     * @param estado Estado que se le asigna el usuario 'Activo' o 'Vetado'
     * @param id entero correspondiente al registro en la base de datos
     */
    public void vetarUsuario(String estado, Integer id) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Query query = session.createQuery("UPDATE Usuarios "
                    + "SET Estado = :estado "
                    + "WHERE Id = :id");
            query.setString("estado", estado);
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
     * Obtiene una lista de los usuarios con estado activo
     *
     * @return lista de usuarios con los datos correspondientes
     */
    public List<Usuarios> getAllUsuarios() {
        List<Usuarios> obj = new ArrayList<Usuarios>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Usuarios as user"
                    + " left join fetch user.roles "
                    + "ORDER BY user.estado").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene una lista de los usuarios con estado inactivo
     *
     * @return lista de usuarios con los datos correspondientes
     */
    public List<Usuarios> listNoActive() {
        List<Usuarios> obj = new ArrayList<Usuarios>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            obj = session.createQuery("from Usuarios").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }

    /**
     * Obtiene un único registro de la base de datos en la tabla Usuarios, deben
     * coincidir en detalle los datos con los de los registros
     *
     * @param usuario nombre de usuario para buscar en la base de datos, es un
     * parámetro case sensitive
     * @param contrasena nombre de usuario para buscar en la base de datos, es
     * un parámetro case sensitive
     * @return un único resultado tipo Usuarios con los datos del registro.
     */
    public Object getUsuarioByUC(String usuario, String contrasena) {
        Object obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Usuarios as users"
                    + " left join fetch users.roles"
                    + " where users.usuario = :usuario and"
                    + " users.contrasena = :contrasena and"
                    + " users.estado = 'Activo'";
            Query query = session.createQuery(queryString);
            query.setString("usuario", usuario);
            query.setString("contrasena", contrasena);
            obj = query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
    
    /**
     *Obtiene un registro de la tabla usuarios con todos sus datos
     * @param objid un entero para encontrar un único registro que corresponda
     * @return si corresponde, un objeto usuarios con la información
     */
    public Usuarios getUsuarioById(int objid) {
        Usuarios obj = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Usuarios as users"
                    + " left join fetch users.roles"
                    + " where users.id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", objid);
            obj = (Usuarios) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return obj;
    }
}
