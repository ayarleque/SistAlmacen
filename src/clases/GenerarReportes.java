package clases;

import Conexion.Conexion;
import java.util.Date;
import java.util.HashMap;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

 public class GenerarReportes {
    static String rutaOrigen="C:\\anthony\\GITHUB\\SistAlmacen\\src\\Reportes";
    public void RptListarProd(){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaProducto.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("idCat", "1");
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Reporte");
                jviewer.setVisible(true);

            } catch (JRException e) {
                
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarDiferencias(int idAlmac){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaDiferencias.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("idalmac", idAlmac);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Diferencias");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarIngresoProd(Date desde, Date hasta){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaIngresoProd.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("desde", desde);
                parametro.put("hasta", hasta);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Ingreso de Productos");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarSalidaProd(Date desde, Date hasta){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaSalidaProd.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("desde", desde);
                parametro.put("hasta", hasta);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Salida de Productos");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarMovProdID(Date desde, Date hasta, int idProd){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaMovProdID.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("desde", desde);
                parametro.put("hasta", hasta);
                parametro.put("idProd", idProd);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Movimiento de un Producto");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarKardex(Date desde, Date hasta){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaMovProdRango.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("desde", desde);
                parametro.put("hasta", hasta);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Kardex");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarPorductos(){
        try {
            String RutaInforme = rutaOrigen + "\\RptLevantaInfo.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("idCat", 1);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Kardex");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarProdxCat(int idCat){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaProdxCat.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("idCat", idCat);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Kardex");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarProdxMarca(int idMarc){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaProdxMarca.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("idMarca", idMarc);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Kardex");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarProdxStock(double stock){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaProdxStock.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("stock", stock);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Kardex");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    public static void RptListarSalidaProdxTrab(Date desde, Date hasta, int idTrab){
        try {
            String RutaInforme = rutaOrigen + "\\RptListaSalidaProdxTrab.jasper";
            HashMap parametro = new HashMap();

            try {
                parametro.put("fecha", desde);
                parametro.put("hasta", hasta);
                parametro.put("idTrab", idTrab);
                JasperPrint informe = JasperFillManager.fillReport(RutaInforme, parametro,Conexion.getconnection() );
                JasperViewer jviewer = new JasperViewer(informe,false);
                jviewer.setTitle("Lista de Salida de Productos por Trabajador");
                jviewer.setVisible(true);
                

            } catch (JRException e) {
                JOptionPane.showMessageDialog(null, "Error: "+e);
            }
            
            
        } catch (Exception e) {
        }
    }
    
    
}
