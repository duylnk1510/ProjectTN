package com.poly.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Brand;
import com.poly.entity.Category;
import com.poly.service.BrandService;
import com.poly.service.CategoryService;

@CrossOrigin("*")
@RestController
public class BrandRestController {
	@Autowired
	BrandService brandService;
	
	@RequestMapping("/rest/brand")
	public List<Brand> getAll() {
		return brandService.findAll();
	}
}
