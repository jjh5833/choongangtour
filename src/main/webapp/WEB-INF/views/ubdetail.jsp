<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/style.css">
<title>${detail.b_title}</title>
<style type="text/css">
table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 10px;
}

tr {
	border: 1px solid #CCCCCC;
}
</style>

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">

function ublike(b_no, ublike){
	if(ublike == 0){
		var ub = '비추천';
	} else{
		var ub = '추천';
	}
	
	if(confirm("게시글을 " + ub + "할까요?")){
		$.ajax({
			url : "./ubLike.do",
			type : "post",
			cache : false,
			dataType : "html",
			data : {'b_no' : b_no, 'ublikeValue' : ublike},
			success : function(chk){
				if(chk == 1){
					location.reload();
				} else{
					alert(ub + " 실패, 다시 이용해주세요");
				}
			},
			error : function(request, status, error){
				//alert(error);
			}
		});
	}
}

function ubUpdate(b_no){
	if(confirm("게시글을 수정하시겠습니까?")){
		location.href='./ubUpdate.do?b_no='+b_no;
	}
}

function ubDelete(b_no){
	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href='./ubDelete.do?b_no='+b_no;
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

			<div>
				<table>
					<tr>
						<td colspan="2">[${detail.re_category }] ${detail.b_title} <!-- 세션 일치 확인후 수정삭제 -->

						</td>
					</tr>
					<tr>
						<td>${detail.l_name }(${detail.l_id })</td>
						<td>${detail.b_date }</td>
					</tr>
					<tr>
						<td colspan="2"><c:if test="${detail.b_url ne null }">
								<img alt="${detail.b_imgTitle }" src="${detail.b_url }">
								<br>
							</c:if> ${detail.b_content }</td>
					</tr>
					<tr>
						<td>추천/비추천</td>
						<td id="b_like">${detail.b_like }
							<button onclick="ublike(${detail.b_no}, 1)">
								<img src="resources/img/heart.png" height="19px">
							</button> / ${detail.b_hate }
							<button onclick="ublike(${detail.b_no}, 0)">
								<img src="resources/img/broken-heart.png" height="20px">
							</button>
						</td>
					</tr>

				</table>
				<a href="userBoard.do">리스트</a>
				<c:if test="${sessionScope.l_id eq detail.l_id}">
					<button onclick="ubUpdate(${detail.b_no})">수정</button>
					<button onclick="ubDelete(${detail.b_no})">삭제</button>
				</c:if>
			</div>
		</div>
		<c:import url="./sidebar.jsp"/>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>