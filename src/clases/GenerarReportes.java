package clases;

import Conexion.Conexion;
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
}
