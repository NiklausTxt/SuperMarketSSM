package com.nik.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {

	// 用户名是否存在
	public boolean isExists(String username);

	//	用户注册
	public String register(HttpServletRequest req, HttpServletResponse resp) throws IOException;
	
	// 用户登录
	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException;

	// 修改用户信息
	public String updateInfo(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException;

	//	增加/修改收货地址
	public String addAddress(HttpServletRequest req, HttpServletResponse resp);

	//	修改用户密码
	public String updatePassword(HttpServletRequest req, HttpServletResponse resp);
	
}
