package com.esteban.cmms.maven.controller.beans;
// Generated 8/06/2016 05:45:52 PM by Hibernate Tools 4.3.1



/**
 * Clientes generated by hbm2java
 */
public class Clientes  implements java.io.Serializable {


     private int id;
     private String nombre;
     private String telefono;
     private String documento;
     private String foto;

    public Clientes() {
    }

	
    public Clientes(int id, String nombre, String telefono, String documento) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.documento = documento;
    }
    public Clientes(int id, String nombre, String telefono, String documento, String foto) {
       this.id = id;
       this.nombre = nombre;
       this.telefono = telefono;
       this.documento = documento;
       this.foto = foto;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getDocumento() {
        return this.documento;
    }
    
    public void setDocumento(String documento) {
        this.documento = documento;
    }
    public String getFoto() {
        return this.foto;
    }
    
    public void setFoto(String foto) {
        this.foto = foto;
    }




}

