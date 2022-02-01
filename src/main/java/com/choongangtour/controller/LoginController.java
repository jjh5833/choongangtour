package com.choongangtour.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choongangtour.common.CommandMap;
import com.choongangtour.service.LoginServiceImpl;
import com.choongangtour.util.Util;
import com.choongangtour.web.log.LogDTO;
import com.choongangtour.web.log.LogService;

// !!! 변경예정, 삭제예정 확인 요망
@Controller
public class LoginController {
	@Resource(name = "loginService")
	private LoginServiceImpl loginService;
	@Autowired
	 private LogService logService;
	 @Autowired
	 private Util util;
	
	//사용~!
	@GetMapping("/infobox.do")
	public ModelAndView infobox(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String ip = util.getUserIp(request);
		String target = "infobox.do"; 
		String data = "인포박스";
		 
		LogDTO log = null;
		
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		commandMap.put("l_id", session.getAttribute("l_id"));
		Map<String, Object> infobox = loginService.infobox(commandMap.getMap());
		mv.addObject("infobox", infobox);
		mv.setViewName("infobox");
		return mv;
	}
	

	@GetMapping("/login.do")
	public String login() {
		return "login";
	}

	//로그인 실패시 수정 필요
	@PostMapping("/login.do")
	public String login(CommandMap commandMap, HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "login.do"; 
		String data = "로그인";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		System.out.println(commandMap.getMap());

		Map<String, Object> login = loginService.login(commandMap.getMap());
//		System.out.println("로그인 확인 : " + login);
		
		if(login == null) {
//			System.out.println(login + "은 null");
			return "redirect:/login.do?code=loginfail";
		}
		
		session.setAttribute("l_name", login.get("l_name"));
		session.setAttribute("l_id", login.get("l_id"));
		
		return "redirect:/home.do";
	}

	@GetMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join.do")
	public String joinAction(CommandMap commandMap, HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "join.do"; 
		String data = "회원가입";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		System.out.println(commandMap.getMap());
		loginService.join(commandMap.getMap());

		return "redirect:/login.do?code=join";
	}
	
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "logout.do"; 
		String data = "로그아웃";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		if (session.getAttribute("l_id") != null) {
			session.removeAttribute("l_id");
		}
		if (session.getAttribute("l_name") != null) {
			session.removeAttribute("l_name");
		}
		return "redirect:/home.do";
	}
	
	//ajax id check
	@PostMapping("/checkID.do")
	public @ResponseBody String checkID(CommandMap commandMap, HttpServletRequest request) {
		String check = "1";
		check = loginService.checkID(commandMap.getMap());
		
		return check;
	}

	//myinfo 페이지 처음 get으로 들어오면 pw 체크 페이지 먼저 부르기
	@GetMapping("/myinfo.do")
	public String checkpw(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("pwFailCnt", 0);
		
		return "checkpw";
	} 
	
	@PostMapping("/myinfo.do")
	public ModelAndView myinfo(CommandMap commandMap, HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "myinfo.do"; 
		String data = "마이인포";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		System.out.println("실패 카운트 : " + session.getAttribute("pwFailCnt"));
		ModelAndView mv = new ModelAndView();
		Map<String, Object> myinfo = loginService.myinfo(commandMap.getMap());
		
		//값이 null이면 즉, 비밀번호가 틀리면 세션에 횟수 저장, 5회 틀릴 시 로그아웃
		if(myinfo == null) {
			if((int)session.getAttribute("pwFailCnt") < 5){
				int pwFailCnt = (int) session.getAttribute("pwFailCnt");
				session.setAttribute("pwFailCnt", pwFailCnt+1);
				System.out.println("실패 카운트 +1 : " + session.getAttribute("pwFailCnt"));
				mv.setViewName("checkpw");
				//비밀번호가 틀리면 checkpw페이지로 다시 이동
				
				return mv;	
			} else {
				mv.setViewName("logout");
			}
		}

		mv.addObject("myinfo", myinfo);
		System.out.println(myinfo);
		mv.setViewName("myinfo");
		
		return mv;
	}
	
	@PostMapping("/changeInfo.do")
	public ModelAndView changeInfo(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		String ip = util.getUserIp(request);
		String target = "changeInfo.do"; 
		String data = "정보변경";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		if(commandMap.getMap().get("pw") != "") {
			commandMap.remove("l_pw");
			commandMap.put("l_pw", commandMap.getMap().get("pw"));
		}
		loginService.changeInfo(commandMap.getMap());
		
		if(commandMap.getMap().get("code") != null) {
			mv.addObject("code", commandMap.getMap().get("code"));
			mv.setViewName("login");
			return mv;
		} else {
			mv.setViewName("myinfo");
			Map<String, Object> myinfo = loginService.myinfo(commandMap.getMap());
			mv.addObject("myinfo", myinfo);
			
			return mv;
		}
	}
	
	@RequestMapping("deletemember.do")
	public String deletemember(CommandMap map) {
		int result = loginService.deletemember(map.getMap());
		
		if(result == 1) {
			return "redirect:logout.do";
		} else {
			return "error.do?errorcode=delfail";
		}
	}
	
	@GetMapping("findid.do")
	public String getfindid() {
		return "findid";
	}
	
	@PostMapping("findid.do")
	public ModelAndView findid(CommandMap map) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> myinfo = loginService.findid(map.getMap());
		
		if(myinfo == null) {
			mv.addObject("code", "NA");
		} else {
			mv.addObject("myinfo", myinfo);
			mv.setViewName("findid");
		}
		return mv;
	}
	
	@PostMapping("checkName")
	public @ResponseBody String checkName(CommandMap commandMap, HttpServletRequest request) {
		String check = "1";
		check = loginService.checkName(commandMap.getMap());
		
		return check;
	}
	
	//여행타입 테스트 여기에 넣었어요~
	@GetMapping("/travelTest.do")
	public String travelTest() {
		return "travelTest";
	}
	
	@RequestMapping(value="/travelTest.do", method=RequestMethod.POST)
	public @ResponseBody String typeSave(CommandMap commandMap, HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		String ip = util.getUserIp(request);
		String target = "travleTest.do"; 
		String data = "여행테스트";
		 
		LogDTO log = null;
		
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
			commandMap.put("l_id", session.getAttribute("l_id"));
			loginService.typeSave(commandMap.getMap());
			
		return "/travelTest.do";
}
}