package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ProductPhotoDAO;
import com.poly.entity.ProductPhoto;
import com.poly.service.ProductPhotoService;

@Service
public class ProductPhotoServiceImpl implements ProductPhotoService {
	
	@Autowired
	ProductPhotoDAO productPhotoDAO;

	@Override
	public List<ProductPhoto> findAll() {
		return productPhotoDAO.findAll();
	}

}
