<%-- 
    Document   : header
    Created on : 15 Sep, 2020, 12:03:02 AM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    </head>
    <body>
        <header>
            <nav>
                <div class="ui large menu borderless">
                    <c:if test="${user==null}">
                        <a href="index.jsp" class="item fitted">
                          <img class="ui small image" src="images/Postbook-new.png">
                        </a>
                    </c:if>
                    <c:if test="${user!=null}">
                        <a href="posts.jsp" class="item fitted">
                          <img class="ui small image" src="images/Postbook-new.png">
                        </a>
                    </c:if>
                    <div class="right menu">
                      <div class="item">
                          <c:if test="${user==null}">
                            <a href="register.jsp"> <div class="ui positive button">Sign Up</div></a>
                          </c:if>
                          <c:if test="${user!=null}">
                            <div class="item">Welcome, ${user.userName}</div>
                            <a href="myposts.jsp"> <div class="ui primary button">My Posts</div></a>
                            <a href="index.jsp"> <div class="ui primary button">Log Out</div></a>
                          </c:if>
                      </div>
                    </div>
                </div>
            </nav>
        </header>
    </body>
</html>