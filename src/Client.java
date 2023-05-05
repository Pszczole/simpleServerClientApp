import java.io.*;
import java.net.*;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {

            Socket s = new Socket("localhost",4951);


            Scanner clientInput = new Scanner(System.in);

            System.out.println("Enter user id!");

            PrintWriter pr = new PrintWriter(s.getOutputStream());
            pr.write(clientInput.nextInt());
            pr.flush();

    }
}
