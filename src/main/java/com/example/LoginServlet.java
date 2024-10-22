package com.example;

import com.example.util.JDBCUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getCharacterEncoding();
        response.getCharacterEncoding();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//      ' OR '1'='1

        try (Connection connection = JDBCUtil.getConnection()) {
            // Use a prepared statement to prevent SQL injection
//            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            Statement statement = connection.createStatement();
            String query1 = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
            ResultSet resultSet = statement.executeQuery(query1);
            
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, username);
//            preparedStatement.setString(2, password);
//
//            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Set the username and password as request attributes
                request.setAttribute("username", username);
                request.setAttribute("password", password);

                // Forward the request to success.jsp
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                response.getWriter().println("<script>alert('Vui lòng nhập đúng mật khẩu.');</script>");
                response.getWriter().println("<script>window.location.href = 'login.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi kết nối cơ sở dữ liệu.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
