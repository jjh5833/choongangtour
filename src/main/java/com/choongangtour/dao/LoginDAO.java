package com.choongangtour.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	public Map<String, Object> login(Map<String, Object> map) {
		return selectOne("login.login", map);
	}

	public int join(Map<String, Object> map) {
		return insert("login.join", map);
	}

	public String checkID(Map<String, Object> map) {
		return selectOneStr("login.checkID", map);
	}

	public Map<String, Object> infobox(Map<String, Object> map) {
		return selectOne("login.infobox", map);
	}
	
	public Map<String, Object> myinfo(Map<String, Object> map) {
		return selectOne("login.myinfo", map);
	}

	public void changeInfo(Map<String, Object> map) {
		update("login.changeInfo", map);
	}

	public int deletemember(Map<String, Object> map) {
		return delete("login.deletemember", map);
	}

	public Map<String, Object> findid(Map<String, Object> map) {
		return selectOne("login.findid", map);
	}

	public String checkName(Map<String, Object> map) {
		return selectOneStr("login.checkName", map);
	}
	
	public void typeSave(Map<String, Object> map) {
		update("login.typeSave", map);
	}
}
