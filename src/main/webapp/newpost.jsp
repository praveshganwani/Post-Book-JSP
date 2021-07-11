<%-- 
    Document   : newpost
    Created on : 15 Sep, 2020, 12:12:52 AM
    Author     : Pravesh Ganwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <section style="margin: 20px 50px;">
            <div class="ui padded fluid container segment">
                <h1 class="ui header center aligned">New Post</h1>
                <form action="PostsController" method="post" class="ui big form">
                    <div class="field">
                      <label>Write Down Your Thoughts..</label>
                      <textarea placeholder="What's on your mind?" type="text" name="post" rows="3" required></textarea>
                    </div>
                    <button class="ui positive button" type="submit">Post It!<i class="chevron circle right icon"></i></button>
                </form>
            </div>
        </section>
    </body>
</html>
