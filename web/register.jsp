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
    <style>
        small{
            color: red;
        }
    </style>
</head>
<body>
<%@include file="_header.jsp" %>  

<div class="container">
    <form method="post" action="register_task.jsp">
        <%
          Object usernameError = request.getAttribute("usernameError");
          Object passwordError = request.getAttribute("passwordError");
          Object mobileError = request.getAttribute("mobileError");
        %>
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control"/>
            <%if(usernameError!=null){%>
               <small><%=usernameError%></small>
             <%
            }
           %>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control"/>
            <%if(passwordError!=null){%>
               <small><%=passwordError%></small>
             <%
            }
           %>
        </div>
         <div class="form-group">
            <label>Mobile</label>
            <input type="text" name="mobile" class="form-control"/>
            <%if(mobileError!=null){%>
               <small><%=mobileError%></small>
             <%
            }
           %>
         </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
</div>

</body>
</html>
