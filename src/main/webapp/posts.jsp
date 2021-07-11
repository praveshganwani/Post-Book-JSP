<%-- 
    Document   : posts
    Created on : 14 Sep, 2020, 10:29:56 PM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="/PostsController"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posts</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <section style="margin: 20px 50px;">
            <div class="ui padded fluid container segment">
                <a href="newpost.jsp">
                    <button class="ui compact labeled icon positive big button">
                        <i class="sticky note icon"></i>
                        Create A New Post
                    </button>
                </a>
                <h1 class="ui header center aligned">All Posts</h1>
                <div class="ui one cards">
                    <c:forEach items="${posts}" var="post" varStatus="loop">
                        <div class="fluid card">
                          <div class="content">
                            <div class="header">Post ID: ${post.postId}</div>
                            <div class="meta" style="margin-top: 10px;"><i class="user icon"></i> Posted By: ${post.userId}</div>
                            <div class="description" style="margin-top: 10px; font-size: 17px; line-height: 20px;">
                              ${post.post}
                            </div>
                          </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>
