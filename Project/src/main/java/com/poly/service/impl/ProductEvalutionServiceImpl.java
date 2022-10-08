package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ProductEvalutionDAO;
import com.poly.entity.ProductEvalution;
import com.poly.service.ProductEvalutionService;

@Service
public class ProductEvalutionServiceImpl implements ProductEvalutionService{
	
	@Autowired
	ProductEvalutionDAO productEvalutionDAO;

	@Override
	public List<ProductEvalution> findALl() {
		return productEvalutionDAO.findAll();
	}

}
