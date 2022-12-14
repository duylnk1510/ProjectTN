package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	
	//@Query("SELECT od FROM OrderDetail od WHERE od.order.id = ?1")
	List<OrderDetail> findByOrderId(Long id);
}
