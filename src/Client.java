import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client {
    private Socket clientSocket;
    private PrintWriter out;
    private BufferedReader in;
    public void startConnection(String ip, int port) throws IOException {
        clientSocket = new Socket(ip, port);
        out = new PrintWriter(clientSocket.getOutputStream());
        in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    }

    public void sendIp(){
        Scanner clientInput = new Scanner(System.in);
        System.out.println("Enter user id!");
        out.write(clientInput.nextInt());
        out.flush();
    }

    public static void main(String[] args) throws IOException {

            Client client = new Client();
            client.startConnection("localhost",4951);
            client.sendIp();

    }
}
