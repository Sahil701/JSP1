<%-- 
    Document   : add_product
    Created on : 3 Jan, 2022, 7:48:26 PM
    Author     : root
--%>

<%@page import="com.testjsp.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testjsp.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_bootstrap_link.jsp" %>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <div class="container">
            <form>
                <div class="form-group">
                    <label>Category</label>
                    <select class="form-control">
                        <option value="0">Select category</option>
                        <%
                           ArrayList<Category>al = CategoryDAO.getCategoryList();
                           for(Category c : al){
                             %>
                             <option value="<%=c.getId()%>"><%=c.getCategoryName()%></option>
                             <%
                           }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label>Product Name</label>
                    <input type="text" name="productName" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input type="text" name="price" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea class="form-control" name="description"></textarea>
                </div>
                <div class="form-group">
                    <label>Product Image</label>
                    <input type="file" name="productImage" />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </body>
</html>
