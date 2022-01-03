<%@page import="com.testjsp.dao.UserDAO"%>
<%@page import="com.testjsp.model.User"%>
<jsp:useBean id="user" class="com.testjsp.model.User" scope="request"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<%
  boolean status = UserDAO.save(user);
  if(status){
   %>
   <script>
       alert("Registration Success");
       window.location.href = "login.jsp";
   </script>
   <%}
   else{
   %>
   <script>
       alert("Registration Failed");
       window.location.href = "register.jsp";
   </script>
   <%
    }   
%>