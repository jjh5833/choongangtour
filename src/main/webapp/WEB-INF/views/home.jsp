<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="./slider3.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<title>CAT | Welcome To Our Journey!</title>
</head>
<body>
	<c:import url="./banner.jsp" />

	<div align="center" style="padding-bottom: 10px; padding-top: 10px;">
		<div id="banner"
			style="border-radius: 10px; width: 1470px; padding-left: 5px; padding-top: 10px; padding-bottom: 5px; display: flex; flex-direction: row; justify-content: space-between;; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset;">
			<div>
				<img src="resources/img/CAT.jpg" width="600px">
			</div>
			<div class="slider">
				<input type="radio" name="slide" id="slide1"> <input
					type="radio" name="slide" id="slide2"> <input type="radio"
					name="slide" id="slide3" checked> <input type="radio" name="slide"
					id="slide4">
				<ul id="imgholder" class="imgs">
					<li><a href="./ubdetail.do?b_no=195"><img
							src="resources/img/spring.jpg" width="350px"></a></li>
					<li><a href="./ubdetail.do?b_no=202"><img
							src="resources/img/summer.jpg" width="350px"></a></li>
					<li><a href="./ubdetail.do?b_no=194"> <img
							src="resources/img/autumn.jpg" width="350px"></a></li>
					<li><img src="resources/img/winter.jpg" width="350px"></li>
				</ul>
				<div class="bullets">
					<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
					<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
				</div>
			</div>
		</div>
	</div>

	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>
		<div id="article"
			style="display: flex; flex-direction: row; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
			<iframe id="map" src="./map.do" width="1200px" height="800px"></iframe>
		</div>
		
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>
