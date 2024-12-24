<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세 페이지</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 상단 타이틀 */
        .title {
            text-align: center;
            font-size: 2rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        /* 메인 컨텐츠 영역 */
        .main-content {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .main-content img {
            flex: 1;
            max-width: 50%;
            height: auto;
            border-radius: 8px;
        }
       
        

        .details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .details div {
            margin-bottom: 10px;
            font-size: 14px;
        }

        /* 텍스트 영역 색상 변경 */
        .content {
            margin-top: 20px;
            padding: 15px;
            background-color: #f3f7f9; /* 연한 회색-파랑 톤 */
            border: 1px solid #e0e6eb;
            border-radius: 8px;
            color: #333;
        }

        /* 이미지 리스트 */
        .image-list {
            display: flex;
            gap: 10px;
            margin: 10px 0;
            overflow-x: auto;
        }

        .image-list img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid transparent;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .image-list img.active {
            border-color: #4CAF50;
        }

        /* 지도 이미지 */
        .map {
            width: 100%;
            margin-top: 20px;
            text-align: center;
        }

        .map img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* 가격 스타일 */
        .price {
            font-size: 1.2rem;
            font-weight: bold;
            text-align: right;
            color: #4CAF50;
            margin-top: 20px;
        }

        /* 버튼 */
        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            color: white;
            background-color: #FF7F00;
            border: none;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #e66f00;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }

            .main-content img {
                max-width: 100%;
            }

            .details div {
                text-align: center;
            }

            .price {
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 상품 제목 -->
    <h1 class="title">${product.prodName}</h1>

    <!-- 상품 메인 컨텐츠 -->
    <div class="main-content">
        <!-- 메인 이미지 배포시 주석 해제 밑의 임의 이미지 삭제!!!!!! -->
<%--         <c:if test="${mainPhoto != null}">
            <img src="${mainPhoto.prodPhotoPath}/${mainPhoto.photoName}" alt="메인 이미지" id="mainImage">
        </c:if> --%>
        
        <!-- 임의로 설정한 메인 이미지 -->
        <div>
    		<img src="/assets/img/ex1.jpg" alt="메인 이미지" id="mainImage">
    	</div>

        <!-- 상품 상세 정보 -->
        <div class="details">
            <div><strong>품목:</strong> ${product.prodCategory}</div>
            <div><strong>판매자:</strong> ${product.memNic}</div>
            <div><strong>신뢰도:</strong> ${product.memReliability}%</div>
            <div><strong>판매 지역:</strong> ${product.prodPlace}</div>
            <div><strong>등록일:</strong> ${product.createDt}</div>
        </div>
    </div>

    <!-- 추가 이미지 리스트 -->
    <div class="image-list" id="imageList">
    
       <%--  <c:forEach var="photo" items="${photoList}">
            <img src="${photo.prodPhotoPath}/${photo.photoName}" alt="추가 이미지" onclick="changeImage(this)">
        </c:forEach> --%>
        
         <!-- 임의로 설정한 추가 이미지 -->
    	<img src="/assets/img/ex2.jpg" alt="추가 이미지" onclick="changeImage(this)">
    	<img src="/assets/img/ex3.jpg" alt="추가 이미지" onclick="changeImage(this)">
    </div>

    <!-- 상품 설명 -->
    <div class="content">
        ${product.prodContent}
    </div>
    
    <!-- 지도 -->
    <div class="map">
        <h4>거래 희망 지역</h4>
        <!-- 지도 컨테이너 추가 -->
    	<div id="map" style="width:100%;height:350px;margin-top:15px;"></div>
    </div>

	<!-- 가격 표시 -->
	<div class="price">
	    <c:choose>
	        <c:when test="${product.prodPrice == 0}">
	                나눔하기
	        </c:when>
	        <c:otherwise>
	               가격: ${product.prodPrice}원
	        </c:otherwise>
	    </c:choose>
	</div>

    <!-- 구매하기 버튼 -->
    <button class="btn">구매하기</button>
</div>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoApiKey}&libraries=services"></script>
<script>
    /**
     * 이미지 클릭 시 메인 이미지를 변경하는 함수
     */
    function changeImage(element) {
        const mainImage = document.getElementById('mainImage');
        mainImage.src = element.src; 
    }
    
 // JSP에서 전달된 sellRegion 값을 JavaScript 변수에 할당
    var sellRegion = '${product.prodPlace}';

    // Kakao 지도 초기화
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 지도 중심 좌표 (기본값)
            level: 3 // 초기 확대 레벨
        };

    // 지도 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체 생성
    var geocoder = new kakao.maps.services.Geocoder();

    // 지도 마커 변수
    var marker = null;

    // sellRegion 주소로 좌표를 검색하여 지도에 표시
    if (sellRegion) {
        geocoder.addressSearch(sellRegion, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 마커 생성
                marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우 추가
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + sellRegion + '</div>'
                });
                infowindow.open(map, marker);

                // 지도 중심 좌표 이동
                map.setCenter(coords);
            } else {
                alert("주소를 검색할 수 없습니다.");
            }
        });
    } else {
        alert("표시할 주소가 없습니다.");
    }
</script>

</body>
</html>