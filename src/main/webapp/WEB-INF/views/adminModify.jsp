<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
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
#write {
	margin: 0 auto;
	height: 300px;
}

input {
	width: 100%;
	height: 30px;
	align: center;
}

textarea {
	width: 100%;
	height: 300px
}
</style>
<script type="text/javascript">
	function fileToImgbb() {
		var formData = new FormData($("#fileForm")[0]);
		$.ajax({
			url : "https://api.imgbb.com/1/upload",
			method : "post",
			contentType : false,
			processData : false,
			data : formData,
			success : function(response) {
				alert("success!");
				console.log(response);
				var jx = response;
				console.log(jx.data.url);
				$("#b_url").val(jx.data.url);
				$("#b_imgTitle").val(jx.data.title);
			},
			error : function(error) {
				alert("사진없음");
			}
		})
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




			<h1>${list[0].re_category }${list[0].b_title }</h1>
			<div id="modify">
				<form action="./adminModify.do" id="fileForm"
					enctype="multipart/form-data" method="post">
					<c:forEach items="${list }" var="l" varStatus="status">


						<input type="text" name="re_category" disabled="disabled"
							value="${l.b_no}번 글">
						<br>

						<select name="region">
							<option value="1">서울</option>
							<option value="2">경기도</option>
							<option value="3">강원도</option>
							<option value="4">인천</option>
							<option value="5">세종</option>
							<option value="6">경상북도</option>
							<option value="7">경상남도</option>
							<option value="8">전라북도</option>
							<option value="9">전라남도</option>
							<option value="10">충청북도</option>
							<option value="11">충청남도</option>
							<option value="12">대구</option>
							<option value="13">대전</option>
							<option value="14">울산</option>
							<option value="15">제주도</option>
							<option value="16">독도</option>
							<option value="17">울릉도</option>
							<option value="18">광주</option>
							<option value="19">북한</option>
							<option value="20">부산</option>
						</select>  이전에 선택한 지역 : ${l.re_category } <small>(꼭 지역을 선택해주세요!)</small>
						<input type="text" name="b_title" placeholder="지역 입력"
							value="${l.b_title }">
						<br>
						<textarea name="b_content" id="summernote">${l.b_content }</textarea>
						<br>
						<script type="text/javascript">
							$(document).ready(function() {
								$('#summernote').summernote({
									height : 400
								});
							});
						</script>
						<input type="text" name=" b_addr" placeholder="도로명주소 입력"
							value="${l.b_addr }">
						<input type="text" name=" b_tele" placeholder="전화번호 입력"
							value="${l.b_tele }">
						<input type="text" name=" b_web" placeholder="웹사이트 입력"
							value="${l.b_web }">
						<input type="text" name=" b_time" placeholder="이용시간 입력"
							value="${l.b_time }">
						<input type="text" name=" b_price" placeholder="이용료 입력"
							value="${l.b_price }">
						<input type="text" name=" b_tip" placeholder="기타 정보 입력 "
							value="${l.b_tip }">
						<br>
						<c:set var="url" value="${l.b_url }" />
						<c:choose>
							<c:when test="${fn:length(url)>0 }">
				이전에 사용한 이미지 : <br>
								<img alt="" src="${l.b_url }" width="200">
								<small>(${l.b_imgTitle })</small>
							</c:when>
							<c:otherwise>
				이전에 사용하신 이미지가 없습니다. 
				</c:otherwise>
						</c:choose>
						<input type="file" name="image" id="file" accept="*" />
						<input type="hidden" name="key"
							value="21adc3a0b114307e42a3adf011d0240b">
						<input type="hidden" name="b_url" id="b_url">
						<input type="hidden" name="b_imgTitle" id="b_imgTitle">
						<input type="hidden" name="b_no" value="${l.b_no }">
			파일 선택 후 꼭 업로드 버튼을 눌러주세요.<button type="button" onclick="fileToImgbb()">파일
							업로드</button>
						<br>
						<button type="submit">수정하기</button>
					</c:forEach>
				</form>
			</div>

		</div>
	<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>