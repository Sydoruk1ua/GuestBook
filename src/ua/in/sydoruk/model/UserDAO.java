package ua.in.sydoruk.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class UserDAO {
    private int noOfRecords;

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

    public List<User> viewAllUsers(int offset, int noOfRecords) {
        String query = "select SQL_CALC_FOUND_ROWS * from users limit " + offset + ", " + noOfRecords;
        List<User> users = new ArrayList<>();
        User user = null;

        try (Connection c = getConnection();
             Statement stmt = c.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(query);
            while (resultSet.next()) {
                user = new User();
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                user.setRegion(resultSet.getString("region"));
                users.add(user);
            }
            resultSet.close();
            resultSet = stmt.executeQuery("SELECT FOUND_ROWS()");
            if(resultSet.next())
                this.noOfRecords = resultSet.getInt(1);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

}
