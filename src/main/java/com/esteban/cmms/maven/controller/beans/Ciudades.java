package com.esteban.cmms.maven.controller.beans;
// Generated 8/06/2016 05:45:52 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Ciudades generated by hbm2java
 */
public class Ciudades implements java.io.Serializable {

    private Integer idCiudades;
    private Paises paises;
    private String ciudad;
    private Set proveedoreses = new HashSet(0);

    public Ciudades() {
    }

    public Integer getIdCiudades() {
        return idCiudades;
    }

    public void setIdCiudades(Integer idCiudad) {
        this.idCiudades = idCiudad;
    }

    public Paises getPaises() {
        return paises;
    }

    public void setPaises(Paises paises) {
        this.paises = paises;
    }

    public String getCiudad() {
        return ciudad;
    }
    
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Set getProveedoreses() {
        return this.proveedoreses;
    }

    public void setProveedoreses(Set proveedoreses) {
        this.proveedoreses = proveedoreses;
    }

}
