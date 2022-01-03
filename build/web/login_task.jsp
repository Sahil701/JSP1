<%@page import="com.testjsp.dao.UserDAO"%>
<jsp:useBean id="user" class="com.testjsp.model.User" scope="request"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<%
 boolean status = UserDAO.authenticateUser(user);
 if(status){
     session.setAttribute("username", user.getUsername());
     response.sendRedirect("admin_dashboard.jsp");
 }
 else
 {
  %>
  <script>
      alert("Invalid username or password");
      window.location.href="login.jsp";
  </script>
  <%
 }
%>