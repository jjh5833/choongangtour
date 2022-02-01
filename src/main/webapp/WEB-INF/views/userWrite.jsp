<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resources/css/style.css">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<meta charset="UTF-8">
<title>write</title>
<style type="text/css">
#write {
	margin: 0 auto;
	height: 300px;
	width: 800px;
}

input {
	width: 100%;
	height: 30px;
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
	<div id="middle"
		style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
		<div style="width: 20px;"></div>
		<div id="article"
			style="display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">
			<div id="write">
				<h2>게시글 쓰기</h2>
				<form action="./userWrite.do" id="fileForm"
					enctype="multipart/form-data" method="post">
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
					</select> <input type="text" name="b_title" placeholder="제목을 입력해주세요.">
					<br>
					<textarea name="b_content" id="summernote"></textarea>
					<br>
					<script type="text/javascript">
						$('#summernote').summernote({
							height : 500,
							minHeight : null, // set minimum height of editor
							maxHeight : null, // set maximum height of editor
							focus : true, // set focus to editable area after initializing summernote
							placeholder : '상세내용을 입력해주세요.'
						});
					</script>
					<input type="file" name="image" id="file" accept="*" />
					<button type="button" onclick="fileToImgbb()">파일 업로드</button>
					파일 선택 후 꼭 업로드 버튼을 눌러주세요<br> <input type="hidden" name="key"
						value="f6d096ba35b6760c08fb692ed72043ad"> <input
						type="hidden" name="b_url" id="b_url"> <input
						type="hidden" name="b_imgTitle" id="b_imgTitle">
					<button type="submit">쓰기</button>
					<br> <a href="userBoard.do">리스트로</a>
				</form>
			</div>
		</div>
		<c:import url="./sidebar.jsp" />
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>