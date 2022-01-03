
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <%
    Object currentUser = session.getAttribute("username");
  %>
   <div class="container-fluid">
    <div class="navbar-header">
     <%if(currentUser==null){%>   
      <a class="navbar-brand" href="#">Product Inventory</a>
     <%}else{%>
       <a class="navbar-brand" href="#">Welcome <%=currentUser%></a>
     <%}%>
    </div>
    <ul class="nav navbar-nav">
      <%if(currentUser!=null){%>
       <li><a href="add_product.jsp">Add product</a></li>
       <li><a href="#">Product list</a></li>
       <li><a href="#">Logout</a></li>
      <%}else{%>
        <li class="active"><a href="login.jsp">Login</a></li>
        <li><a href="register.jsp">Register</a></li> 
      <%}%> 
    </ul>
  </div>
</nav>