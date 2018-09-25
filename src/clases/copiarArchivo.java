package clases;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Level;

public class copiarArchivo {
    public static void copiarArchivo(String origenArchivo, String destinoArchivo) {
        try {
            Path origenPath = Paths.get(origenArchivo);
            Path destinoPath = Paths.get(destinoArchivo);
            //sobreescribir el fichero de destino si existe y lo copia
            Files.copy(origenPath, destinoPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (FileNotFoundException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage());
        } catch (IOException ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }
}
