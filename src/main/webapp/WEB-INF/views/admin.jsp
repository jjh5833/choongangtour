<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="./slider3.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<c:import url="./banner.jsp" />
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article"
			style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">

			<h2>관리자 페이지</h2>
			<button onclick="location.href='./adminPage.do'">관리자 관광 글 목록</button>
			<button onclick="location.href='./logList.do'">로그 목록</button>
			<button onclick="location.href='./write.do'">관리자 관광 정보 글 쓰기</button>
			<button onclick="location.href='./userList.do'">유저 리스트</button>
		</div>
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>
