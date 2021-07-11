<%-- 
    Document   : myposts
    Created on : 29 Jan, 2021, 2:40:27 PM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="/MyPostsController"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Posts</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <section style="margin: 20px 50px;">
            <div class="ui padded fluid container segment">
                <h1 class="ui header center aligned">Your Posts</h1>
                <div class="ui one cards">
                    <c:forEach items="${myPosts}" var="post" varStatus="loop">
                        <div class="fluid card">
                          <div class="content">
                            <div class="header">Post ID: ${post.postId}</div>
                            <div class="meta" style="margin-top: 10px;"><i class="user icon"></i> Posted By: ${post.userId}</div>
                            <div class="description" style="margin-top: 10px; font-size: 17px; line-height: 20px;">
                              ${post.post}
                            </div>
                            <form method="post" action="DeletePostController">
                                <input type="hidden" name="post-id" value="${post.postId}" required>
                                <button class="ui inverted red button right floated large" style="margin-top: 10px;"><i class="trash icon"></i>Delete</button>
                            </form>
                            <button id="test-${post.postId}" class="ui inverted blue button right floated large" style="margin-top: 10px;"><i class="pencil alternate icon"></i>Edit</button>
                        </div>
                        <div class="ui modal test-${post.postId}">
                            <i class="close icon"></i>
                            <div class="header">
                              Edit Post
                            </div>
                            <form method="POST" action="UpdatePostController" style="margin: 20px;">
                            <div class="image content">
                              <div class="description field">
                                  <input type="hidden" name="post-id" value="${post.postId}" required>
                                  <textarea class="ui header" name="post" type="text" rows="5" required cols="82" style="padding: 20px; margin: 10px;">${post.post}</textarea>
                              </div>
                            </div>
                            <div class="actions">
                              <div class="ui black deny button">
                                Cancel
                              </div>
                              <button type="submit" class="ui positive right labeled icon button">
                                Done
                                <i class="checkmark icon"></i>
                              </button>
                            </div>
                            </form>
                        </div>
                    </c:forEach>
            </div>
        </section>
    </body>
    <script>
        <c:forEach items="${myPosts}" var="post" varStatus="loop">
            $(function(){
                    $("#test-${post.postId}").click(function(){
                            $(".test-${post.postId}").modal('show');
                    });
                    $(".test-${post.postId}").modal({
                            closable: true
                    });
            });
        </c:forEach>
    </script>
</html>
