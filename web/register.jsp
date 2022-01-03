<%-- 
    Document   : index
    Created on : 30 Dec, 2021, 7:21:48 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="_bootstrap_link.jsp" %>
</head>
<body>
<%@include file="_header.jsp" %>  

<div class="container">
    <form method="post" action="register_task.jsp">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control"/>
        </div>
         <div class="form-group">
            <label>Mobile</label>
            <input type="text" name="mobile" class="form-control"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
</div>

</body>
</html>
