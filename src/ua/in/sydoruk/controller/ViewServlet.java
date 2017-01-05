package ua.in.sydoruk.controller;

import ua.in.sydoruk.model.User;
import ua.in.sydoruk.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewServlet", urlPatterns = "/view")
public class ViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null)
            currentPage = Integer.parseInt(request.getParameter("page"));
        UserDAO dao = new UserDAO();
        List<User> list = dao.viewAllUsers((currentPage - 1) * recordsPerPage,
                recordsPerPage);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        int startPage = currentPage - 5 > 0 ? currentPage - 5 : 1;

        int endPage = startPage + 9;
        if (endPage > noOfPages) {
            endPage = noOfPages;
        }
        request.setAttribute("userList", list);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("prev", currentPage > 1 ? "Previous" : "");
        request.setAttribute("next", currentPage < noOfPages ? "Next" : "");
        request.setAttribute("currentPage", currentPage);
        request.getRequestDispatcher("WEB-INF/view/viewAllUsers.jsp").forward(request, response);

    }
}
