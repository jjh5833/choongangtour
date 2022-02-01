package com.choongangtour.controller;

import java.io.IOException;
import java.lang.annotation.Target;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.choongangtour.common.CommandMap;
import com.choongangtour.dto.TestDTO;
import com.choongangtour.service.TestServiceImplements;
import com.choongangtour.util.FileSave;
import com.choongangtour.util.Util;
import com.choongangtour.web.log.LogDTO;
import com.choongangtour.web.log.LogService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TestController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource
	private TestServiceImplements serviceImplements;
	@Autowired
	private ServletContext sc;
	@Autowired
	private FileSave save;
	@Autowired
	private Util util;

	 @Autowired
	 private LogService logService;
	

	@RequestMapping( value = "/boardRegion.do", produces="text/plain; charset=UTF-8", method=RequestMethod.GET)
	public ModelAndView boardRegion(HttpServletRequest request)  { //보드 리스트 다 보여주기 
		
		String ip = util.getUserIp(request);
		String target = "boardRegion.do"; 
		String data = "보드리스트";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		String id = request.getParameter("id");//나중에 로그인
		
		ModelAndView mv = new ModelAndView("boardRegion");
		TestDTO dto = new TestDTO();//dto로 사용해서 
		dto.setB_title(request.getParameter("b_title"));
		
		int re_no = util.str2Int2(request.getParameter("re_no"));
		dto.setRe_no(re_no);//regions table (DB) 행정구역 1~20 //touristSites.jsp에서 가지고 날라옴 
		
		dto.setVisi(1);//1인것만 보이게끔 나중에 삭제할 때 사용

		
		//board
		List<Map<String, Object>> list = serviceImplements.selectList(dto);
		List<Map<String, Object>> list2 = serviceImplements.selectList2(dto);
		System.out.println("list: " + list);
		mv.addObject("list", list);// 상세보기
		mv.addObject("list2", list2);// 주변 관광지 상세보기 이전 페이지
		
	return mv; 
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() { //보여주는 write
		System.out.println("write");
		return "write";
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String adminWrite(HttpServletRequest request,  CommandMap map) throws Exception {
		
		String ip = util.getUserIp(request);
		String target = "write"; 
		String data = "글쓰기";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		int re_no = util.str2Int2(request.getParameter("region"));
		map.put("re_no", util.str2Int2(request.getParameter("region"))); //구역
		System.out.println("map : " + map.getMap());
		serviceImplements.adminWrite(map.getMap());
		
		return "redirect: boardRegion.do?re_no=" + re_no;
		
	}

	
	@RequestMapping( value = "/home.do", produces="text/plain; charset=UTF-8")
	public String home() {
		
		return "home";
	}
	@RequestMapping( value = "/touristSites.do", produces="text/plain; charset=UTF-8")
	public String tourSites() {
		return "touristSites";
	}
	@GetMapping("/adminPage")
	public ModelAndView adminPage(HttpServletRequest request, CommandMap map) {//아드민에서 글 다 띄우기
		ModelAndView mv = new ModelAndView("adminPage");
		
		String ip = util.getUserIp(request);
		String target = "adminPage"; 
		String data = "관리자페이지";
		 
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
		System.out.println("Sdas:" +sendMap);
		List<Map<String, Object>> list = serviceImplements.adminList(sendMap);
		int totalCount = serviceImplements.adminTotalList(sendMap);
		paginationInfo.setTotalRecordCount(totalCount);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount); 
		mv.addObject("list", list);	

		
		/*
		 * List<Map<String, Object>> list = serviceImplements.selectList();
		 */
		
		
		return mv;
	}
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
	@GetMapping("/regionMap")
	public String regionMap(HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "regionMap"; 
		String data = "지도";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);

		return "regionMap";
	}
	@GetMapping("/adminModify")// 수정하기 화면만 보여주기
	public ModelAndView adminModify(HttpServletRequest request) {
		
		int b_no  = util.str2Int2(request.getParameter("b_no"));
		ModelAndView mv = new ModelAndView("adminModify");
		TestDTO dto = new TestDTO();
		b_no = dto.setB_no(b_no);
		System.out.println(b_no);//오는거 홧인
		List<Map<String, Object>> list = serviceImplements.selectList(b_no);//선택한 항목 list다 띄어주고
		mv.addObject("list", list);	
		return mv;
	}
	@PostMapping("/adminModify")
	public String adminUpdate(CommandMap map,HttpServletRequest sr)throws IOException	{
		
		String ip = util.getUserIp(sr);
		String target = "adminModify"; 
		String data = "수정하기";
		 
		LogDTO log = null;
		
		HttpSession session = sr.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		TestDTO testDTO = new TestDTO();
		int re_no = testDTO.setRe_no(util.str2Int2(sr.getParameter("region")));//구역 
		map.put("re_no", re_no);
		int b_no =util.str2Int2(sr.getParameter("b_no"));
		map.put("b_no", b_no);

	
			serviceImplements.adminUpdate(map.getMap());
			
		
		return "redirect: adminPage.do";//"redirect: adminPage.do"
		
		
	}
	@RequestMapping("/adminDelete.do")
	public String adminDelete(Map<String, Object> map, @RequestParam("b_no") int b_no, HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "adminDelete"; 
		String data = "삭제하기";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		map.put("b_no", b_no);
		serviceImplements.adminDelete(map);
		return "redirect: adminPage.do";//"redirect: adminPage.do"
	}
	@RequestMapping("/adminCancelDelete.do")
	public String adminCancelDelete(Map<String, Object> map, @RequestParam("b_no") int b_no) {
		map.put("b_no", b_no);
		serviceImplements.adminCancelDelete(map);
		return "redirect: adminPage.do";//"redirect: adminPage.do"
	}
	@GetMapping("/adminDetail.do")
	public ModelAndView adminDetail(@RequestParam("b_no") int b_no, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("adminDetail");
		
		String ip = util.getUserIp(request);
		String target = "adminDetail.do"; 
		String data = "관리자디테일페이지";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		List<Map<String, Object>> list = serviceImplements.selectList(b_no);//수정하기 화면 보여주는 adminModify 재활용
		mv.addObject("list", list);	
		return mv;
	}
	
	//////////////////////////아래로 쭉 샛별 userWrite 추가
	
	@RequestMapping(value="/userWrite.do", method=RequestMethod.GET)
	public String userWrite(HttpServletRequest request) { //보여주는 write
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") == null) {
			return "login";
		}
		return "userWrite";
		//Get으로 들어오는 유저 글쓰기 페이지 출력
	}
	
	@RequestMapping(value="/userWrite", method=RequestMethod.POST)
	public String userWrite(HttpServletRequest request, CommandMap map) throws Exception {
		
		String ip = util.getUserIp(request);
		String target = "userWrite.do"; 
		String data = "유저게시판 글쓰기";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		if(session.getAttribute("l_id") == null) {
			return "redirect: login.do";
		}
		
		map.put("re_no", util.str2Int2(request.getParameter("region"))); //구역
		map.put("l_id", (String) session.getAttribute("l_id"));

		System.out.println("url : " + map.get("url"));
		
		serviceImplements.userWrite(map.getMap());
		
		return "redirect: userBoard.do";
	}
	
	@RequestMapping(value="/userBoard.do")
	public ModelAndView board(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("userBoard");
		
		String ip = util.getUserIp(request);
		String target = "userBoard.do"; 
		String data = "유저게시판";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		
		if(map.containsKey("searchName")) {
			mv.addObject("searchName", map.get("searchName"));
			mv.addObject("search", map.get("search"));
		}
		
		int pageNo = 1;
		System.out.println("pageNo = " + map.get("pageNo"));
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(   String.valueOf(  map.get("pageNo")  )   );
		}
		int listScale = 10;
		int pageScale = 10;
		
		int totalCount = serviceImplements.totalCount(map.getMap());
		
		System.out.println(totalCount + "개가 있습니다.");
		
		//전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);
		
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
		
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		
		List<Map<String, Object>> ublist = serviceImplements.userBoard(map.getMap());
		List<Map<String, Object>> hotList = serviceImplements.hotList(map.getMap());		
		System.out.println("hotList OK");
		
		mv.addObject("list", ublist);
		mv.addObject("hotList", hotList);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		
		return mv;
	}
	
	@RequestMapping(value="/ubdetail")
	public ModelAndView ubdetail(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ubdetail");
		
		String ip = util.getUserIp(request);
		String target = "ubdetail"; 
		String data = "유저게시판 디테일";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		Map<String, Object> detail = serviceImplements.ubDetail(map.getMap());		
		
		mv.addObject("detail", detail);
		
		return mv;
	}
	
	//샛별수정 1020
	@RequestMapping(value="/ubLike")
	public @ResponseBody String ubLike(CommandMap map, HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "userLike"; 
		String data = "유저게시판 좋아요";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		String chk = "0";
		int chkInt = serviceImplements.ubLike(map.getMap());
		chk = Integer.toString(chkInt);
		return chk;
	}
	
	@RequestMapping(value = "/map.do")
    public ModelAndView map(HttpServletRequest request) {
		
		String ip = util.getUserIp(request);
		String target = "map"; 
		String data = "유저게시판 지도";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
        // 반환타입에 들어갈 수 있는 것 3가지
        // void 반환타입 없음 = 내부처리만 시키고 끝.
        // String DB에 값 없이 페이지만 호출할때
        // ModelAndView DB에 질의해서 반환타입을 view로 보낼때
        // Model
        ModelAndView mv = new ModelAndView("map");// board.jsp
        // DB에 질의 하고 = select
        List<Map<String, Object>> list = serviceImplements.boardList();
        // mv에 데이터 붙이기
        mv.addObject("list", list);// key value
        // System.out.println(list);//출력해보기
        return mv;
    }
	
	//샛별추가 1020
	@RequestMapping(value = "/ubDelete.do")
	public String ubDelete(CommandMap map) {
		serviceImplements.ubDelete(map.getMap());
		
		return "redirect: userBoard.do";
	}
	
	@RequestMapping(value="/ubUpdate.do", method=RequestMethod.GET)
	public ModelAndView ubUpdate(CommandMap map) {
		ModelAndView mv = new ModelAndView("ubUpdate");
		
		Map<String, Object> detail = serviceImplements.ubDetail(map.getMap());		
		//수정용 디테일 불러오기
		mv.addObject("detail", detail);
		return mv;
	}
	
	@RequestMapping(value="/ubUpdate", method=RequestMethod.POST)
	public String ubUpdate(HttpServletRequest request, CommandMap map) throws Exception {
		
		String ip = util.getUserIp(request);
		String target = "ubUpdate"; 
		String data = "유저게시판 업데이트";
		 
		LogDTO log = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("l_id") != null) {
			String id = (String)session.getAttribute("l_id");
			log = new LogDTO(ip, target, id, data);
		} else {
			log = new LogDTO(ip, target, data);
		}
		
		logService.writeLog(log);
		
		if(session.getAttribute("l_id") == null) {
			return "redirect: login.do";
		}
		
		map.put("re_no", util.str2Int2(request.getParameter("region"))); //구역
		System.out.println("url : " + map.get("url"));
		
		serviceImplements.ubUpdate(map.getMap());
		
		return "redirect: userBoard.do";
	}
	
	@RequestMapping(value="/testUpload.do", method=RequestMethod.GET)
	public String test() {
		return "testUpload";
	}
}
 