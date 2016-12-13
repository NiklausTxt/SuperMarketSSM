package com.nik.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nik.po.Customer;
import com.nik.po.CustomerInfo;
import com.nik.po.CustomerLogin;
import com.nik.service.CustomerService;
import com.nik.service.impl.CustomerServiceImpl;

@Controller
@RequestMapping("")
public class CustomerController {
	
	@Autowired
	@Qualifier("customerService")
	private CustomerService customerService;
	
	@RequestMapping("/register")
	public String register(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		
		return customerService.register(req, resp);
		
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		return customerService.login(req, resp);
	}
	
	@RequestMapping("/exit")
	public String exit(HttpServletRequest req, HttpServletResponse resp){
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.removeAttribute("address");
		return "frontpage/index.jsp";
	}
	
	@RequestMapping("/updateInfo")
	public String updateInfo(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException{
		return customerService.updateInfo(req, resp);
	}
	
	@RequestMapping("/addAddress")
	public String addAddress(HttpServletRequest req, HttpServletResponse resp){
		return customerService.addAddress(req, resp);
	}
	
	@RequestMapping("/updatePassword")
	public String updatePassword(HttpServletRequest req, HttpServletResponse resp){
		return customerService.updatePassword(req, resp);
	}
	
	public void printScript(HttpServletResponse resp, String str) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<script>");
		out.println("alert('"+ str +"');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		
	}
	
}
