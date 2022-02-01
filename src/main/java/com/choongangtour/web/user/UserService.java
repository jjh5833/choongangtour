package com.choongangtour.web.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;

	public List<UserDTO> userList(Map<String, Object> sendMap) {
		return userDAO.userList(sendMap);
	}

	public int userTotalList(Map<String, Object> sendMap) {
		return userDAO.userTotalList(sendMap);
	}

}
