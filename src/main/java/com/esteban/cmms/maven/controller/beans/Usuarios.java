/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller.beans;

import java.util.Date;

/**
 *
 * @author esteban
 */
public class Usuarios {

    private Integer id;
    private String usuario;
    private String contrasena;
    private String nombre;
    private String estado;
    private Date fch_registro;
    private Roles roles;

    public Usuarios() {
    }

    public Usuarios(String nombre, String usuario, 
            String contrasena, Roles roles, String estado) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.roles = roles;
        this.estado = estado;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFch_registro() {
        return fch_registro;
    }

    public void setFch_registro(Date fch_registro) {
        this.fch_registro = fch_registro;
    }
    
    
    
}
