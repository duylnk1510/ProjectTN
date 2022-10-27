package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.OrderDAO;
import com.poly.entity.Order;
import com.poly.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public List<Order> findAll() {
		return orderDAO.findAll();
	}

	@Override
	public Order updateStatus(Order o) {
		return orderDAO.save(o);
	}

}
