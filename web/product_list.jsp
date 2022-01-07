
<%@page import="com.testjsp.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testjsp.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_bootstrap_link.jsp" %>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <%
          if(currentUser!=null){
           %>
           <table class="table">
               <thead>
                 <th>S.no</th>
                 <th>Image</th>
                 <th>Name</th>
                 <th>Category</th>
                 <th>Price</th>
                 <th>Description</th>
                 <th>Delete</th>
                 <th>Edit</th>
               </thead>
               <tbody>
                   <%
                      ArrayList<Product>al =  ProductDAO.getProductList();
                      int i=0;
                      for(Product p : al){
                       %>
                       <tr>
                           <td><%=++i%></td>
                           <td>
                               <img width="50" height="50" src="./images/<%=p.getProductImage()%>"/>
                           </td>
                           <td><%=p.getProductName()%></td>
                           <td><%=p.getCategoryName()%></td>
                           <td><%=p.getPrice()%></td>
                           <td><%=p.getDescription()%></td>
                           <td>
                               <a onclick="return confirm('Are you sure ?')" href="delete_product.jsp?id=<%=p.getId()%>"> 
                                <button class="btn btn-danger">Delete</button>
                               </a>
                           </td>
                           <td>
                               <button class="btn btn-primary">Edit</button>
                           </td>
                       </tr>
                       <%
                      }
                   %>
               </tbody>
           </table>
           <%
          }
          else{
            response.sendRedirect("login.jsp");
          }
        %>
    </body>
</html>
