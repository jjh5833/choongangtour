<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.l_id eq null || sessionScope.l_name eq null}">
	<c:redirect url="./login.do" />
	<!-- 세션 없을 시 로그인 페이지로 -->
</c:if>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>내 정보 / 정보 변경</title>
<style type="text/css">
#infobox {
	padding: 20px;
	margin: 10px;
}

#submitbtn {
	float: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function deletemem() {
		if (confirm("회원을 탈퇴 하시겠습니까?")) {
			alert("회원을 탈퇴합니다.");
			location.href = './deletemember.do?l_no=' + $
			{
				myinfo.l_no
			}
			;
		}
	}

	function ok() {
		var pw = $("#pw").val();
		if (pw != "" && pw.length < 4) {
			$("#checkPw").css("color", "red");
			$("#checkPw").text("비밀번호를 4자 이상 입력하세요.");
			$("#pw").focus();
			return false;
		} else {
			alert("정보가 변경되었습니다.");
		}
	}
</script>
</head>
<body>
<c:import url="./banner.jsp"/>
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article" align="center"
			style="display: flex; flex-direction: column; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">

			<div id="infobox">
				<form action="./changeInfo.do" method="post"
					onsubmit="return password()">
					<input type="hidden" value="${myinfo.l_no }" name="l_no"> <input
						type="hidden" value="${myinfo.l_id }" name="l_id"> ID : <input
						type="text" value="${myinfo.l_id }" disabled="disabled"><br>
					email : <input type="text" value="${myinfo.l_email }"
						disabled="disabled"><br> 닉네임 : <input type="text"
						value="${myinfo.l_name }" name="l_name" required="required"><br>
					비밀번호 : <input type="password" name="pw" id="pw"
						onchange="return pwcheck()"><br> <input type="hidden"
						name="l_pw" value="${myinfo.l_pw }">
					<p id="checkPw"></p>
					<button type="submit" id="submitbtn" onclick="return ok()">정보변경</button>
					<button type="button" onclick="deletemem()" id="submitbtn">회원탈퇴</button>
				</form>
				<a href="home.do">홈으로</a>
			</div>
		</div>
		<c:import url="./sidebar.jsp"/>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>