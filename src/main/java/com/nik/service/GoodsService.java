package com.nik.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface GoodsService {

	// ��ѯ��Ʒ�б�
	public String listGoods(HttpServletRequest req, HttpServletResponse resp);

	//	��������ѯ
	public ModelAndView searchResult(HttpServletRequest req, HttpServletResponse resp);
	
}
