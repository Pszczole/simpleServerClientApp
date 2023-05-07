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

    //Starting the server
    public void start(int port) throws IOException {

        serverSocket = new ServerSocket(port);
        clientSocket = serverSocket.accept();
        in = new InputStreamReader(clientSocket.getInputStream());
        out = new PrintWriter(clientSocket.getOutputStream());
    }

    //Reading data from client
    public int getId() throws IOException {
        return in.read();
    }

    //Converting ResultSet data to String
    public String convertDataToString(ResultSet data) throws SQLException {

        StringBuilder clientData = new StringBuilder("Brand  Model  Insurer  Price \n");

        while(data.next()){
            clientData.append(data.getString("brand")+" ");
            clientData.append(data.getString("model")+" ");
            clientData.append(data.getString("insurer")+" ");
            clientData.append(data.getString("price")+"zł \n");
        }


        return clientData.toString();
    }

    //Sending data to a client
    public void sendData(String clientData){
        out.write(clientData);
        out.flush();
    }

    //Server shutdown
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

        //Reading data from database
        ResultSet data = db.readData(conn, id);

        String clientData = server.convertDataToString(data);

        server.sendData(clientData);

        server.stop();

    }
}
