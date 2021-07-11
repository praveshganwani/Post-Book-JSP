package com.spit.controller;

import com.spit.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = new User();
        u.setUserName(req.getParameter("username"));
        u.setUserEmail(req.getParameter("useremail"));
        u.setUserPassword(req.getParameter("userpassword"));
        String numbers = "123456789";
        Random generator = new Random();
        int randomIndex = generator.nextInt(numbers.length());
        int randomNumber = numbers.charAt(randomIndex);
        StringBuilder randomCharacters = new StringBuilder();
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for(int i=0; i<4; i++)
        {
            Random characterGenerator = new Random();
            randomIndex = characterGenerator.nextInt(characters.length());
            randomCharacters.append(characters.charAt(randomIndex));
        }
        randomNumber = randomNumber*23;
        u.setUserId("USER" + randomNumber + randomCharacters);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/postbook_db?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("insert into users (userid, username, useremail, userpassword) values(?,?,?,?)");
            ps.setString(1, u.getUserId());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPassword());
            ps.executeUpdate();
            con.close();
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
