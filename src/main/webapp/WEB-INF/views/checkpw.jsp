<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.l_id eq null }">
	<c:redirect url="./login.do" />
	<!-- 세션 없을 시 다시 로그인 페이지로 -->
</c:if>

<!-- 내정보 이동 전 비밀번호로 본인확인 하는 페이지, logincontroller에서 (myinfo.do GET) 이동-->

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">

<meta charset="UTF-8">
<title>비밀번호확인</title>
<script type="text/javascript">
function chk(cnt){
	cnt++;
	if(cnt == 5){
		alert("비밀번호를 5번 틀렸습니다. 로그아웃 합니다.");
		location.href="./logout.do";
	}
}
</script>
</head>
<body>
	<c:import url="./banner.jsp" />
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article"
			style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">


			<div id="infobox">
				<!-- pwFailCnt(=비밀번호 틀린 횟수)가 5보다 크면 로그아웃 -->
				<c:if test="${sessionScope.pwFailCnt ne 0 }">
					<p style="color: red">비밀번호를 ${sessionScope.pwFailCnt }번 틀렸습니다.</p>
					<p style="color: gray">5번 틀릴 경우 로그아웃 됩니다.</p>
				</c:if>

				<form action="./myinfo.do" method="post">
					${sessionScope.l_name }님, 본인 확인을 위해 비밀번호를 입력하세요.<br> 비밀번호 : <input
						type="password" name="l_pw" id="l_pw" required="required">
					<input type="hidden" name="l_id" id="l_id"
						value="${sessionScope.l_id}">
					<button type="submit"
						onclick="return chk(${sessionScope.pwFailCnt})">확인</button>
				</form>
			</div>
		</div>
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>