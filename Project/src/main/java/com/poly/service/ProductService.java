package com.poly.service;

import java.util.List;

import com.poly.entity.Product;

public interface ProductService {
	List<Product> findAll();
	
	Product create(Product p);

	Product update(Product p);

	void delete(Integer id);

}
