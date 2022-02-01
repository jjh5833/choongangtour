package com.choongangtour.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choongangtour.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	public int join(Map<String, Object> map) {
		return loginDAO.join(map);
	}

	public String checkID(Map<String, Object> map) {
		return loginDAO.checkID(map);
	}

	public Map<String, Object> infobox(Map<String, Object> map) {
		return loginDAO.infobox(map);
	}
	
	public Map<String, Object> myinfo(Map<String, Object> map) {
		return loginDAO.myinfo(map);
	}

	public void changeInfo(Map<String, Object> map) {
		loginDAO.changeInfo(map);
	}

	public int deletemember(Map<String, Object> map) {
		return loginDAO.deletemember(map);
	}

	public Map<String, Object> findid(Map<String, Object> map) {
		return loginDAO.findid(map);
	}

	public String checkName(Map<String, Object> map) {
		return loginDAO.checkName(map);
	}
	
	public void typeSave(Map<String, Object> map) {
		loginDAO.typeSave(map);
	}
}
