<%-- 
    Document   : index
    Created on : 14 Sep, 2020, 10:28:11 PM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            session.removeAttribute("user");
            session.invalidate();
        %>
        <jsp:include page="header.jsp"/>
        <section style="margin: 20px 50px;">
            <div class="ui very padded fluid container segment">
                <h1 class="ui header center aligned">Welcome To PostBook!</h1>
                <form action="LoginController" method="post" class="ui big form">
                    <div class="field">
                      <label>Registered Email</label>
                      <input type="email" name="useremail" placeholder="Enter Your Registered Email" required>
                    </div>
                    <div class="field">
                      <label>Password</label>
                      <input type="password" name="userpassword" placeholder="Enter Your Password" required>
                    </div>
                    <button class="ui primary button" type="submit">Log In<i class="chevron circle right icon"></i></button>
                </form>
            </div>
        </section>
    </body>
</html>
