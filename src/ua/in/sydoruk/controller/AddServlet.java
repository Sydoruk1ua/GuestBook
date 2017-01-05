package ua.in.sydoruk.controller;

import ua.in.sydoruk.model.User;
import ua.in.sydoruk.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "AddServlet", urlPatterns = "/")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        try(PrintWriter out = response.getWriter()) {
            User user = new User();
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setBirthday(Date.valueOf(request.getParameter("birthday")));
            user.setPhoneNumber(request.getParameter("phoneNumber"));
            user.setEmail(request.getParameter("email"));
            user.setCountry(request.getParameter("country"));
            user.setRegion(request.getParameter("region"));
            int status = UserDAO.addUser(user);
            if (status > 0) {
                out.print("<p style=\"color: green\"> User added successfully!</p>");
                request.getRequestDispatcher("WEB-INF/view/addUser.jsp").include(request, response);
            } else {
                out.println("<p  style=\"color: red\">Sorry! Unable to add user. Try again</p>");
                request.getRequestDispatcher("WEB-INF/view/addUser.jsp").include(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addUser.jsp").include(request, response);

    }
}
