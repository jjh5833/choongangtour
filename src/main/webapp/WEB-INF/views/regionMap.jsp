<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>boardRegion</title>

<link rel="stylesheet" href="resources/css/style.css">
<style type="text/css">
#menu {
	font-size: 15pt;
	height: 100px;
	text-align: center;
	line-height: 100px;
}

#main {
	width: 60%;
	margin: 0 auto;
}

}
#uploadDate {
	float: right;
}

#content {
	position: relative;
}

#contextText {
	position: relative;
	font-size: 15pt;
}
</style>

</head>
<body>
	<div style="background-image: url(resources/img/4607190.jpg);">
		<c:import url="./banner.jsp" />
		<div id="middle" align="center"
			style="padding-top: 20px; padding-bottom: 30px; display: flex; flex-direction: row; justify-content: space-evenly;">
			<div style="width: 20px;"></div>


			<div id="article"
				style="background-color: white; display: flex; flex-direction: column; justify-content: flex-start; box-shadow: 1px 1px 1px 1px #C9C9C9; border-style: outset; border-radius: 10px; padding: 5px; border-radius: 10px; padding-top: 10px; width: 1150px;">



				<div id="main">
					<div id="menu" style="text-align: center">
						<a
							href="./boardRegion.do?re_no=${param.re_no }&b_title=${param.b_title}">상세정보</a>
						&ensp;&ensp; <a
							href="./regeionMap.do?re_no=${param.re_no }&b_title=${param.b_title}">지도</a>
						&ensp;&ensp;
						<!--  re_no를 request로 받아와서 mv로 가져오기 -->
						<a href="./boardRegion.do?re_no=${param.re_no }">주변 관광지</a>
						&ensp;&ensp;
						<!--  re_no를 request로 받아와서 mv로 가져오기 -->
					</div>
					<hr>
					<!--  줄 ---------------------------------------------------- -->
					<!--  1st paragraph---------------------------------------------------- -->


					<h2>${param.b_title }</h2>

					<!--  카카오 맵 aPI -->
					<div id="map" style="width: 100%; height: 680px;">


						<span id="maplevel"></span>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba29d96d2195f040d2c4e879a466cb6d"></script>
						<script>
							var container = document.getElementById('map');
							var region = '<c:out value="${param.b_title}"/>';

							if (region == "황령산") {
								var options = {
									center : new kakao.maps.LatLng(35.15724,
											129.08205), //부산 황령산 
									level : 5
								};
							} else if (region == "호천마을") {
								var options = {
									center : new kakao.maps.LatLng(
											35.144466740587355,
											129.0511832403426), //부산 호천마을 
									level : 4
								};

							} else if (region == "해운대") {
								var options = {
									center : new kakao.maps.LatLng(
											35.158766856894005,
											129.1600837614565), //부산 해운대 
									level : 5
								};

							} else if (region == "남산타워") {
								var options = {
									center : new kakao.maps.LatLng(
											37.55132248623301,
											126.9881729538852), // 남산타워 
									level : 5
								};

							} else if (region == "석촌호수") {
								var options = {
									center : new kakao.maps.LatLng(
											37.508571786706874,
											127.10050961249429), // 석촌호수 
									level : 5
								};

							} else if (region == "경복궁") {
								var options = {
									center : new kakao.maps.LatLng(
											37.57771574085136,
											126.97679733129208), // 경복궁 
									level : 5
								};

							} else if (region == "행주산성") {
								var options = {
									center : new kakao.maps.LatLng(
											37.60026607645785, 126.82483116289), // 행주산성 
									level : 6
								};

							} else if (region == "수원화성") {
								var options = {
									center : new kakao.maps.LatLng(
											37.287802926722144,
											127.01204250033702), // 수원화성 
									level : 5
								};

							} else if (region == "신륵사") {
								var options = {
									center : new kakao.maps.LatLng(
											37.29823614357013,
											127.65645615004242), // 신륵사  
									level : 6
								};

							} else if (region == "설악산") {
								var options = {
									center : new kakao.maps.LatLng(
											38.117522769800125,
											128.46469966784886), // 설악산 
									level : 9
								};

							} else if (region == "대관령") {
								var options = {
									center : new kakao.maps.LatLng(
											37.68826471090565,
											128.7555967478194), // 대관령 
									level : 6
								};

							} else if (region == "정동진해변") {
								var options = {
									center : new kakao.maps.LatLng(
											37.69085749945377,
											129.03455699748065), // 정동진해변 
									level : 5
								};

							} else if (region == "개항장 거리") {
								var options = {
									center : new kakao.maps.LatLng(
											37.473011685787846,
											126.62104510042349), // 개항장 거리 
									level : 2
								};

							} else if (region == "능허대지") {
								var options = {
									center : new kakao.maps.LatLng(
											37.42303943156977,
											126.64327326922722), // 능허대지 
									level : 1
								};

							} else if (region == "팔미도") {
								var options = {
									center : new kakao.maps.LatLng(
											37.358168882187044,
											126.51174196913624), // 팔미도 
									level : 3
								};

							} else if (region == "합강캠핑장") {
								var options = {
									center : new kakao.maps.LatLng(
											36.51594746075805,
											127.33586911315959), // 합강캠핑장 
									level : 6
								};

							} else if (region == "해운대") {
								var options = {
									center : new kakao.maps.LatLng(
											36.52278938417798,
											127.30243992504063), //부산 해운대 
									level : 5
								};

							} else if (region == "우주측지관측센터") {
								var options = {
									center : new kakao.maps.LatLng(
											36.522763518445814,
											127.30252575572723), // 우주측지관측센터 
									level : 4
								};

							} else if (region == "뒤웅박고을") {
								var options = {
									center : new kakao.maps.LatLng(
											36.67560927961038,
											127.2591874021944), // 뒤웅박고을 
									level : 6
								};

							} else if (region == "경주 월정교") {
								var options = {
									center : new kakao.maps.LatLng(
											35.82930586151676,
											129.21801401153414), // 경주 월정교 
									level : 2
								};

							} else if (region == "포항 호미곶 절경") {
								var options = {
									center : new kakao.maps.LatLng(
											36.07815310430972,
											129.56962201153908), //부산 해운대 
									level : 6
								};

							} else if (region == "영주 무섬마을") {
								var options = {
									center : new kakao.maps.LatLng(
											36.731876126563144,
											128.62164902033405), // 영주 무섬마을 
									level : 4
								};

							} else if (region == "욕지섬 모노레일") {
								var options = {
									center : new kakao.maps.LatLng(
											34.62908557973477,
											128.2633040187198), // 욕지섬 모노레일 
									level : 5
								};

							} else if (region == "한국 궁중 꽃 박물관") {
								var options = {
									center : new kakao.maps.LatLng(
											35.36692155446727,
											129.1757915115252), // 한국 궁중 꽃 박물관 
									level : 3
								};

							} else if (region == "외도 보타니아") {
								var options = {
									center : new kakao.maps.LatLng(
											34.76973541091898,
											128.71291688267797), // 외도 보타니아 
									level : 7
								};

							} else if (region == "목포 해상케이블카") {
								var options = {
									center : new kakao.maps.LatLng(
											34.7985421324822,
											126.36935269802171), // 목포 해상케이블카 
									level : 5
								};

							} else if (region == "진도 대마도") {
								var options = {
									center : new kakao.maps.LatLng(
											34.27036242081869,
											125.99090060612758), // 진도 대마도 
									level : 8
								};

							} else if (region == "담양 추억의 골목") {
								var options = {
									center : new kakao.maps.LatLng(
											35.372429796080674,
											127.0195577826895), // 담양 추억의 골목 
									level : 3
								};

							} else if (region == "남원 광한루원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.40351545034977,
											127.37944642686908), // 남원 광한루원 
									level : 3
								};

							} else if (region == "군산 삼도귀범") {
								var options = {
									center : new kakao.maps.LatLng(
											35.80834595098194,
											126.40342000515012), // 군산 삼도귀범대 
									level : 8
								};

							} else if (region == "정읍 내장산국립공원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.49360596071365,
											126.92783829803508), // 정읍 내장산국립공원 
									level : 10
								};

							} else if (region == "단양 구담봉") {
								var options = {
									center : new kakao.maps.LatLng(
											36.9374546653744,
											128.24696072985947), // 단양 구담봉 
									level : 5
								};

							} else if (region == "옥천 부소담악") {
								var options = {
									center : new kakao.maps.LatLng(
											36.34892725274694,
											127.56693492503706), // 옥천 부소담악 
									level : 8
								};

							} else if (region == "문광 저수지 은행나무길") {
								var options = {
									center : new kakao.maps.LatLng(
											36.7680711979446,
											127.74703195906638), // 문광 저수지 은행나무길 
									level : 4
								};

							} else if (region == "성모당") {
								var options = {
									center : new kakao.maps.LatLng(
											35.861203066828196,
											128.5862733115347), // 성모당 
									level : 2
								};

							} else if (region == "비슬산 군립공원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.71692589793857,
											128.52487653606116), // 비슬산 군립공원 
									level : 7
								};

							} else if (region == "마비정 벽화마을") {
								var options = {
									center : new kakao.maps.LatLng(
											35.77908563712078,
											128.5423014091453), // 마비정 벽화마을 
									level : 1
								};

							} else if (region == "엑스포과학공원") {
								var options = {
									center : new kakao.maps.LatLng(
											36.376830921896996,
											127.37797537396135), // 엑스포과학공원 
									level : 5
								};

							} else if (region == "대전과학기술대학교 카리용") {
								var options = {
									center : new kakao.maps.LatLng(
											36.302290824263366,
											127.37565276518372), // 대전과학기술대학교 카리용 
									level : 3
								};

							} else if (region == "성심당") {
								var options = {
									center : new kakao.maps.LatLng(
											36.32764454055049,
											127.42727864567827), // 성심당 
									level : 1
								};

							} else if (region == "간절곶") {
								var options = {
									center : new kakao.maps.LatLng(
											35.35921454619115,
											129.36139579749522), // 간절곶 
									level : 2
								};

							} else if (region == "울산대공원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.53118297167874,
											129.29384871337922), // 울산대공원 
									level : 5
								};

							} else if (region == "간월산") {
								var options = {
									center : new kakao.maps.LatLng(
											35.55231993121823,
											129.04068744634085), // 간월산 
									level : 8
								};

							} else if (region == "성산일출봉") {
								var options = {
									center : new kakao.maps.LatLng(
											33.45998765475739,
											126.94172739829101), // 성산일출봉 
									level : 6
								};

							} else if (region == "천지연폭포") {
								var options = {
									center : new kakao.maps.LatLng(
											33.24708116815496,
											126.55441794650736), // 천지연폭포 
									level : 5
								};

							} else if (region == "우도 올레길") {
								var options = {
									center : new kakao.maps.LatLng(
											33.49314428555342,
											126.95181405381818), // 우도 올레길 
									level : 3
								};

							} else if (region == "독도") {
								var options = {
									center : new kakao.maps.LatLng(
											37.240954395465394,
											131.86748579985314), // 독도 
									level : 13
								};

							} else if (region == "내수전 일출전망대") {
								var options = {
									center : new kakao.maps.LatLng(
											37.512994811160056,
											130.90866636660513), // 내수전 일출전망대 
									level : 6
								};

							} else if (region == "성인봉") {
								var options = {
									center : new kakao.maps.LatLng(
											37.49765445861488,
											130.8670738646163), // 성인봉 
									level : 6
								};

							} else if (region == "사동") {
								var options = {
									center : new kakao.maps.LatLng(
											37.47781953942109,
											130.88091042265745), // 사동 
									level : 6
								};

							} else if (region == "무등산국립공원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.124285444461755,
											127.00844565753559), // 무등산국립공원 
									level : 8
								};

							} else if (region == "5·18 기념공원") {
								var options = {
									center : new kakao.maps.LatLng(
											35.15589530311228,
											126.85722262686444), // 5·18 기념공원 
									level : 4
								};

							}

							var map = new kakao.maps.Map(container, options);
							var marker = new kakao.maps.Marker({
								// 지도 중심좌표에 마커를 생성
								position : map.getCenter()
							});
							displayLevel();
							marker.setMap(map);
							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {

										// 클릭한 위도, 경도 정보를 가져옵니다 
										var latlng = mouseEvent.latLng;

										// 마커 위치를 클릭한 위치로 옮깁니다
										marker.setPosition(latlng);

									});
							function zoom() {
								var level = map.getLevel();
								map.setLevel(level - 1);
								displayLevel();
							}
							function zoomOut() {
								var level = map.getLevel();
								map.setLevel(level + 1);
								displayLevel();
							}
							function displayLevel() {
								var levelEl = document
										.getElementById('maplevel');
							}
						</script>
					</div>
					<button onclick="zoom()">확대</button>
					<button onclick="zoomOut()">축소</button>
					<button onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button>
					<button onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보
						보기</button>
					<button onclick="setOverlayMapTypeId('terrain')">지형정보 보기</button>
				</div>
				<script type="text/javascript">
					//지도에 추가된 지도타입정보를 가지고 있을 변수입니다
					var currentTypeId;

					//버튼이 클릭되면 호출되는 함수입니다
					function setOverlayMapTypeId(maptype) {
						var changeMaptype;

						// maptype에 따라 지도에 추가할 지도타입을 결정합니다
						if (maptype === 'traffic') {

							// 교통정보 지도타입
							changeMaptype = kakao.maps.MapTypeId.TRAFFIC;

						} else if (maptype === 'roadview') {

							// 로드뷰 도로정보 지도타입
							changeMaptype = kakao.maps.MapTypeId.ROADVIEW;

						} else if (maptype === 'terrain') {

							// 지형정보 지도타입
							changeMaptype = kakao.maps.MapTypeId.TERRAIN;

						}

						// 이미 등록된 지도 타입이 있으면 제거합니다
						if (currentTypeId) {
							map.removeOverlayMapTypeId(currentTypeId);
						}

						// maptype에 해당하는 지도타입을 지도에 추가합니다
						map.addOverlayMapTypeId(changeMaptype);

						// 지도에 추가된 타입정보를 갱신합니다
						currentTypeId = changeMaptype;
					}
				</script>
			</div>
			<c:import url="./sidebar.jsp"/>
		</div>
		<c:import url="./footer.jsp" />
	</div>
</body>
</html>
