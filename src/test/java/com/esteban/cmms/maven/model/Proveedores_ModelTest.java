/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esteban.cmms.maven.model;

import com.esteban.cmms.maven.controller.beans.Proveedores;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;

/**
 *
 * @author esteban
 */
public class Proveedores_ModelTest {
    
    public Proveedores_ModelTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of addProveedor method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testAddProveedor() {
        System.out.println("addProveedor");
        Proveedores obj = null;
        Proveedores_Model instance = new Proveedores_Model();
        instance.addProveedor(obj);
    }

    /**
     * Test of deleteProveedor method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testDeleteProveedor() {
        System.out.println("deleteProveedor");
        int objid = 0;
        Proveedores_Model instance = new Proveedores_Model();
        instance.deleteProveedor(objid);
    }

    /**
     * Test of updateProveedor method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testUpdateProveedor() {
        System.out.println("updateProveedor");
        Proveedores obj = null;
        Proveedores_Model instance = new Proveedores_Model();
        instance.updateProveedor(obj);
    }

    /**
     * Test of getAllProveedores method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testGetAllProveedores() {
        System.out.println("getAllProveedores");
        Proveedores_Model instance = new Proveedores_Model();
        List<Proveedores> expResult = null;
        List<Proveedores> result = instance.getAllProveedores();
        assertEquals(expResult, result);
    }

    /**
     * Test of listNoActive method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testListNoActive() {
        System.out.println("listNoActive");
        Proveedores_Model instance = new Proveedores_Model();
        List<Proveedores> expResult = null;
        List<Proveedores> result = instance.listNoActive();
        assertEquals(expResult, result);
    }

    /**
     * Test of getProveedorById method, of class Proveedores_Model.
     */
    @org.junit.Test
    public void testGetProveedorById() {
        System.out.println("getProveedorById");
        int objid = 0;
        Proveedores_Model instance = new Proveedores_Model();
        Proveedores expResult = null;
        Proveedores result = instance.getProveedorById(objid);
        assertEquals(expResult, result);
    }
    
}
