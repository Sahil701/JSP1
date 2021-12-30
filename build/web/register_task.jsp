<%@page import="com.testjsp.dao.UserDAO"%>
<%@page import="com.testjsp.model.User"%>
<%
  String username =  request.getParameter("username");
  String password = request.getParameter("password");
  String mobile = request.getParameter("mobile");
  User user = new User(username, password, mobile);
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