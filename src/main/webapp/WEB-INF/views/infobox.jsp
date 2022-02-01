<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="./resources/js/typeList.js"></script>
<script type="text/javascript">
window.onload = function() {
function masking(email) {	
	var len = email.split('@')[0].length-3;
	return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');	 
	}
	const eemail = document.querySelector(".email");
	eemail.innerHTML = masking("${infobox.l_email }");

//	if(${infobox.l_type ne null}) {
//		const resultName = document.querySelector(".info");
//		resultName.innerHTML = (resultList[${infobox.l_type}].name + ", ");
//		return resultName;
//		}
}
</script>
<script type="text/javascript">

</script>
<style type="text/css">
a, a:link{ 
	text-decoration:none;
	color: dimgray;
}
a:hover{
	color: black;
	text-decoration: underline;
}
.login {
	height: auto;
	border-radius: 10px;
	vertical-align: middle;
	margin: 0 auto;
	padding: 10px;
}
</style>
<script type="text/javascript">
function logout() {
	if (confirm("로그아웃 하시겠습니까?")) {
		location.href = "logout.do";
	}
}

function goInfo() {
	var newWindow = window.open("about:blank");
	newWindow.location.href = './myinfo.do';
}

</script>
<body>
	<div class="login" style="padding: 20px;">
		<c:choose>
			<c:when test="${sessionScope.l_id ne null }">
			<a class="info"></a>${infobox.l_name }님 반갑습니다 
			<br>
			닉네임: ${infobox.l_name }
				<!-- 관리자 -->
				<c:if test="${infobox.l_grade eq 9}">
					(<a href="./admin.do">관리자</a>)
				</c:if>
			<br> 
			email: <a class="email"></a> <br>
				<button onclick="goInfo()" style="margin-top: 10px;">내 정보 수정</button>
				<button onclick="return logout()">로그아웃</button>
			</c:when>

			<c:otherwise>
				<c:if test="${param.code eq 'loginfail' }">
					<p id="error">로그인 실패, 아이디나 비밀번호를 다시 입력하세요.</p>
				</c:if>
				<c:if test="${param.code eq 'join' }">
					<p style="color: gray;">회원가입을 축하합니다!<br>가입한 아이디로 로그인하세요.</p>
				</c:if>
				<c:if test="${code eq 'changepw' }">
					<p>비밀번호가 변경되었습니다.<br>바뀐 비밀번호로 로그인하세요.</p>
				</c:if>
					<div style="margin: 0; text-align: center; width: 220px;">
						<form action="./login.do" method="post">
						<div style="display:flex; flex-direction:row;">
							<div >
								<input type="text" name="l_id" style=" margin-bottom:5px; width: 150px;"><br>
								<input type="password" name="l_pw" style=" width: 150px;"><br>
							</div>
							<div style="display:flex; flex-direction:column; justify-content: center;">
								<button type="submit" style="margin-left:5px; height: 48px; width: 60px; ">로그인</button>
							</div>
						</div>
						</form>
						<div style="display: inline-block; margin-top: 5px; ">
							<a href="./join.do"> 회원가입</a> | 
							<a href="./findid.do">아이디 찾기</a>
						</div>
					</div>
			</c:otherwise>
		</c:choose>
		<c:if test="">
			<a href="./admin.do">관리자</a>
		</c:if>
	</div>
	<!-- end of login -->
</body>