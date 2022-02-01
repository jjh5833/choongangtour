package com.choongangtour.web.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
 import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.choongangtour.util.Util;
import com.choongangtour.web.log.LogDTO;
import com.choongangtour.web.log.LogService;
import com.choongangtour.web.user.UserDTO;
import com.choongangtour.web.user.UserService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo; 
 
 @Controller 
 public class UserController { 
	 
	 @Autowired
	 private Util util;
	 
	 @Autowired
	 private LogService logService;
	 
	 @Inject 
	 private UserService userService; 
	 
	 @RequestMapping(value = "/userList.do", method = RequestMethod.GET) 
	 public ModelAndView getUserList(HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView("/userList");
			
			String ip = util.getUserIp(request);
			String target = "userList.do"; 
			String data = "유저리스트";
			 
			LogDTO log = null;
			
			HttpSession session = request.getSession();
			if(session.getAttribute("l_id") != null) {
				String id = (String)session.getAttribute("l_id");
				log = new LogDTO(ip, target, id, data);
			} else {
				log = new LogDTO(ip, target, data);
			}
			
			logService.writeLog(log);
			
			String searchName = request.getParameter("searchName");
			String search = request.getParameter("search");
			
			PaginationInfo paginationInfo = new PaginationInfo();
			int pageNo = 1;
			int listScale = 10;
			int pageScale = 10;
			
			if (request.getParameter("pageNo") != null) {
				pageNo = util.str2Int2(request.getParameter("pageNo"));
			}
			
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);

			int startPage = paginationInfo.getFirstRecordIndex();
			int lastPage = paginationInfo.getRecordCountPerPage();

			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("startPage", startPage);
			sendMap.put("lastPage", lastPage);
			
			if(searchName != null) {
				sendMap.put("searchName", searchName);
				sendMap.put("search", search);
				mv.addObject("searchName", searchName);
				mv.addObject("search", search);
			}
			
			List<UserDTO> list = userService.userList(sendMap);
			int totalCount = userService.userTotalList(sendMap);
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo);
			mv.addObject("totalCount", totalCount); 

			mv.addObject("list", list);	
			return mv;
		 
	}
	 
	 @RequestMapping(value = "/logList.do", method = RequestMethod.GET) 
		public ModelAndView logList(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("/logList");
			
			String searchName = request.getParameter("searchName");
			String search = request.getParameter("search");
			
			PaginationInfo paginationInfo = new PaginationInfo();
			int pageNo = 1;
			int listScale = 10;
			int pageScale = 10;
			
			if (request.getParameter("pageNo") != null) {
				pageNo = util.str2Int2(request.getParameter("pageNo"));
			}
			
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);

			int startPage = paginationInfo.getFirstRecordIndex();
			int lastPage = paginationInfo.getRecordCountPerPage();

			Map<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("startPage", startPage);
			sendMap.put("lastPage", lastPage);
			
			if(searchName != null) {
				sendMap.put("searchName", searchName);
				sendMap.put("search", search);
				mv.addObject("searchName", searchName);
				mv.addObject("search", search);
			}
			
			List<LogDTO> list = logService.logList(sendMap);
			int totalCount = logService.logTotalList(sendMap);
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo);
			mv.addObject("totalCount", totalCount); 
			
			mv.addObject("list", list);	
			return mv;
		}
	 
}

