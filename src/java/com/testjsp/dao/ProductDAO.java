package com.testjsp.dao;

import com.testjsp.model.Product;
import com.testjsp.service.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
  public static boolean delete(int id){
    boolean status = false;
    Connection con = null;
    try{
        con = GetConnection.getConnection();
        String sql = "delete from product where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
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
  public static ArrayList<Product> getProductList(){
      ArrayList<Product> al = new ArrayList<>();
      Connection con= null;
      try{
          con = GetConnection.getConnection();
          String sql = "select product.id,product.name,product.price,product.description,product.product_image,product.category_id,category.category_name from product inner join category on product.category_id=category.id";
          PreparedStatement ps = con.prepareStatement(sql);
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              int id = rs.getInt(1);
              String name = rs.getString(2);
              float price = rs.getFloat(3);
              String desc = rs.getString(4);
              String image = rs.getString(5);
              int cid = rs.getInt(6);
              String categoryName = rs.getString(7);
              Product p = new Product(id, name, price, desc, cid, image);
              p.setCategoryName(categoryName);
              al.add(p);
          }
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
      return al;
  }  
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
