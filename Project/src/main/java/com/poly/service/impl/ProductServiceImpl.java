package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Product> findAll() {
		return productDAO.findAll();
	}

	@Override
	public Product create(Product p) {
		return productDAO.save(p);
	}

	@Override
	public Product update(Product p) {
		return productDAO.save(p);
	}

	@Override
	public void delete(Integer id) {
		productDAO.deleteById(id);
	}

}
