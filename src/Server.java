import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

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

    public void getId() throws IOException {
        int id = in.read();
        System.out.println("Client id:"+id);
    }

    public void stop() throws IOException {
        in.close();
        out.close();
        clientSocket.close();
        serverSocket.close();
    }

    public static void main(String[] args) throws IOException {

        DbConnection db = new DbConnection();

        //Establish  connection with our database
        db.connect_to_db("insuranceCompany","postgres","root");

        Server server = new Server();
        server.start(4951);
        server.getId();

    }
}
