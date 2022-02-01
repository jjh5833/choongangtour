package com.choongangtour.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choongangtour.dao.testDAO;
import com.choongangtour.dto.TestDTO;

@Service
public class TestServiceImplements implements TestService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private testDAO dao;
	public List<Map<String, Object>> selectList(TestDTO dto) {
		return dao.selectList(dto);
	}

	public int adminWrite(Map<String, Object> map) {
		return dao.adminWrite(map);
	}

	public List<Map<String, Object>> selectList2(TestDTO dto) {
		return dao.selectList2(dto);
	}

	public void adminWriteWithoutFile(TestDTO dto) {
		dao.adminWriteWithoutFile(dto);

	}

	public List<Map<String, Object>> selectList() {
		return dao.selectList();
	}
	
	public List<Map<String, Object>> selectList(int b_no) {
		
		return dao.selectList(b_no);
	}
	
	public int adminUpdate(Map<String, Object> map) {
		return dao.update(map);
		
	}
	public void adminUpdateWithFile(Map<String, Object> map) {
		dao.updateWithFile(map);
	}
	public void adminDelete(Map<String, Object> map) {
		dao.delete(map);
	}

	public void adminCancelDelete(Map<String, Object> map) {
		dao.cancelDelete(map);
		
	}
	public List<Map<String, Object>> adminList(Map<String, Object> map) {
		return dao.adminList(map);
	}
	public int adminTotalList(Map<String, Object> map) {
		return dao.adminTotalList(map);
	}


	//////////////////////////아래로 쭉 샛별 userWrite 추가 1012
	public void userWrite(Map<String, Object> map) {
		dao.userWrite(map);
	}

	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	public List<Map<String, Object>> userBoard(Map<String, Object> map) {
		return dao.userBoard(map);
	}

	public Map<String, Object> ubDetail(Map<String, Object> map) {
		return dao.ubDetail(map);
	}

	public int ubLike(Map<String, Object> map) {
		return dao.ubLike(map);
	}

	public List<Map<String, Object>> boardList() {
		return null;
	}

	public void ubDelete(Map<String, Object> map) {
		dao.ubDelete(map);
	}

	public void ubUpdate(Map<String, Object> map) {
		dao.ubUpdate(map);
	}

	public List<Map<String, Object>> hotList(Map<String, Object> map) {
		return dao.hotList(map);
	}




	

}
