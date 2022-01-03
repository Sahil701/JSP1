package com.testjsp.dao;

import com.testjsp.model.Category;
import com.testjsp.service.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDAO {
  public static ArrayList<Category> getCategoryList(){
      ArrayList<Category> al = new ArrayList<>();
      Connection con = null;
      try{
          con = GetConnection.getConnection();
          String sql = "select * from category";
          PreparedStatement ps = con.prepareStatement(sql);
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              int id = rs.getInt(1);
              String name = rs.getString(2);
              Category c = new Category(id, name);
              al.add(c);
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
}
