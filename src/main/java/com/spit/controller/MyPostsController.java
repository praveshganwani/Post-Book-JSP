/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spit.controller;

import com.spit.model.Post;
import com.spit.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Pravesh Ganwani
 */

@WebServlet("/MyPostsController")
public class MyPostsController extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Post p = new Post();
        HttpSession hs = req.getSession();
        User u = (User)hs.getAttribute("user");
        p.setUserId(u.getUserId());
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
        p.setPostId("POST" + randomNumber + randomCharacters);
        p.setPost(req.getParameter("post"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/postbook_db?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("insert into posts (userid, postid, post) values(?,?,?)");
            ps.setString(1, p.getUserId());
            ps.setString(2, p.getPostId());
            ps.setString(3, p.getPost());
            ps.executeUpdate();
            con.close();
            resp.sendRedirect("posts.jsp");
        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Post> allPosts = new ArrayList<Post>();
        HttpSession hs = req.getSession();
        User u = (User)hs.getAttribute("user");
        String userId = u.getUserId();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/postbook_db?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
            PreparedStatement ps = con.prepareStatement("select * from posts where userid=?");
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Post p = new Post();
                p.setUserId(u.getUserName());
                p.setPostId(rs.getString("postid"));
                p.setPost(rs.getString("post"));
                allPosts.add(p);
            }
            hs.setAttribute("myPosts", allPosts);
            con.close();
        } catch (Exception e) {
        }
    }
}
