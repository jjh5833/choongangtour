package com.choongangtour.web.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<UserDTO> userList(Map<String, Object> sendMap) {
		return sqlSession.selectList("user.userList", sendMap);
	}

	public int userTotalList(Map<String, Object> sendMap) {
		return sqlSession.selectOne("user.userTotalList", sendMap);
	}
	
}
