
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_bootstrap_link.jsp" %>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <%
            if(currentUser == null)
             response.sendRedirect("login.jsp");
            
        %>
    </body>
</html>
