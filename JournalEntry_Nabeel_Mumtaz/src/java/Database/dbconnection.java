
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbconnection {
   
    public static ArrayList<String> title = new ArrayList();
    public static ArrayList<Timestamp> postdate = new ArrayList();
    public static ArrayList<String> content = new ArrayList();
    private static String url = "jdbc:mysql://localhost:3306/journalentry";

    public static void InsertData() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection(url, "root", "");
        String sql = "INSERT INTO `journalentry`.`journalentry` (`PostDate`, `Title`, `Content`) VALUES (NOW(), ?, ''); ";

        PreparedStatement preparedStatement
                = c.prepareStatement(sql);
        if(!Database.object.getEntry().isEmpty()){
        preparedStatement.setString(1, Database.object.getEntry().replaceAll("\\s", ""));

         preparedStatement.executeUpdate();
        }
        c.close();
        preparedStatement.close();

    }

    public static void retrievaldata() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection(url, "root", "");

        String sql = "SELECT * FROM JOURNALENTRY ";
        PreparedStatement preparedStatement
                = c.prepareStatement(sql);

        ResultSet result = preparedStatement.executeQuery();

        while (result.next()) {

            String titles = result.getString("Title");
            title.add(titles);
            Timestamp date = result.getTimestamp("POSTDATE");
            postdate.add(date);
            String contents=result.getString("Content");
            content.add(contents);
        }
        c.close();
        preparedStatement.close();
    }

    public static void update() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection(url, "root", "");

        String sql = "UPDATE `journalentry` SET `PostDate`=Now(),`Content`=? WHERE title=?";
        PreparedStatement preparedStatement
                = c.prepareStatement(sql);

        preparedStatement.setString(1, Database.object.getcontent());
        preparedStatement.setString(2, Database.moreandmoreobject.getUpdate());

        preparedStatement.executeUpdate();
        c.close();
        preparedStatement.close();
    }

    public static void del() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection(url, "root", "");
        String sql = "DELETE FROM JOURNALENTRY Where Title=? ";

        PreparedStatement preparedStatement
                = c.prepareStatement(sql);

        String d = Database.moreobject.getDel();

        preparedStatement.setString(1, d);

        preparedStatement.executeUpdate();
        c.close();
        preparedStatement.close();
    }
 
public static void main(String [ ] args)
{
        try {
            del();
        } catch (Exception ex) {
           System.out.println(ex.getMessage());
        
        }
}
}
