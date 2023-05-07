import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client {
    private Socket clientSocket;
    private PrintWriter out;
    private BufferedReader in;

    //Starting connection with the server
    public void startConnection(String ip, int port) throws IOException {
        clientSocket = new Socket(ip, port);
        out = new PrintWriter(clientSocket.getOutputStream());
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    }

    //Sending our IP to the server
    public void sendIp(){
        Scanner clientInput = new Scanner(System.in);
        System.out.println("Enter user id!");
        out.write(clientInput.nextInt());
        out.flush();
    }

    //Receiving data form the server
    public void getData() throws IOException {
        String line = in.readLine();
        while(line != null){
            System.out.println(line);
            line = in.readLine();
        }
    }

    public static void main(String[] args) throws IOException {

            Client client = new Client();
            client.startConnection("localhost",4951);
            client.sendIp();
            client.getData();

    }
}
