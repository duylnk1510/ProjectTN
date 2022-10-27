package com.poly.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Role;
import com.poly.service.RoleService;

@CrossOrigin("*")
@RestController
public class RoleRestController {
	
	@Autowired
	RoleService roleService;

	@GetMapping("/rest/role")
	public List<Role> getAll() {
		return roleService.findAll();
	}
}
