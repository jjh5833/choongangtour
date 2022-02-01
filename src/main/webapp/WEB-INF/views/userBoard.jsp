<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/userBoard.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>


<meta charset="UTF-8">
<title>CAT | 사용자 추천 게시판</title>
<style type="text/css">
a, a:link{ 
	text-decoration:none;
	color: dimgray;
}
a:hover{
	color: black;
}
table.hl{
	width: 480px;
	border-collapse: collapse;
	margin-left: 50px;
}
table.hl th{
	border-bottom: 1px solid;
}
table.hl td{
	margin-top: 10px;
}

table.hl td:hover{
	text-decoration: underline;
}
</style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function linkPage(pageNo) {
		<c:if test="${searchName != null}">
			var search = "&searchName=${searchName}&search=${search}";
			location.href = "./userBoard.do?pageNo=" + pageNo + search;
		</c:if>
		<c:if test="${searchName == null}">
			location.href = "./userBoard.do?pageNo=" + pageNo;
		</c:if>
	}
	
	function detail(b_no){
		location.href="./ubdetail.do?b_no="+b_no;
	}
</script>
</head>
<body>
<c:import url="./banner.jsp"/>
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>
		<div id="article"
			style="display: flex; flex-direction: column; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
			<div align="center" style="padding-bottom: 10px; padding-top: 10px;">
				<div id="banner"
					style="border-radius: 10px; width: 1073px; padding-left: 20px; padding-top: 20px; padding-bottom: 20px; display: flex; flex-direction: row;">
					<div style="width: 480px;">
						<img src="resources/img/CAT.jpg" width="100%" height="230px" style="border-radius: 20px;">
					</div>
					<div>
						<table class="hl">
							<tr>
								<th>제목</th>
								<th>날짜</th>
								<th><p style="color:red;">추천수<img alt="hot" src="https://i.ibb.co/yYZNgVB/hot1.png" height="25px;" style="vertical-align: bottom;"></p> </th>
							</tr>
							<c:forEach items="${hotList }" var="hl" >
								<tr>
									<td onclick="location.href='./ubdetail.do?b_no='+${hl.b_no}" style="text-align:left; cursor: pointer; padding-top: 10px; ">${hl.b_title }</td>
									<td>${hl.b_date }</td>
									<td style="text-align: center;">${hl.b_like }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

			<div>
				<table class="list">
					<tr>
						<th scope="row">글번호</th>
						<th scope="row">글제목</th>
						<th scope="row">쓴날짜</th>
						<th scope="row">쓴사람</th>
						<th scope="row">추천수</th>
					</tr>
					<c:forEach items="${list }" var="l">

						<tr>
							<td>${l.b_no }</td>
							<td onclick="location.href='./ubdetail.do?b_no='+${l.b_no}"
								style="width: 700px; cursor: pointer; text-align: left;">[${l.re_category}]
								${l.b_title }</td>
							<td>${l.b_date }</td>
							<td>${l.l_name }</td>
							<td>${l.b_like }</td>
						</tr>


					</c:forEach>
				</table>
			</div>


			<div>
				<ui:pagination paginationInfo="${paginationInfo }" type="text"
					jsFunction="linkPage" />
				<br> <br>

				<form action="./userBoard.do">
					<select name="searchName">
						<option>선택하세요</option>
						<option value="title"
							<c:if test="${searchName eq 'title' }" >selected="selected"</c:if>>제목</option>
						<option value="content"
							<c:if test="${searchName eq 'content' }">selected="selected"</c:if>>내용</option>
						<option value="writer"
							<c:if test="${searchName eq 'writer' }">selected="selected"</c:if>>글쓴이</option>
					</select> <input type="text" name="search" value="${search}">
					<button type="submit">검색</button>
					<br> 
					<!-- 샛별추가 1020 -->
					<c:if test="${sessionScope.l_id ne null}">	
						<a href="./userWrite.do">글쓰기</a>
					</c:if>
				</form>
			</div>
		</div>
		<c:import url="./sidebar.jsp"/>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>


