package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.DiscountDAO;
import com.poly.entity.Discount;
import com.poly.service.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService{
	
	@Autowired
	DiscountDAO discountDAO;

	@Override
	public List<Discount> findAll() {
		return discountDAO.findAll();
	}

}
