package com.choongangtour.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.choongangtour.dto.TestDTO;

//Login시 필요한 것만 붙여올 수 없어 일단 전부 복사해왔습니다! -샛별
public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryID \t " + queryId);
		}
	}
	
	@SuppressWarnings("rawtypes")
	  public List< Map<String, Object>> selectList(String queryID, TestDTO dto) {
			printQueryId(queryID);
			return sqlSession.selectList(queryID, dto);
		}
	  public int insert(String queryID, TestDTO dto  ) {
		  printQueryId(queryID);
		   return sqlSession.insert(queryID,  dto);
	  }
	  public List< Map<String, Object>> selectList(String queryID) {//adminPage no dto
			printQueryId(queryID);
			return sqlSession.selectList(queryID);
		}
		public List< Map<String, Object>> selectList(String queryID, int b_no) {//modify !!!!!!!!!!1
			printQueryId(queryID);
			return sqlSession.selectList(queryID,  b_no); 
		}
		

	public List<Map<String, Object>> selectList(String queryID, Map<String, Object> map) {
		return sqlSession.selectList(queryID, map);
	}

	public int selectOneint(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}
	public Map<String, Object> selectOne(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}
	
	public String selectOneStr(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}
	
	public int insert(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.insert(queryID, map);
	}

	public int delete(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.delete(queryID, map);
	}

	public int update(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.update(queryID, map);
	}
	//메시지에서 no로 id불러오기	
	public String getName(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}
	//메시지 보내기
	public int sendMessage(String queryID, Map<String, Object> map) {
		return sqlSession.insert(queryID, map);
	}
	//메시지 삭제하기
	public void delMsg(String queryID, Map<String, Object> map) {
		sqlSession.delete(queryID, map);
	}
	
	public void update(String queryID, TestDTO testDTO) {
		sqlSession.update(queryID, testDTO);
	}
	
}