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
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Account;
import com.poly.service.AccountService;

@CrossOrigin("*")
@RestController
public class AccountRestController {
	
	@Autowired
	AccountService accountService;
	
	@GetMapping("/rest/account")
	public List<Account> getAll() {
		return accountService.findAll();
	}

	@PostMapping("/rest/account")
	public Account save(@RequestBody Account account) {
		return accountService.save(account);
	}
	
	@PutMapping("/rest/account")
	public Account update(@RequestBody Account account) {
		return accountService.save(account);
	}
	
	@DeleteMapping("/rest/account/{username}")
	public void delete(@PathVariable String username) {
		accountService.delete(username);
	}
}
