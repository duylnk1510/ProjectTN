package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	AccountDAO accountDAO;
	
	@Override
	public List<Account> findAll() {
		//System.out.println(accountDAO.findAll().size());
		return accountDAO.findAll();
	}

}
