package com.nik.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.nik.mapper.GoodsMapper;
import com.nik.mapper.GoodsTypeMapper;
import com.nik.mapper.SubTypeMapper;
import com.nik.po.Goods;
import com.nik.po.GoodsExample;
import com.nik.po.GoodsType;
import com.nik.po.GoodsTypeExample;
import com.nik.po.SubType;
import com.nik.po.SubTypeExample;
import com.nik.service.GoodsService;

@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	@Qualifier("goodsMapper")
	private GoodsMapper goodsMapper;
	
	@Resource
	private SubTypeMapper subTypeMapper;
	
	@Resource
	private GoodsTypeMapper goodsTypeMapper;
	
	
	
	
	public String listGoods(HttpServletRequest req, HttpServletResponse resp) {
//		System.out.println("ad");
		String key = req.getParameter("type");
		System.out.println(key);
		GoodsTypeExample goodsTypeExample = new GoodsTypeExample();
		List<Goods> goodsList2 = new ArrayList<Goods>();
		if(key.equals("书籍") || key.equals("服饰") || key.equals("食品")){
			SubTypeExample subTypeExample = new SubTypeExample();
			SubTypeExample.Criteria criteria1 = subTypeExample.createCriteria();
			criteria1.andNameEqualTo(key);
			SubType subType = subTypeMapper.selectByExample(subTypeExample).get(0);
			GoodsTypeExample.Criteria criteria2 = goodsTypeExample.createCriteria();
			criteria2.andSubTypeIdEqualTo(subType.getId());
			List<GoodsType> goodsTypeList = goodsTypeMapper.selectByExample(goodsTypeExample);
			List<Integer> inList = new ArrayList<Integer>();
			for (GoodsType goodsType : goodsTypeList) {
				inList.add(goodsType.getId());
			}
			GoodsExample goodsExample = new GoodsExample();
			GoodsExample.Criteria criteria3 = goodsExample.createCriteria();
			criteria3.andGoodsTypeIdIn(inList);
			goodsList2 = goodsMapper.selectByExample(goodsExample);
		}else{
			GoodsTypeExample.Criteria criteria4 =goodsTypeExample.createCriteria();
			criteria4.andNameEqualTo(key);
			GoodsType goodsType = goodsTypeMapper.selectByExample(goodsTypeExample).get(0);
			System.out.println(goodsType);
			
			GoodsExample goodsExample = new GoodsExample();
			GoodsExample.Criteria criteria5 = goodsExample.createCriteria();
			criteria5.andIsdeleteEqualTo("N").andGoodsTypeIdEqualTo(goodsType.getId());
			
			goodsList2 = goodsMapper.selectByExample(goodsExample);
//			System.out.println(goodsList2.get(0).getDescription());
			
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("goodsList2", goodsList2);
		session.setAttribute("searchValue", key);
//		req.setAttribute("goodsList", goodsList2);
//		req.getRequestDispatcher("frontpage/login.jsp");
//		return "frontpage/login.jsp";
		return  null;
	}



	public ModelAndView searchResult(HttpServletRequest req, HttpServletResponse resp) {
		
		String type = req.getParameter("type");
		String key = req.getParameter("key");
		System.out.println(type+ ", "+key);
		int subTypeValue = -1;
		if(type.equals("book")){
			subTypeValue=1;
		}else if(type.equals("cloth")){
			subTypeValue=2;
		}else if(type.equals("food")){
			subTypeValue=3;
		}else{
			subTypeValue=-1;
		}
		
		GoodsExample goodsExample = new GoodsExample();
		
		GoodsExample.Criteria criteria1 = goodsExample.createCriteria();
		GoodsExample.Criteria criteria2 = goodsExample.createCriteria();
		
		if(subTypeValue==-1){
			criteria1.andDescriptionLike("%"+key+"%");
			criteria2.andNameLike("%"+key+"%");
		}else{
			GoodsTypeExample goodsTypeExample = new GoodsTypeExample();
			goodsTypeExample.createCriteria().andSubTypeIdEqualTo(subTypeValue);
			List<GoodsType> goodsTypeList = goodsTypeMapper.selectByExample(goodsTypeExample);
			List<Integer> inList = new ArrayList<Integer>();
			for (GoodsType goodsType : goodsTypeList) {
				inList.add(goodsType.getId());
			}
			criteria1.andDescriptionLike("%"+key+"%").andGoodsTypeIdIn(inList);
			criteria2.andNameLike("%"+key+"%").andGoodsTypeIdIn(inList);
		}
		goodsExample.or(criteria2);
		List<Goods> goodsList = goodsMapper.selectByExample(goodsExample);
		System.out.println(goodsList.size());
		req.setAttribute("goodsList", goodsList);
		
		HttpSession session = req.getSession();
		session.setAttribute("goodsList", goodsList);
		session.setAttribute("searchValue", key);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("goodsList", goodsList);
		modelAndView.setViewName("frontpage/search_result.jsp");
//		return "frontpage/search_result.jsp";
		return modelAndView;
	}

	
}
