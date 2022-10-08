package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.BrandDAO;
import com.poly.entity.Brand;
import com.poly.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService{
	
	@Autowired
	BrandDAO brandDAO;

	@Override
	public List<Brand> findAll() {
		return brandDAO.findAll();
	}

}
