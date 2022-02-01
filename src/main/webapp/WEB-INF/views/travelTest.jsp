<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelTest</title>

    <link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./resources/js/typeList.js"></script>
<link rel="stylesheet" href="./resources/css/travelTest.css">
<script type="text/javascript">
var l_type = "88";
const endPoint = 6;
const select = [0, 0, 0, 0, 0, 0];

// 요거 새로 만들어서
$(function(){
	let count = 0;
	qList(count);
	
	//질문란 함수
	function qList(count) {
		if (count === endPoint) {
			goResult();
			return;
		}
		var q = document.querySelector(".qBox");
		q.innerHTML = testList[count].q;
		for (let i in testList[count].a) {
			aList(testList[count].a[i].answer, count, i);
		}
		var status = document.querySelector(".statusBar");
		status.style.width = (100 / endPoint) * (count + 1) + "%";
	}
	
	//답변란 함수
	function aList(ansT, count, idx) {
		var a = document.querySelector(".aBox");
		var answer = document.createElement("button");
		answer.classList.add("answerList");
		a.appendChild(answer);
		answer.innerHTML = ansT;
		answer.addEventListener("click", function() {
			var list = document.querySelectorAll(".answerList")
			for (i = 0; i < list.length; i++) {
				list[i].disabled = true;
				list[i].style.display = "none";
			}
			var target = testList[count].a[idx].type;
			for (i = 0; i < target.length; i++) {
				select[target[i]] += 1;
			}
			qList(++count);
		}, false);
	}
	
	//결과페이지 가는 함수
	function goResult() {
		$("#test").hide();
		$("#result").show();
		setResult();
	}
})

window.onload = function() {
	
	function calResult() {
		l_type = select.indexOf(Math.max(...select));
		console.log(l_type);
		return l_type;
	}
	//결과페이지 띄우는 함수
	function setResult() {
		let point = calResult();
		const resultName = document.querySelector(".resultname");
		resultName.innerHTML = resultList[point].name;
		const resultDesc = document.querySelector(".resultDesc");
		resultDesc.innerHTML = resultList[point].desc;
	}
}
//ajax를 여기에
function clickB(){
	$.ajax({
		url : "./travelTest.do",
		type : "post",
		cache : false,
		data : {'l_type' : l_type},
		success : function(save){
			alert("저장되었습니다.");
		},
		error : function(){
			alert("에러가 발생했습니다.");
		}
	});
	return false;
}
//테스트페이지 가는 함수
function goTest() {
	if(${sessionScope.l_id ne null }) {
		$("#main").hide();
		$("#test").show();
	} else {
		alert("로그인 후 이용해주세요.");
		location.href = "login.do";
	}
}
</script>
</head>
<body>


<c:import url="./banner.jsp"/>

<div id ="middle"  align="center"   style=" padding-top: 20px; padding-bottom: 30px; display:flex; flex-direction: row; justify-content: space-evenly;">
  <div style="width:20px;"></div>


  <div id ="article" style="display:flex; flex-direction: row; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px;  border-radius: 10px; padding-top: 10px;   width: 1150px; ">
	


	<div>
		<section id="main" align="center" style="height:500px; width:800px;">
			<h3>나의 여행 목적은?</h3>
			<img src="./resources/img/paperplane.png" alt="testimg">
			<p>
				간단한 테스트를 통해<br> 나와 어울리는 여행지를 찾아볼까요?
			</p>
			<input type="button" value="시작" class="btn"
				onclick="goTest()">
		</section>

		<section id="test" align="center" style="height:500px; width:800px;">
			<div class="status">
				<div class="statusBar"></div>
			</div>
			<div class="qBox"></div>
			<div class="aBox"></div>
		</section>

		<section id="result" align="center" style="height:500px; width:800px;">
			<h1>당신의 결과는?</h1>
			<div class="resultname"></div>
			<div class="resultDesc"></div>
			<button class="btn2" onclick="return clickB()">결과 저장하기</button>
			<br>
			<button onclick="location.href='./'" class="btn2">메인페이지 돌아가기</button>
		</section>
	</div>
	
	
		</div> 




<c:import url="./sidebar.jsp"/>
</div>
<c:import url="./footer.jsp"/>
</body>
</html>