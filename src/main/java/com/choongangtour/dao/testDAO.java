package com.choongangtour.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongangtour.common.CommandMap;
import com.choongangtour.dto.TestDTO;

@Repository("testDAO")
public class testDAO extends AbstractDAO {
	private SqlSession sql;
	public List<Map<String, Object>> selectList(TestDTO dto) {
		return (List<Map<String, Object>>) selectList("test.board", dto);
	}

	public List<Map<String, Object>> selectList(int b_no) {
		return selectList("test.adminModify",b_no);
		
	}//파일 수정
	public int update(Map<String, Object> map) {
		return update("test.adminUpdate", map);
	}
	public void updateWithFile(Map<String, Object> map) {
		update("test.adminUpdateWithFile", map);
		
	}

	public int adminWrite(Map<String, Object> map) {
		return insert("test.adminWrite", map);
	}

	public List<Map<String, Object>> selectList2(TestDTO dto) {
		return (List<Map<String, Object>>) selectList("test.board2", dto);
	}

	public void adminWriteWithoutFile(TestDTO dto) {
		insert("test.adminWriteWithoutFile", dto);
	}
	public void delete(Map<String, Object> map) {
		update("test.adminDelete", map);
	}
	public void cancelDelete(Map<String, Object> map) {
		update("test.adminCancelDelete", map);
		
	}
	public List<Map<String, Object>> adminList(Map<String, Object> map) {
		return selectList("test.adminBoard", map);
	}
	public int adminTotalList(Map<String, Object> map) {
		return selectOneint("test.adminTotalList", map);
	}
	public List<Map<String, Object>> selectList() {
		return selectList("test.adminBoard");
	}



	////////////////////////// 아래로 쭉 샛별 userWrite 추가 1012
	public void userWrite(Map<String, Object> map) {
		insert("test.userWrite", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("test.totalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> userBoard(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("test.userBoard", map);
	}

	public Map<String, Object> ubDetail(Map<String, Object> map) {
		return selectOne("test.ubDetail", map);
	}

	// 샛별추가 1020
	public int ubLike(Map<String, Object> map) {
		if (Integer.parseInt((String) map.get("ublikeValue")) == 0) {
			return update("test.ubHate", map);
		} else {
			System.out.println("추천확인" + map.get("ublikeValue"));
			return update("test.ubLike", map);
		}
	}

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("test.boardList", map);
	}

	public Object ubDelete(Map<String, Object> map) {
		return delete("test.ubDelete", map);
	}

	public void ubUpdate(Map<String, Object> map) {
		update("test.ubUpdate", map);
	}

	public List<Map<String, Object>> hotList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("test.hotList", map);
	}

	

	


}
