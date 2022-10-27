package com.poly.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Order;
import com.poly.service.OrderService;

@RestController
public class OrderRestController {
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/rest/order")
	public List<Order> getList() {
		return orderService.findAll();
	}
	
	@PutMapping("/rest/orderUpdate")
	public Order update(@RequestBody Order o) {
		return orderService.updateStatus(o);
	}
}
