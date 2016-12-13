package com.nik.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface GoodsService {

	// 查询商品列表
	public String listGoods(HttpServletRequest req, HttpServletResponse resp);

	//	按条件查询
	public ModelAndView searchResult(HttpServletRequest req, HttpServletResponse resp);
	
}
