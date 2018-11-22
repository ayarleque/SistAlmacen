package clases;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Level;
import javax.swing.JOptionPane;

public class copiarArchivo {
    public static void copiarArchivo(String origenArchivo, String destinoArchivo) throws IOException {
        try {
            Path origenPath = Paths.get(origenArchivo);
            Path destinoPath = Paths.get(destinoArchivo);
            //sobreescribir el fichero de destino si existe y lo copia
            Files.copy(origenPath, destinoPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (FileNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Error: "+ex);
        }
    }
}
