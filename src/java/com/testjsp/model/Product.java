package com.testjsp.model;
public class Product {
  private int id;
  private String productName;
  private float price;
  private String description;
  private int categoryId;
  private String productImage;

    public Product(int id, String productName, float price, String description, int categoryId, String productImage) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.productImage = productImage;
    }

    public Product(String productName, float price, String description, int categoryId, String productImage) {
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.productImage = productImage;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
   
} 
