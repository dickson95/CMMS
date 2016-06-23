/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.controller.beans;

import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author esteban
 */
public class Roles {

    private Integer id;
    private String rol;
    private boolean tipos;
    private boolean localizaciones;
    private boolean secciones;
    private boolean proveedores;
    private boolean vendedores;
    private boolean imagenes;
    private boolean documentos;
    private boolean maquinas;
    private boolean usuarios;
    private Set usuarioses = new HashSet(0);

    public Roles() {
    }

    public Roles(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public boolean getTipos() {
        return tipos;
    }

    public void setTipos(boolean tipos) {
        this.tipos = tipos;
    }

    public boolean getLocalizaciones() {
        return localizaciones;
    }

    public void setLocalizaciones(boolean localizaciones) {
        this.localizaciones = localizaciones;
    }

    public boolean getSecciones() {
        return secciones;
    }

    public void setSecciones(boolean secciones) {
        this.secciones = secciones;
    }

    public boolean getProveedores() {
        return proveedores;
    }

    public void setProveedores(boolean proveedores) {
        this.proveedores = proveedores;
    }

    public boolean getVendedores() {
        return vendedores;
    }

    public void setVendedores(boolean vendedores) {
        this.vendedores = vendedores;
    }

    public boolean getImagenes() {
        return imagenes;
    }

    public void setImagenes(boolean imagenes) {
        this.imagenes = imagenes;
    }

    public boolean getDocumentos() {
        return documentos;
    }

    public void setDocumentos(boolean documentos) {
        this.documentos = documentos;
    }

    public boolean getMaquinas() {
        return maquinas;
    }

    public void setMaquinas(boolean maquinas) {
        this.maquinas = maquinas;
    }

    public boolean getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(boolean usuarios) {
        this.usuarios = usuarios;
    }

    public Set getUsuarioses() {
        return usuarioses;
    }

    public void setUsuarioses(Set usuarioses) {
        this.usuarioses = usuarioses;
    }
}
