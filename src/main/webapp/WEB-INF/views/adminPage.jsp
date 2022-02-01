<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="./slider3.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<title>admin page</title>
<style type="text/css">
table {
	margin: 0 auto;
	width: 100%;
	height: 500px;
	border-collapse: collapse;
}

th {
	background-color: #DBDBDB;
	color: #fff;
}

tr {
	border-bottom: 1px gray solid;
}

td {
	text-align: center;
}

#title {
	text-align: left;
}

#paging {
	text-align: center;
	margin: 10px auto;
}

#paging img {
	vertical-align: middle;
}

#paging a {
	display: inline-block;
	padding: 0 3px;
}

#paging a:hover {
	background-color: #EAFAF1;
	border-color: #eee;
	box-shadow: 3px 3px 3px #7DCEA0;
}
</style>
</head>
<script type="text/javascript">
	function del(no){
/* 	alert(no);*/		
 if (confirm("delete number " + no + "?")) {
	alert("deleting "+ no);
	 location.href="./adminDelete.do?b_no="+no;
	}

	}
	
	
	function modify(no){
		location.href="./adminModify.do?b_no="+no;
	}
	function cancelDel(no){
		location.href="./adminCancelDelete.do?b_no="+ no; 
	}
	
	
	function linkPage(pageNo){
		location.href="./adminPage.do?pageNo="+pageNo+"<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>";
	}
</script>
<body>
	<div>
		<c:import url="./banner.jsp" />
		<div id="middle" align="center"
			style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
			<div style="width: 20px;"></div>


			<div id="article"
				style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
				<div>

					<h2>관광지 글 게시판</h2>

					<h2>
						<c:if test="${searchName ne null }">
		검색:  ${search }
		<button onclick="location.href='./adminPage.do'">검색초기화</button>
						</c:if>
					</h2>
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<table>
								<tr>
									<th>글번호</th>
									<th>지역</th>
									<th>관광지</th>
									<th>지역번호</th>
									<th>내용</th>
									<th>날짜</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>웹</th>
									<th>이용시간</th>
									<th>추가 정보</th>
									<th title="클릭하여 이미지 파일을 보세요">파일<small>(파일 보기)</small></th>
									<th>아이디 이름</th>
									<th>아이디</th>
									<th>삭제 여부 <small>(0이면 삭제)</small></th>
									<th></th>
									<th></th>
									<th></th>

								</tr>
								<c:forEach items="${list }" var="l">
									<tr onclick="location.href='./adminDetail.do?b_no=${l.b_no}'">
										<td>${l.b_no }</td>
										<td>${l.re_category }</td>
										<td>${l.b_title }</td>
										<td>${l.re_no}</td>
										<td title="${l.b_content }"><c:set var='content'
												value="${l.b_content }" /> <c:set var='shortenContent'
												value="${fn:substring(content, 0, 20)}" /> <c:choose>
												<c:when test="${fn:length(shortenContent) gt 0}">
								${shortenContent }...			
								</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose></td>
										<td><fmt:formatDate value="${l.b_date }"
												pattern="yyyy-MM-dd" /></td>
										<td title="${l.b_addr }"><c:set var='addr'
												value="${l.b_addr }" /> <c:set var='shortenAddr'
												value="${fn:substring(addr, 0, 5)}" /> <c:choose>
												<c:when test="${fn:length(shortenAddr) gt 0}">
								${shortenAddr }...
								</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose></td>
										<td>${l.b_tele }</td>
										<td title="${l.b_web }"><c:set var='web'
												value="${l.b_web}" /> <c:set var='shortenWeb'
												value="${fn:substring(web, 8, 26)}" /> <c:choose>
												<c:when test="${fn:length(shortenWeb) gt 0}">
								${shortenWeb}...
								</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose></td>

										<td title="${l.b_time}"><c:set var='time'
												value="${l.b_time}" /> <c:set var='shortenTime'
												value="${fn:substring(time, 0, 10)}" /> <c:choose>
												<c:when test="${fn:length(shortenTime) gt 0}">
								${shortenTime}...
								</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose></td>
										<td title="${l.b_tip}"><c:set var='tip'
												value="${l.b_tip}" /> <c:set var='shortenTip'
												value="${fn:substring(tip, 0, 10)}" /> <c:choose>
												<c:when test="${fn:length(shortenTip) gt 0}">
									${shortenTip}...
								</c:when>
												<c:otherwise>

												</c:otherwise>
											</c:choose></td>
										<td title="${l.b_url }" onclick="location.href='${l.b_url }'">

											<c:set var='url' value="${l.b_url}" /> <c:set
												var='shortenurl' value="${fn:substring(url, 25, 38)}" />
											${shortenurl}

										</td>
										<td>${l.l_name }</td>
										<td>${l.l_id }</td>
										<td>${l.visi }</td>
										<td>
											<button onclick="del(${l.b_no})">삭제</button>
										</td>
										<td>
											<button onclick="modify(${l.b_no})">수정</button>
										</td>
										<td>
											<button onclick="cancelDel(${l.b_no})">삭제취소</button>
										</td>


									</tr>

								</c:forEach>

							</table>
				</div>

				<!-- 페이징은 여기에 -->
				<div id="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="text"
						jsFunction="linkPage" />
					<form action="./adminPage.do" method="get">
						<select name="searchName">
							<option value="b_title"
								<c:if test="${searchName eq 'b_title' }">selected="selected</c:if>>관광지</option>
							<option value="re_category"
								<c:if test="${searchName eq 're_category' }">selected="selected</c:if>>지역</option>

						</select> <input type="text" name="search" value="${search }">
						<button>검색</button>
					</form>
				</div>
				</c:when>
				<c:otherwise>
					<h2>출력할 글이 없습니다.</h2>
				</c:otherwise>
				</c:choose>





				<button onclick="location.href='./write.do'">게시글 올리기</button>
			</div>
			<c:import url="./sidebar.jsp" />
		</div>
		<c:import url="./footer.jsp" />
	</div>
</body>
</html>