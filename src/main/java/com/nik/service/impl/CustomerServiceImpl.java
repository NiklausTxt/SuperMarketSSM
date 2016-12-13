package com.nik.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import com.nik.mapper.CustomerLoginMapper;
import com.nik.mapper.CustomerMapper;
import com.nik.mapper.GetadressMapper;
import com.nik.po.Customer;
import com.nik.po.CustomerExample;
import com.nik.po.CustomerInfo;
import com.nik.po.CustomerLogin;
import com.nik.po.CustomerLoginExample;
import com.nik.po.Getadress;
import com.nik.po.GetadressExample;
import com.nik.service.CustomerService;

@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerLoginMapper customerLoginMapper;
	@Autowired
	private CustomerMapper customerMapper;
	@Resource
	private GetadressMapper getadressMapper;

	public boolean isExists(String username) {
		CustomerExample example = new CustomerExample();
		example.createCriteria().andUsernameEqualTo(username);

		if (customerMapper.selectByExample(example).size() == 0) {
			return false;
		} else {
			return true;
		}

	}

	public String register(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String username = req.getParameter("regName");
		String password = req.getParameter("pwd");
		CustomerInfo customerInfo = new CustomerInfo();
		CustomerLogin customerLogin = new CustomerLogin();

		customerLogin.setPassword(password);
		customerInfo.setUsername(username);
		customerInfo.setCustomerLogin(customerLogin);
		if (isExists(username)) {
			printScript(resp, "用户名已存在！");
			return "frontpage/register.jsp";
		}
		CustomerExample customerExample = new CustomerExample();
		customerExample.createCriteria().andUsernameEqualTo(username);
		Customer customer = new Customer();
		customer.setUsername(username);
		customerMapper.insertSelective(customer);
		customer = customerMapper.selectByExample(customerExample).get(0);
		CustomerLogin login = new CustomerLogin();
		login.setCustomerId(customer.getId());
		login.setPassword(password);
		customerLoginMapper.insert(login);
		BeanUtils.copyProperties(customer, customerInfo);

		customerInfo.setCustomerLogin(login);
		HttpSession session = req.getSession();
		session.setAttribute("user", customerInfo);
		return "frontpage/index.jsp";

	}

	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String username = req.getParameter("loginname");
		String password = req.getParameter("nloginpwd");

		if (!isExists(username)) {
			printScript(resp, "不存在该用户，请注册");
			return "frontpage/login.jsp";
		}

		CustomerExample example = new CustomerExample();
		example.createCriteria().andUsernameEqualTo(username);
		Customer customer = customerMapper.selectByExample(example).get(0);

		CustomerLoginExample ulExample = new CustomerLoginExample();
		ulExample.createCriteria().andCustomerIdEqualTo(customer.getId());

		CustomerLogin login = customerLoginMapper.selectByExample(ulExample).get(0);
		String pwd = login.getPassword();

		CustomerInfo customerInfo = new CustomerInfo();

		if (password.equals(pwd)) {
			CustomerLogin customerLogin = new CustomerLogin();
			customerLogin.setPassword(password);
			customerLogin.setCustomerId(customer.getId());

			customerInfo.setCustomerLogin(customerLogin);
			BeanUtils.copyProperties(customer, customerInfo);

			GetadressExample getadressExample = new GetadressExample();
			getadressExample.createCriteria().andCustomerIdEqualTo(customer.getId());
			HttpSession session = req.getSession();
			if (getadressMapper.selectByExample(getadressExample).size() != 0) {
				Getadress getadress = getadressMapper.selectByExample(getadressExample).get(0);
				session.setAttribute("address", getadress);
			}
			session.setAttribute("user", customerInfo);
			return "frontpage/index.jsp";
		} else {
			printScript(resp, "用户名密码错误");
			return "frontpage/login.jsp";
		}
	}

	public String updateInfo(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = req.getSession();
		CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("user");
		System.out.println(customerInfo.getUsername());
		String nickname = req.getParameter("nickname");
		String sex = req.getParameter("sex");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");

		Customer customer = new Customer();
		customer.setUsername(customerInfo.getUsername());
		customer.setEmail(email);
		customer.setNickname(nickname);
		customer.setSex(sex);
		customer.setPhone(phone);
		BeanUtils.copyProperties(customer, customerInfo);
		System.out.println(customerInfo.getEmail());
		System.out.println(customerInfo.getSex());
		CustomerExample example = new CustomerExample();
		example.createCriteria().andUsernameEqualTo(customerInfo.getUsername());
		customerMapper.updateByExampleSelective(customer, example);
		session.setAttribute("user", customerInfo);
		return "frontpage/user-center.jsp";

	}

	public String addAddress(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("user");
		String adress = req.getParameter("address");
		String getname = req.getParameter("receiver");
		String getphone = req.getParameter("phone");
		Getadress getadress = new Getadress();
		System.out.println(customerInfo.getUsername() + ", " + adress + ", " + getname);
		getadress.setAdress(adress);
		getadress.setCustomerId(customerInfo.getId());
		getadress.setGetname(getname);
		getadress.setGetphone(getphone);
		GetadressExample example = new GetadressExample();
		example.createCriteria().andCustomerIdEqualTo(customerInfo.getId());
		if (getadressMapper.selectByExample(example).size() == 0) {
			getadressMapper.insertSelective(getadress);
		} else {
			getadressMapper.updateByExampleSelective(getadress, example);
		}
		session.setAttribute("address", getadress);

		return "frontpage/user-center-addr.jsp";
	}

	public void printScript(HttpServletResponse resp, String str) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<script>");
		out.println("alert('" + str + "');");
		out.println("history.back();");
		out.println("</script>");
		out.close();

	}

	public String updatePassword(HttpServletRequest req, HttpServletResponse resp) {
		String newPwd = req.getParameter("password");
		HttpSession session = req.getSession();
		CustomerInfo customerInfo = (CustomerInfo) session.getAttribute("user");
		CustomerLogin customerLogin = customerInfo.getCustomerLogin();
		customerLogin.setPassword(newPwd);
		CustomerLoginExample customerLoginExample = new CustomerLoginExample();
		customerLoginExample.createCriteria().andCustomerIdEqualTo(customerInfo.getId());
		
		customerLoginMapper.updateByExampleSelective(customerLogin, customerLoginExample);
		BeanUtils.copyProperties(customerLogin, customerInfo);
		session.setAttribute("user", customerInfo);
		return "frontpage/user-center-pw.jsp";
	}

}
