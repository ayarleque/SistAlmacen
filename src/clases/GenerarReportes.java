package clases;

import Conexion.Conexion;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

 public class GenerarReportes {
    
    public void RptListarProd(){
        try {
            String RutaInforme = "C:\\anthony\\GIT\\SistAlmacen\\src\\Reportes\\RptListaProducto.jasper";
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
}
