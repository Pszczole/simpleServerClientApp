import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public static void main(String[] args) throws IOException {

        DbConnection db = new DbConnection();

        //Establish  connection with our database
        db.connect_to_db("insuranceCompany","postgres","root");

        ServerSocket ss = new ServerSocket(4951);
        Socket s = ss.accept();

        System.out.println("Client connected ");

        InputStreamReader in = new InputStreamReader(s.getInputStream());
        int id = in.read();

        System.out.println("Client id:"+id);



    }
}
