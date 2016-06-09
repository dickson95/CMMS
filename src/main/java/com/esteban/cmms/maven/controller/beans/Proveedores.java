package com.esteban.cmms.maven.controller.beans;
// Generated 8/06/2016 05:45:52 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Proveedores generated by hbm2java
 */
public class Proveedores  implements java.io.Serializable {


     private Integer id;
     private Ciudades ciudades;
     private String nombreCompania;
     private String telefono;
     private String direccion;
     private String codigoPostal;
     private String email;
     private String paginaWeb;
     private long saldoAdeudado;
     private String descripcionProducto;
     private String estado;
     private Date fchUltAction;
     private String userAction;
     private Set maquinases = new HashSet(0);
     private Set vendedoreses = new HashSet(0);

    public Proveedores() {
    }

	
    public Proveedores(Integer id) {
        this.id = id;
    }

    public Proveedores(Ciudades ciudades, String nombreCompania, String telefono,
            String direccion, String codigoPostal, String email, String paginaWeb,
            long saldoAdeudado, String descripcionProducto, String estado,
            String userAction) {
        this.ciudades = ciudades;
        this.nombreCompania = nombreCompania;
        this.telefono = telefono;
        this.direccion = direccion;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.paginaWeb = paginaWeb;
        this.saldoAdeudado = saldoAdeudado;
        this.descripcionProducto = descripcionProducto;
        this.estado = estado;
        this.userAction = userAction;
    }

    public Proveedores(Integer id, String nombreCompania, String telefono,
            String direccion, String codigoPostal, String email, String paginaWeb,
            long saldoAdeudado, String descripcionProducto,Ciudades ciudades, String estado,
            String userAction) {
        this.id = id;
        this.nombreCompania = nombreCompania;
        this.telefono = telefono;
        this.direccion = direccion;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.paginaWeb = paginaWeb;
        this.saldoAdeudado = saldoAdeudado;
        this.descripcionProducto = descripcionProducto;
        this.ciudades = ciudades;
        this.estado = estado;
        this.userAction = userAction;
    }

    public Proveedores(Ciudades ciudades, String nombreCompania, String telefono,
            String direccion, String codigoPostal, String email, String paginaWeb,
            long saldoAdeudado, String descripcionProducto, String estado,
            Date fchUltAction, String userAction, Set maquinases, Set vendedoreses) {
        this.ciudades = ciudades;
        this.nombreCompania = nombreCompania;
        this.telefono = telefono;
        this.direccion = direccion;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.paginaWeb = paginaWeb;
        this.saldoAdeudado = saldoAdeudado;
        this.descripcionProducto = descripcionProducto;
        this.estado = estado;
        this.fchUltAction = fchUltAction;
        this.userAction = userAction;
        this.maquinases = maquinases;
        this.vendedoreses = vendedoreses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Ciudades getCiudades() {
        return this.ciudades;
    }
    
    public void setCiudades(Ciudades ciudades) {
        this.ciudades = ciudades;
    }
    public String getNombreCompania() {
        return this.nombreCompania;
    }
    
    public void setNombreCompania(String nombreCompania) {
        this.nombreCompania = nombreCompania;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCodigoPostal() {
        return this.codigoPostal;
    }
    
    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPaginaWeb() {
        return this.paginaWeb;
    }
    
    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }
    public long getSaldoAdeudado() {
        return this.saldoAdeudado;
    }
    
    public void setSaldoAdeudado(long saldoAdeudado) {
        this.saldoAdeudado = saldoAdeudado;
    }
    public String getDescripcionProducto() {
        return this.descripcionProducto;
    }
    
    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Date getFchUltAction() {
        return this.fchUltAction;
    }
    
    public void setFchUltAction(Date fchUltAction) {
        this.fchUltAction = fchUltAction;
    }
    public String getUserAction() {
        return this.userAction;
    }
    
    public void setUserAction(String userAction) {
        this.userAction = userAction;
    }
    public Set getMaquinases() {
        return this.maquinases;
    }
    
    public void setMaquinases(Set maquinases) {
        this.maquinases = maquinases;
    }
    public Set getVendedoreses() {
        return this.vendedoreses;
    }
    
    public void setVendedoreses(Set vendedoreses) {
        this.vendedoreses = vendedoreses;
    }




}

