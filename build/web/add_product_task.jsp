<%@page import="com.testjsp.dao.ProductDAO"%>
<%@page import="com.testjsp.model.Product"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
   String categoryId = "";
   String productName = "";
   String price = "";
   String description="";
   String productImage = "";
   String imagePath = "";
   try{
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> fileItem = upload.parseRequest(request);
    
    Iterator<FileItem> itr = fileItem.iterator();
    while(itr.hasNext()){
        FileItem item = itr.next();
        String fieldName = item.getFieldName();
        if(item.isFormField()){
            if(fieldName.equals("categoryId"))
                categoryId = item.getString();
            else if(fieldName.equals("productName"))
                productName = item.getString();
            else if(fieldName.equals("price"))
                price = item.getString();
            else if(fieldName.equals("description"))
                description = item.getString();
        }
        else{
            if(fieldName.equals("productImage")){
                productImage = item.getName();
                imagePath = getServletContext().getRealPath("/")+"images/"+item.getName();
                File f = new File(imagePath);
                item.write(f);
            }
        }
    }
    Product p = new Product();
    p.setCategoryId(Integer.parseInt(categoryId));
    p.setProductName(productName);
    p.setDescription(description);
    p.setPrice(Float.parseFloat(price));
    p.setProductImage(productImage);
    boolean status = ProductDAO.save(p);
    if(status){
        %>
        <script>
            alert("Product Save");
            window.location.href="add_product.jsp";
        </script>
        <%
    }
    else
     out.print("<h1>Oops  ! Something went wrong</h1>");
   }
   catch(Exception e){
       e.printStackTrace();
   }
%>