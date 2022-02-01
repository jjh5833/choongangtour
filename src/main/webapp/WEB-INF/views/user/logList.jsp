<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그리스트</title>
<link href="./css/index.css" rel="stylesheet">
<style type="text/css">
table {
	margin: 0 auto;
	width: 100%;
	height: 500px;
	border-collapse: collapse;
}

th {
	background-color: gray;
}

tr {
	border-bottom: 1px gray solid;
}
td{
	text-align: center;
}
#title{
text-align: left;
}
#paging{text-align:center;margin:10px auto;}
#paging img{vertical-align: middle;}
#paging a{display:inline-block; padding:0 3px;}
#paging a:hover{background-color:#EAFAF1;border-color:#eee;box-shadow:3px 3px 3px #7DCEA0;}
</style>
<script type="text/javascript">
function linkPage(pageNo){
	location.href="./logList.do?pageNo="+pageNo+"<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>";
}
</script>
</head>
<body>
	
	<h1>로그리스트 </h1>
	
	<h2>
	<c:if test="${searchName ne null }">
		${searchName } / ${search }
		<button onclick="location.href='./logList.do'">검색초기화</button>
	</c:if>
	</h2>
	
	<c:choose>
		<c:when test="${fn:length(list) gt 0 }">
			<table>
				<tr>
					<th>번호</th>
					<th>ip</th>
					<th>날짜</th>
					<th>페이지</th>
					<th>아이디</th>
					<th>내역</th>
				</tr>
				<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.sl_no }</td>
					<td>${list.sl_ip }</td>
					<td>${list.sl_date }</td>
					<td>${list.sl_target }</td>
					<td>${list.sl_id }</td>
					<td>${list.sl_data }</td>
				</tr>
				</c:forEach>
			</table>
			<!-- 페이징은 여기에 -->
			<div id="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage"/>
				<form action="./logList.do" method="get">
					<select name="searchName">
						<option value="ip" <c:if test="${searchName eq 'ip' }">selected="selected</c:if>>ip</option>
						<option value="id" <c:if test="${searchName eq 'id' }">selected="selected</c:if>>id</option>
						<option value="content" <c:if test="${searchName eq 'content' }">selected="selected</c:if>>내역</option>
						<option value="date" <c:if test="${searchName eq 'date' }">selected="selected</c:if>>날짜</option>
					</select>
					<input type="text" name="search" value="${search }">
					<button>검색</button>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<h2>출력할 글이 없습니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>