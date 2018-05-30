package baseDato;

// Interfaces != clases
import java.sql.Connection; // Establece la conexión hacia el motor.
/*
Cuando se ejecuta un select, mysql
devuelve una tabla --> ResultSet (tabla virtual)
 */
import java.sql.ResultSet;
import java.sql.DriverManager; // Carga el driver de MySQL
import java.sql.SQLException;
import java.sql.Statement; // Declarar o ejecutar consultas.

/**
 *
 * @author jvergara
 */
public class Conexion {

    private Connection con;
    private Statement sen; // Sentencia o query.
    private ResultSet rs;

    public Conexion(String server, String bd, String user, String pass)
            throws ClassNotFoundException, SQLException {
        String protocolo = "jdbc:mysql://";
        String lineaUser = "user=" + user;
        String lineaPass = "password=" + pass;

        String url = protocolo
                + server + "/"
                + bd + "?"
                + lineaUser + "&"
                + lineaPass;

        System.out.println(url);

        Class.forName("com.mysql.jdbc.Driver"); // importa el JAR.
        con = DriverManager.getConnection(url);
    }

    public static void main(String[] args) {
        try {
            Conexion c = new Conexion("localhost", "sitema_medico", "root", "");
            System.out.println("Todo OK");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
    }

    // INSERT, UPDATE, DELETE, DROP
    // Consultas que no retornen resultados.
    public void ejecutar(String query) throws SQLException {
        System.out.println(query);

        // Statement
        sen = con.createStatement();

        // Ejecución en MySQL
        sen.executeUpdate(query);

        // Cerrar la "Conexión" (flujo)
        close();
    }

    // Todas las consultas que retornen resultados.
    public ResultSet ejecutarSelect(String query) throws SQLException {
        System.out.println(query);
        sen = con.createStatement();
        rs = sen.executeQuery(query);
        return rs;
    }

    public void close() throws SQLException {
        sen.close();
    }
}
