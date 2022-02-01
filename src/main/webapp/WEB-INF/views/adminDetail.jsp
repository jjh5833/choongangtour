<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<meta charset="UTF-8">
<title>modify</title>
<style type="text/css">
#detail {
	margin: 0 auto;
	width: 800px;
	height: auto;
	padding: 5px;
}

#box {
	width: calc(100% - 40px) auto;
	padding: 10px 20px;
	clear: both;
	background-color: #fafafa;
	color: #081e52;
}

th {
	width: 100px auto;
}
</style>
<script type="text/javascript">
	
</script>


<link rel="stylesheet" href="resources/css/style.css">

</head>
<body>
	<c:import url="./banner.jsp" />
	<div id="UI" align="center">
		<div style="padding-bottom: 10px; height: 5px;"></div>

		<div id="menubar" style="border-radius: 10px; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; padding: 10px; display: flex; flex-direction: row; justify-content: space-around; width: 1500px; padding-top: 10px;">

			<div style="margin-left: 0;">
				<a href="./"><img src="resources/img/logo.png" height="50px"
					style=""></a>
			</div>

			<div id="dropdown1">
				<img src="resources/img/Menu1.png" width="150px"
					style="padding-top: 10px">
				<div id="dropdown-content"
					style="box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px;">
					<h4>
						<a href='./boardRegion.do?re_no=1'>서울</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=2'>경기도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=3'>강원도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=4'>인천</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=5'>세종</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=6'>경상북도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=7'>경상남도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=8'>전라북도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=9'> 전라남도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=10'>충청북도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=11'>충청남도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=12'>대구</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=13'>대전</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=14'>울산</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=15'>제주도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=16'>독도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=17'>울릉도</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=18'>광주</a>
					</h4>
					<h4>
						<a href='./boardRegion.do?re_no=19'>북한</a>
					</h4>

					<h4>
						<a href='./boardRegion.do?re_no=20'>부산</a>
					</h4>
				</div>
			</div>
			<div>
				<a href="./userBoard.do"><img src="resources/img/Menu2.png"
					width="150px" style="padding-top: 10px"></a>
			</div>
			<div>
				<a href="./travelTest.do"><img src="resources/img/Menu3.png"
					width="150px" style="padding-top: 10px"></a>
			</div>
		</div>

	</div>




	<div id="middle" align=""
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article"
			style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">



			<c:forEach items="${list }" var="l" varStatus="status">
				<div id="detail">


					<div id="box">
						<h1>${list[0].re_category }${list[0].b_title }</h1>

						글번호 : ${l.b_no} <br> 선택한 지역 : ${l.re_category } <br> 선택한
						관광지 : ${l.b_title } <br> 쓴 날짜 :
						<fmt:formatDate value="${l.b_date }" pattern="yyyy-MM-dd (HH:mm)" />
						<br> <br>
						<div>내용 :${l.b_content }</div>

						<br> 주소 : ${l.b_addr } <br> 전화번호 : ${l.b_tele } <br>
						웹사이트 : ${l.b_web } <br> 이용시간 : ${l.b_time } <br> 이용요금 :
						${l.b_price } <br> 기타 정보 : ${l.b_tip } <br> 이미지 파일 :
						${l.b_imgTitle } <br> 이미지 : <img alt="" src="${l.b_url }"
							width="200" onclick="location.href='${l.b_url}'">


					</div>


					<button onclick="location.href='./adminModify.do?b_no=${l.b_no}'"
						type="submit" style="float: right" title="수정하기 페이지로 이동">수정하기</button>
				</div>
			</c:forEach>


		</div>
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>