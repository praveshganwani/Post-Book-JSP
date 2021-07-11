<%-- 
    Document   : register
    Created on : 14 Sep, 2020, 10:55:34 PM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <section style="margin: 20px 50px;">
            <div class="ui padded fluid container segment">
                <h1 class="ui header center aligned">Register With Us For Free</h1>
                <form action="RegistrationController" method="post" class="ui big form">
                    <div class="two fields">
                        <div class="field">
                          <label>Full Name</label>
                          <input placeholder="Enter Your Name Here" type="text" name="username" required>
                        </div>
                        <div class="field">
                          <label>Email</label>
                          <input placeholder="Enter Your Email Here" type="email" name="useremail" required>
                        </div>
                    </div>
                    <div class="field">
                      <label>Password</label>
                      <input type="password" name="userpassword" placeholder="Enter Your Password" required>
                    </div>
                    <button class="ui positive button" type="submit">Register<i class="chevron circle right icon"></i></button>
                </form>
            </div>
        </section>
    </body>
</html>
