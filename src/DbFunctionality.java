import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbFunctionality {

    //Starting connection with the database
    public Connection connect_to_db(String dbName, String user, String pass){

        Connection conn = null;

        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+dbName, user, pass);
            if(conn!=null){
                System.out.println("Connected to the database!");
            }else{
                System.out.println("Not connected!");
            }

        }catch (Exception e){
            System.out.println(e);
        }

        return conn;
    }

    //Reading data from our database
    public ResultSet readData(Connection conn, int id){
        Statement statement;
        ResultSet resultSet = null;
        try{
            String query = String.format("SELECT  insurer, price, v.brand, v.model\n" +
                    "\tFROM public.insurance_offers as io\n" +
                    "\tINNER JOIN vehicles as v \n" +
                    "\ton v.id = io.vehicle_id\n" +
                    "\tINNER JOIN users as u \n" +
                    "\ton u.login = v.login \n" +
                    "\tWHERE u.id = "+id);
            statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

        }catch (Exception e){
            System.out.println(e);
        }

        return resultSet;
    }
}
