<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/style.css">
<style type="text/css">
#join {
	margin: 0 auto;
	height: auto;
	width: 500px;
	background-color: lavender;
	padding: 10px;
	text-align: center;
}

table {
	margin: 0 auto;
	height: 100%;
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 10px;
}

th, td {
	border-bottom: 1px solid silver;
}

td {
	text-align: left;
}

input {
	width: 180px;;
	height: 40px;
	margin: 5px;
	padding: 5px;
}

button {
	width: 45%;
	height: 40px;
	font-size: large;
}
</style>
<!-- jquery 가져오기 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var idchk = 0;
	var pwchk = 0;

	function check() {
		var l_id = $("#l_id").val();

		//id 확인
		if (l_id == "" || l_id.length < 5) {
			$("#checkResult").css("color", "red");
			$("#checkResult").text("ID를 5자 이상 입력하세요.");
			$("#l_id").focus();
			$("#joinbtn").attr("disabled", true);
			idchk = 0;
			return false;
		} else {
			$.ajax({
				url : "./checkID.do",
				type : "post",
				cache : false,
				dataType : "html",
				data : {
					'l_id' : l_id
				},
				success : function(chk) {
					if (chk == 1) {
						$("#checkResult").css("color", "red");
						alert(l_id + "는 이미 가입된 ID입니다.");
						$("#l_id").focus();
						$("#checkResult").text("이미 가입된 ID입니다.");
						$("#joinbtn").attr("disabled", true);
						$("#l_id").val("");
						idchk = 0;
					} else {
						$("#checkResult").css("color", "green");
						$("#checkResult").text("가입 가능한 id입니다.");
						idchk = 1;
						checkPw();
					}
				},
				error : function(request, status, error) {
					//alert(error);
				}
			});
		}
	}

	function checkPw() {
		//pw 확인
		var pw1 = $("#l_pw").val();
		var pw2 = $("#l_pw_chk").val();

		if (pw1.length < 4) {
			$("#checkPw").css("color", "red");
			$("#checkPw").text("비밀번호를 4자 이상 입력하세요.");
			pwchk = 0;
			return false;
		}

		if (pw1 != pw2) {
			$("#checkPw").css("color", "red");
			$("#checkPw").text("비밀번호를 확인하세요.");
			$("#joinbtn").attr("disabled", true);
			pwchk = 0;
			return false;
		} else {
			pwchk = 1;
			$("#checkPw").css("color", "green");
			$("#checkPw").text("비밀번호가 일치합니다.");
			if (idchk == 1 && pwchk == 1) {
				$("#joinbtn").attr("disabled", false);
			} else if (idchk == 0) {
				$("#joinbtn").attr("disabled", true);
			}
		}
	}
</script>
</head>
<body>
	<c:import url="./banner.jsp" />
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>
		<div id="article" align="center"
			style="display: flex; flex-direction: column; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
			<div id="container">
				<div id="header"></div>
				<div id="main">
					<div id="join">
						<h1>회원가입하기</h1>
						<form action="./join.do" method="post">
							<table>
								<tr>
									<th>아 이 디</th>
									<td><input type="text" name="l_id" id="l_id"
										required="required" onchange="return check()">
										<p id="checkResult">아이디를 입력하세요.</p></td>
								</tr>
								<tr>
									<th>이 &emsp; 름</th>
									<td><input type="text" name="l_name" id="l_name"
										required="required"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="l_pw" id="l_pw"
										required="required"><br> <input type="password"
										name="l_pw_chk" id="l_pw_chk" required="required"
										onchange="return checkPw()"><br>
										<p id="checkPw"></p></td>
								</tr>
								<tr>
									<th>이 메 일</th>
									<td><input type="email" name="l_email" id="l_email"
										required="required"></td>
								</tr>
							</table>
							<button type="submit" id="joinbtn" disabled="disabled"
								onclick="joinok()">가입하기</button>
							<button type="reset" onclick="location.href='main.do'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="./sidebar.jsp"/>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>