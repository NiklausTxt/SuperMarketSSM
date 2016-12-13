package com.nik.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {

	// �û����Ƿ����
	public boolean isExists(String username);

	//	�û�ע��
	public String register(HttpServletRequest req, HttpServletResponse resp) throws IOException;
	
	// �û���¼
	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException;

	// �޸��û���Ϣ
	public String updateInfo(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException;

	//	����/�޸��ջ���ַ
	public String addAddress(HttpServletRequest req, HttpServletResponse resp);

	//	�޸��û�����
	public String updatePassword(HttpServletRequest req, HttpServletResponse resp);
	
}
