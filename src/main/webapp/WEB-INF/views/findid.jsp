<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function check() {
		var l_name = $("#l_name").val();
		var l_email = $("#l_email").val();

		$.ajax({
			url : "./checkName.do",
			type : "post",
			cache : false,
			dataType : "html",
			data : {
				'l_name' : l_name,
				'l_email' : l_email
			},
			success : function(chk) {
				if (chk == 0) {
					$("#checkResult").css("color", "red");
					$("#checkResult").text("닉네임을 확인하세요.");
					$("#submit").attr("disabled", true);
				} else {
					$("#checkResult").css("color", "green");
					$("#checkResult").text("닉네임이 일치합니다. pw를 변경하세요.");
					$("#submit").attr("disabled", false);
				}
			},
			error : function(request, status, error) {
				//alert(error);
			}
		});

	}
</script>
</head>
<body>
	<c:import url="./banner.jsp" />
	<div id="middle" align="center"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>


		<div id="article" align="center"
			style="box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
			<div>
				<c:if test="${myinfo eq null }">
					<c:if test="${code eq 'NA' }">
						<p style="color: red">존재하지 않는 가입정보 입니다.</p>
					</c:if>
					<form action="./findid.do" method="post">
						<p>이메일을 입력하세요.</p>
						<input type="email" name="l_email" required="required">
						<button type="submit">찾기</button>
					</form>
				</c:if>
				<c:if test="${myinfo ne null }">
		찾으신 ID는 ${myinfo.l_id } 입니다.<br>
					<br>
		비밀번호를 바꾸려면 닉네임을 입력하세요.<br>
					<form action="./changeInfo.do" method="post">
						<input type="hidden" name="code" value="changepw"> <input
							type="hidden" name="l_no" value="${myinfo.l_no }"> email
						: <input type="email" name="l_email" id="l_email"
							value="${myinfo.l_email }" disabled="disabled"><br>
						name : <input type="text" name="l_name" id="l_name"
							required="required" onchange="return check()"><br>
						<p id="checkResult"></p>
						pw : <input type="password" name="pw"><br>
						<button type="submit" id="submit" disabled="disabled">변경</button>
					</form>
				</c:if>
			</div>
		</div>
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>