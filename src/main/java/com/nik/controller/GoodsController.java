package com.nik.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nik.mapper.GoodsMapper;
import com.nik.po.Goods;
import com.nik.po.GoodsExample;
import com.nik.service.GoodsService;

@Controller
@RequestMapping("")
public class GoodsController {
	
	@Resource
	private GoodsService goodsService;	
	
	@RequestMapping("/listGoods")
	public String listGoods(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		return goodsService.listGoods(req, resp);
	}
	
	@RequestMapping("/searchResult")
	public ModelAndView searchResult(HttpServletRequest req, HttpServletResponse resp){
		return goodsService.searchResult(req, resp);
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
