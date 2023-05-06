import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbFunctionality {
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

    public ResultSet readData(Connection conn, int id){
        Statement statement;
        ResultSet resultSet = null;
        try{
            String query = String.format("select id,nick,login from users");
            statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

        }catch (Exception e){
            System.out.println(e);
        }

        return resultSet;
    }
}
