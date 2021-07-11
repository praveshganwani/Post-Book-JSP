package com.spit.controller;

import com.spit.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = new User();
        u.setUserEmail(req.getParameter("useremail"));
        u.setUserPassword(req.getParameter("userpassword"));
        HttpSession hs = req.getSession();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/postbook_db?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
            PreparedStatement ps = con.prepareStatement("select * from users where useremail=?");
            ps.setString(1, u.getUserEmail());
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                if(rs.getString("userpassword").equals(u.getUserPassword()))
                {
                    u.setUserId(rs.getString("userid"));
                    u.setUserName(rs.getString("username"));
                    hs.setAttribute("user", u);
                    con.close();
                    resp.sendRedirect("posts.jsp");
                }
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
