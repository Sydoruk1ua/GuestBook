package ua.in.sydoruk.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class UserDAO {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        // System.out.println(getAllUsers());
        User user = new User();
        user.setFirstName("Олександр");
        user.setLastName("Судорук");
        user.setBirthday(Date.valueOf("1992-1-10"));
        user.setPhoneNumber("(097)315-3602");
        user.setEmail("sydoruk1ua@gmail.com");
        user.setCountry("Ukraine");
        user.setRegion("Vinnytsia");
        addUser(user);
    }

    private static Connection getConnection() throws ClassNotFoundException, SQLException {
        Properties p = new Properties();
        Connection connection = null;
        try (InputStream in = UserDAO.class.getClassLoader().getResourceAsStream("config.properties")) {
            p.load(in);
            Class.forName(p.getProperty("db.driver"));
            connection = DriverManager.getConnection((p.getProperty("db.url") + p.getProperty("db.name")),
                    p.getProperty("db.username"), p.getProperty("db.password"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        try (Connection c = getConnection();
             ResultSet resultSet = c.createStatement().executeQuery("SELECT * FROM users");) {
            while (resultSet.next()) {
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

    public static int addUser(User user) {
        int status = 0;

        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement("INSERT INTO users(firstName, lastName, birthday, phoneNumber," +
                     " email, country, region ) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setDate(3, new Date(user.getBirthday().getTime()));
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getCountry());
            ps.setString(7, user.getRegion());

            status = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return status;
    }

}
