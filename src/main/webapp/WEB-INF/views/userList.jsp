<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>유저리스트</title>

<link href="./css/index.css" rel="stylesheet">
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
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./userList.do?pageNo="
				+ pageNo
				+ "<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>";
	}
</script>
</head>
<body>

<c:import url="./banner.jsp"/>
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article"
			style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">

			<h1>유저리스트</h1>

			<h2>
				<c:if test="${searchName ne null }">
		${searchName } / ${search }
		<button onclick="location.href='./userList.do'">검색초기화</button>
				</c:if>
			</h2>

			<c:choose>
				<c:when test="${fn:length(list) gt 0 }">
					<table>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>등급</th>
						</tr>
						<c:forEach items="${list }" var="list">
							<tr>
								<td>${list.l_no }</td>
								<td>${list.l_id }</td>
								<td>${list.l_name }</td>
								<td>${list.l_email }</td>
								<td>${list.l_grade }</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징은 여기에 -->
					<div id="paging">
						<ui:pagination paginationInfo="${paginationInfo}" type="text"
							jsFunction="linkPage" />
						<form action="./userList.do" method="get">
							<select name="searchName">
								<option value="id"
									<c:if test="${searchName eq 'id' }">selected="selected</c:if>>아이디</option>
								<option value="name"
									<c:if test="${searchName eq 'name' }">selected="selected</c:if>>이름</option>
								<option value="email"
									<c:if test="${searchName eq 'email' }">selected="selected</c:if>>이메일</option>
								<option value="grade"
									<c:if test="${searchName eq 'grade' }">selected="selected</c:if>>등급</option>
								<option value="joindate"
									<c:if test="${searchName eq 'joindate' }">selected="selected</c:if>>날짜</option>
							</select> <input type="text" name="search" value="${search }">
							<button>검색</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<h2>출력할 글이 없습니다.</h2>
				</c:otherwise>
			</c:choose>
		</div>
		<c:import url="./sidebar.jsp"/>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>
