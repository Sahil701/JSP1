<%@page import="com.testjsp.dao.ProductDAO"%>
<jsp:useBean id="product" class="com.testjsp.model.Product" scope="request"/>
<jsp:setProperty name="product" property="*"/>
<%
   boolean status =  ProductDAO.delete(product.getId());
   if(status)
     response.sendRedirect("product_list.jsp");
   else
     out.print("Something went wrong");
%>