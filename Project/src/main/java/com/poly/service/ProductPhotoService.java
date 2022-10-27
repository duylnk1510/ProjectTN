package com.poly.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.poly.entity.ProductPhoto;

public interface ProductPhotoService {
	List<ProductPhoto> findAll();
	
	List<String> getListIdProductPhotoByProductId(Integer idP);
	
	void save(ProductPhoto pp);
	
	void delete(String id);
}
