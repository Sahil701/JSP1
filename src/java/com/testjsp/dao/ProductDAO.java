package com.testjsp.dao;

import com.testjsp.model.Product;
import com.testjsp.service.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProductDAO {
  public static boolean save(Product p){
      boolean status = false;
      Connection con = null;
      try{
          con = GetConnection.getConnection();
          String sql = "insert into product(name,price,description,product_image,category_id) values(?,?,?,?,?)";
          PreparedStatement ps = con.prepareStatement(sql);
          ps.setString(1, p.getProductName());
          ps.setFloat(2, p.getPrice());
          ps.setString(3, p.getDescription());
          ps.setString(4, p.getProductImage());
          ps.setInt(5, p.getCategoryId());
          if(ps.executeUpdate()!=0)
              status = true;
      }
      catch(Exception e){
          e.printStackTrace();
      }
      finally{
          try{
              con.close();
          }
          catch(Exception e){
              e.printStackTrace();
          }
      }
      return status;
  }    
}
