package com.choongangtour.service;

import java.util.List;
import java.util.Map;

import com.choongangtour.dto.TestDTO;

public interface TestService {
	public List<Map<String, Object>> selectList(TestDTO dto);
}
