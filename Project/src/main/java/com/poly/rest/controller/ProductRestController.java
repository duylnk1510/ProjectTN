package com.poly.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Product;
import com.poly.service.ProductService;

@CrossOrigin("*")
@RestController
public class ProductRestController {
	
	@Autowired
	ProductService productService;

	@GetMapping("/rest/products")
	public List<Product> getAll() {
		return productService.findAll();
	}
	
	@PostMapping("/rest/products")
	public Product create(@RequestBody Product p) {
		return productService.create(p);
	}
	
	@PutMapping("/rest/products/{id}")
	public Product update(@PathVariable("id") Integer id, @RequestBody Product p) {
		return productService.update(p);
	}
	
	@DeleteMapping("/rest/products/{id}")
	public void delete(@PathVariable("id") Integer id) {
		productService.delete(id);
	}
}
