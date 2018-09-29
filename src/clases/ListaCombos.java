/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import Conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author Oficina
 */
public class ListaCombos {
    
    /*CallableStatement cst;
    Connection con=null;
    ResultSet rs;*/
    
    
    public static void listaCategoria(JComboBox cboCategoria, int[] idCat){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
    
        int i=1;
        cboCategoria.removeAllItems();
        cboCategoria.addItem("Seleccione..");
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraCategoria ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cboCategoria.addItem(rs.getString(2));
                idCat[i]=rs.getInt(1);
                idCat = redimArray.resizeArray(idCat.length+1,idCat);
                i++;
            }
            
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
    }
    
    
    public static void listaMarca(JComboBox cboMarca, int[] idMarc){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        cboMarca.removeAllItems();
        cboMarca.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraMarca ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cboMarca.addItem(rs.getString(2));
                idMarc[i]=rs.getInt(1);
                idMarc = redimArray.resizeArray(idMarc.length+1,idMarc);
                i++;
            }
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
    }
    
    public static void listaProductos(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraProd ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
    }
}
