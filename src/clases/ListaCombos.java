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
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author Oficina
 */
public class ListaCombos {
    
    /*CallableStatement cst;
    Connection con=null;
    ResultSet rs;*/
    
    
    public static int[] listaCategoria(JComboBox cboCategoria, int[] idCat){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        idCat=new int[2];
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
        return idCat;
    }
    
    
    public static int[] listaMarca(JComboBox cboMarca, int[] idMarc){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        idMarc=new int[2];
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
                //System.out.println(idMarc.length);
                i++;
            }
            //resizeArray(idMarc.length, idMarc);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return idMarc;
    }
    
    public static int[] listaProdxCat(JComboBox cbo, int[] id, int idCat){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraProdxCat (?)}");
            cst.setInt(1,idCat);
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static int[] listaProductos(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
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
            System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    
    public static int[] listaProductos(DefaultTableModel modelo, int[] id, int idAlmac, boolean band){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        //modelo.removeRow(0);
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraDatosProdxIDAlmac (?)}");
            cst.setInt(1,idAlmac);
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                if (band){
                    modelo.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getDouble(12)});
                }
                else modelo.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(4),rs.getString(5),""});
                
                id[i]=rs.getInt(13);
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
        return id;
    }
    
    public static RetornaIDRutaProd listaProductosBusq(DefaultTableModel modelo, int[] id,String[] ruta, String serie, String prod, int idAlmac){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        RetornaIDRutaProd retorna;
        id=new int[2];
        ruta=new String[2];
        //modelo.removeRow(0);
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraDatosBusqProd (?,?,?)}");
            cst.setString(1,serie);
            cst.setString(2,prod);
            cst.setInt(3,idAlmac);
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                modelo.addRow(new Object[]{rs.getString(1),rs.getDouble(12),rs.getString(3),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7)});
                id[i]=rs.getInt(11);
                ruta[i]=rs.getString(10);
                id = redimArray.resizeArray(id.length+1,id);
                ruta=redimArray.resizeArrayStr(ruta.length+1,ruta);
                i++;
            }
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        
        retorna=new RetornaIDRutaProd(id, ruta);
        
        return retorna;
    }
    
    public static class RetornaIDRutaProd{
        int[] idProd;
        String[] Ruta;

        public RetornaIDRutaProd(int[] idProd, String[] Ruta) {
            this.idProd = idProd;
            this.Ruta = Ruta;
        }

        public int[] getIdProd() {
            return idProd;
        }

        public void setIdProd(int[] idProd) {
            this.idProd = idProd;
        }

        public String[] getRuta() {
            return Ruta;
        }

        public void setRuta(String[] Ruta) {
            this.Ruta = Ruta;
        }

        
    }
    
    public static int[] listaProveedores(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraProveedores ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static int[] listaEmpresas(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraEmpresas ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static RetornaNomApellIDTrab listaTrabSinUser(JComboBox cbo, int[] id, String[]nom, String[] apell){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        RetornaNomApellIDTrab retorna;
        
        id=new int[2];
        nom=new String[2];
        apell=new String[2];
        
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraTrabSinUser ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2)+" "+rs.getString(3));
                id[i]=rs.getInt(1);
                //System.out.println("tamaño actual: "+id.length);
                //System.out.println("indice: "+i);
                //System.out.println(rs.getString(2).charAt(0)+""+rs.getString(2).charAt(1));
                nom[i]= rs.getString(2).charAt(0)+""+rs.getString(2).charAt(1);
                //System.out.println(rs.getString(2).charAt(0)+""+rs.getString(2).charAt(1));
                apell[i]= rs.getString(3).charAt(0)+""+rs.getString(3).charAt(1);
                //System.out.println(rs.getString(3));
                id = redimArray.resizeArray(id.length+1,id);
                nom = redimArray.resizeArrayStr(nom.length+1,nom);
                apell = redimArray.resizeArrayStr(apell.length+1,apell);
                //System.out.println("nuevo tamaño: "+id.length);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        
        retorna=new RetornaNomApellIDTrab(nom, apell, id);
        
        return retorna;
    }
    
    public static class RetornaNomApellIDTrab{
        String[] nombre;
        String[] apellidos;
        int[] id;
        
        public RetornaNomApellIDTrab(String[] nom, String[] apell, int[] id){
            nombre=nom;
            apellidos=apell;
            this.id=id;
        }

        public String[] getNombre() {
            return nombre;
        }

        public void setNombre(String[] nombre) {
            this.nombre = nombre;
        }

        public String[] getApellidos() {
            return apellidos;
        }

        public void setApellidos(String[] apellidos) {
            this.apellidos = apellidos;
        }

        public int[] getId() {
            return id;
        }

        public void setId(int[] id) {
            this.id = id;
        }
               
    }
    
    public static class RetornaDatosPedido{
        String[] nombre;
        String[] fechas;
        int[] id;

        public RetornaDatosPedido(String[] nombre, String[] fechas, int[] id) {
            this.nombre = nombre;
            this.fechas = fechas;
            this.id = id;
        }
        
        public String[] getFechas() {
            return fechas;
        }

        public void setFechas(String[] fechas) {
            this.fechas = fechas;
        }
        
        public String[] getNombre() {
            return nombre;
        }

        public void setNombre(String[] nombre) {
            this.nombre = nombre;
        }

        public int[] getId() {
            return id;
        }

        public void setId(int[] id) {
            this.id = id;
        }      
        
    } 
    
    public static class RetornaDatosCompra{
        String[] nomProv;
        int[] idProv;
        int[] idCompr;

        public RetornaDatosCompra(String[] nomProv, int[] idProv, int[] idCompr) {
            this.nomProv = nomProv;
            this.idProv = idProv;
            this.idCompr = idCompr;
        }

        public String[] getNomProv() {
            return nomProv;
        }

        public void setNomProv(String[] nomProv) {
            this.nomProv = nomProv;
        }

        public int[] getIdProv() {
            return idProv;
        }

        public void setIdProv(int[] idProv) {
            this.idProv = idProv;
        }

        public int[] getIdCompr() {
            return idCompr;
        }

        public void setIdCompr(int[] idCompr) {
            this.idCompr = idCompr;
        }
        
    }
    
    public static RetornaDatosPedido listaPedidos(JComboBox cbo,  String[] nom, String[] fechas, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        RetornaDatosPedido retorna;
        
        id=new int[2];
        nom=new String[2];
        fechas=new String[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraPedidos ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                nom[i]= rs.getString(3);
                fechas[i]=rs.getString(4)+"";
                id = redimArray.resizeArray(id.length+1,id);
                nom = redimArray.resizeArrayStr(nom.length+1,nom);
                fechas = redimArray.resizeArrayStr(fechas.length+1,fechas);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        
        retorna=new RetornaDatosPedido(nom, fechas, id);
        
        return retorna;
    }
    
    public static int[] listaTrabajadores(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraTrab ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static int[] listaUsuarios(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraUsuarios ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                //System.out.println(""+rs.getString(2));
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static int[] listaAlmacen(JComboBox cbo, int[] id){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        id=new int[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraAlmacen ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                //System.out.println(""+rs.getString(2));
                cbo.addItem(rs.getString(2));
                id[i]=rs.getInt(1);
                id = redimArray.resizeArray(id.length+1,id);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        return id;
    }
    
    public static RetornaDatosCompra listaCompras(JComboBox cbo,String[] nomProv,int[] idProv, int[] idCompr){
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        RetornaDatosCompra retorna;
        
        idProv=new int[2];
        idCompr=new int[2];
        nomProv=new String[2];
        cbo.removeAllItems();
        cbo.addItem("Seleccione..");
        int i=1;
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraCompras ()}");
            cst.execute();
            
            rs= cst.getResultSet();
            
            while(rs.next()){
                cbo.addItem(rs.getString(1));
                idCompr[i]=rs.getInt(2);
                idProv[i]= rs.getInt(3);
                nomProv[i]=rs.getString(4)+"";
                idCompr = redimArray.resizeArray(idCompr.length+1,idCompr);
                idProv = redimArray.resizeArray(idProv.length+1,idProv);
                nomProv = redimArray.resizeArrayStr(nomProv.length+1,nomProv);
                i++;
            }
            //System.out.println(id.length);
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
        
        retorna=new RetornaDatosCompra(nomProv, idProv, idCompr);
        
        return retorna;
    }
}
