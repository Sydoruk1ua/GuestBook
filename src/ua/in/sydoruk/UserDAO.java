package ua.in.sydoruk;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
       // System.out.println(getAllUsers());
        User user = new User();
        user.setFirstName("Oleksandr3");
        user.setLastName("Sydoruk");
        user.setBirthday(Date.valueOf("1992-1-10"));
        user.setPhoneNumber("(097)315-3602");
        user.setEmail("sydoruk1ua@gmail.com");
        user.setCountry("Ukraine");
        user.setRegion("Vinnytsia");
        addUser(user);
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver"); // todo add properties file, and do it all through properties
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
        return connection;
    }

    public static List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        try(Connection c = getConnection();
            ResultSet resultSet = c.createStatement().executeQuery("SELECT * FROM users");){
            while (resultSet.next()){
                User user = new User();
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                user.setRegion(resultSet.getString("region"));
                users.add(user);
            }
        }
        return users;
    }

    public static void addUser (User user) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement("INSERT INTO users(firstName, lastName, birthday, phoneNumber," +
                     " email, country, region ) VALUES (?, ?, ?, ?, ?, ?, ?)");){
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setDate(3, new Date(user.getBirthday().getTime()));
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getCountry());
            ps.setString(7, user.getRegion());

            ps.executeUpdate();

        }

    }
}
