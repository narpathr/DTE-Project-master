package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDAO {
	public boolean addProduct(Product product);
	public boolean deleteProduct(Product product);
	public boolean updateProduct(Product product);
	public Product viewProduct(int productId);
	public List<Product> listProducts();
}
