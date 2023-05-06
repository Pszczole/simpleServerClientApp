import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Server {
    private ServerSocket serverSocket;
    private Socket clientSocket;
    private PrintWriter out;
    private InputStreamReader in;
    public void start(int port) throws IOException {

        serverSocket = new ServerSocket(port);
        clientSocket = serverSocket.accept();
        in = new InputStreamReader(clientSocket.getInputStream());
        out = new PrintWriter(clientSocket.getOutputStream());
        System.out.println("Client connected ");
    }

    public int getId() throws IOException {
        int id = in.read();
        System.out.println("Client id:"+id);
        return id;
    }

    public void stop() throws IOException {
        in.close();
        out.close();
        clientSocket.close();
        serverSocket.close();
    }

    public static void main(String[] args) throws IOException, SQLException {

        DbFunctionality db = new DbFunctionality();

        //Establish  connection with our database
        Connection conn = db.connect_to_db("insuranceCompany","postgres","root");

        Server server = new Server();
        server.start(4951);
        int id = server.getId();

        ResultSet data = db.readData(conn, id);

        while(data.next()){
            System.out.print(data.getString("id")+" ");
            System.out.print(data.getString("nick")+" ");
            System.out.println(data.getString("login")+" ");
        }

        server.stop();

    }
}
