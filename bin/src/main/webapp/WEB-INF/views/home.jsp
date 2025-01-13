<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="manifest" href="/manifest.json">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script defer src="/js/home.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/inc/common/header.jsp"></jsp:include>
    <div class="container-h mt-4">
        <div class="search-section mb-3">
	    <form id="searchForm" action="/" method="get" class="d-flex align-items-center">
	        <input type="text" id="search-input" name="query" class="search-input" placeholder="상품을 검색하세요" value="${query}">
	        <button type="submit" id="search-button" class="search-button">
	            <i class="fas fa-search"></i>
	        </button>
	    </form>
	    <!-- 위치 정보를 가져오는 버튼 -->
		<button class="btn btn-secondary" id="getLocationBtn">내 위치 가져오기</button>
		
		<!-- 위도와 경도를 표시할 숨겨진 필드 -->
		<input type="hidden" id="latitude" name="latitude" value="36.35212915">
		<input type="hidden" id="longitude" name="longitude" value="127.37818526">
	</div>
        
        <!-- 카드 리스트 영역 -->
        <div class="row row-cols-1 row-cols-md-4 g-4" id="product-container">
            <c:forEach var="product" items="${productList}">
                <div class="col card-prod">
                    <div class="card h-100 d-flex flex-row align-items-center product-card" data-prodid="${product.prodId}">
                        <!-- 이미지 영역 -->
                        <img src="${product.imagePath != null ? product.imagePath : '/assets/img/noimg.png'}" 
                             class="fixed-image" alt="recommend">
                        
                        <!-- 텍스트 영역 -->
                        <div class="card-body">
                            <p class="card-title">${product.prodName}</p>
                            <!-- 위치 정보 -->
                            <p class="card-text">${product.cityAndDistrict}</p>
                            <!-- 가격과 시간 가로 배치 -->
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <p class="card-text mb-0">${product.formattedPrice}원</p>
                                <p class="card-text mb-0" style="margin-left: 10px;">${product.relativeTime}</p>
                            </div>
                            <!-- 현재 나의 위치와 판매하는 곳과의 거리 -->
                            <p class="card-text">
							    <c:choose>
							        <c:when test="${not empty product.distanceKm}">
							            ${product.distanceKm}km
							        </c:when>
							        <c:otherwise>
							            거리 알 수 없음
							        </c:otherwise>
							    </c:choose>
							</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- 더보기 버튼 -->
        <div class="mt-4 d-flex justify-content-end">
            <button class="btn btn-primary" id="more" data-offset="8">더보기 +</button>
        </div>
        <c:if test="${not empty userInfo}">
            <div class="mt-4 d-flex justify-content-end">
                <button class="btn btn-primary" data-id="${userInfo.memId }" id="subscribeBtn">푸시 알람 구독하기!</button>
                <input type="hidden" value="${vapidPublicKey}" id="key">
            </div>
        </c:if>
    </div>
<jsp:include page="/WEB-INF/inc/common/footer.jsp"></jsp:include>

<!-- 판매 등록 버튼 -->
<button class="fixed-sell-button" onclick="window.location.href='/sell/main'">
    <i class="fas fa-plus">판매등록</i>
</button>

<script>
$(document).ready(function() {
	var query = "${query}";
	
	$("#getLocationBtn").on("click", function() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            var latitude = position.coords.latitude;
	            var longitude = position.coords.longitude;
	            var query = $("#search-input").val(); // 검색어

	            // hidden input에 값 설정 (필요할 경우)
	            $("#latitude").val(latitude);
	            $("#longitude").val(longitude);

	            // Ajax 요청으로 상품 목록 가져오기
	            $.ajax({
	                url: "/more", // 서버 엔드포인트
	                type: "GET",
	                data: {
	                    query: query,
	                    latitude: latitude,
	                    longitude: longitude,
	                    offset: 0 // 처음부터 데이터를 가져오므로 0으로 설정
	                },
	                dataType: "json",
	                success: function(data) {
	                    // 기존 상품 목록 제거
	                    $("#product-container").empty();

	                    // 새로운 상품 목록 추가
	                    for (var i = 0; i < data.length; i++) {
	                        var product = data[i];
	                        var imgPath = product.imagePath ? product.imagePath : '/assets/img/noimg.png';

	                        var cardHtml = 
	                            '<div class="col card-prod">' +
	                                '<div class="card h-100 d-flex flex-row align-items-center product-card" data-prodid="' + product.prodId + '">' +
	                                    '<img src="' + imgPath + '" class="fixed-image" alt="recommend">' +
	                                    '<div class="card-body">' +
	                                        '<p class="card-title">' + product.prodName + '</p>' +
	                                        '<p class="card-text">' + product.cityAndDistrict + '</p>' +
	                                        '<div class="d-flex justify-content-between align-items-center mt-2">' +
	                                            '<p class="card-text mb-0">' + product.formattedPrice + '원</p>' +
	                                            '<p class="card-text mb-0" style="margin-left: 10px;">' + product.relativeTime + '</p>' +
	                                        '</div>' +
	                                        '<p class="card-text">' + product.distanceKm + ' km</p>' +
	                                    '</div>' +
	                                '</div>' +
	                            '</div>';

	                        $("#product-container").append(cardHtml);
	                    }
	                },
	                error: function() {
	                    alert("상품 목록을 가져오는 데 실패했습니다.");
	                }
	            });
	        }, function() {
	            alert("위치 정보를 가져올 수 없습니다. 권한을 확인해주세요.");
	        });
	    } else {
	        alert("이 브라우저는 위치 정보를 지원하지 않습니다.");
	    }
	});
	
    // 카드 클릭 이벤트
    $("#product-container").on("click", ".product-card", function () {
        var prodId = $(this).data("prodid");
        if (prodId) {
            window.location.href = "/product/detail?prodId=" + prodId;
        }
    });

    // 이미지 클릭 이벤트 차단
    $("#product-container").on("click", ".product-card img", function (e) {
        e.stopPropagation();
    });

    // '더보기' 버튼 클릭 이벤트
    $("#more").on("click", function () {
        var $btn = $(this);
        var offset = $btn.data("offset");
        var latitude = $("#latitude").val(); // 현재 저장된 위도
        var longitude = $("#longitude").val(); // 현재 저장된 경도

        $.ajax({
            url: "/more",
            type: "GET",
            data: {
                query: query,
                offset: offset,
                latitude: latitude, // 위도 추가
                longitude: longitude // 경도 추가
            },
            dataType: "json",
            success: function (data) {
                if (data && data.length > 0) {
                    $.each(data, function (index, product) {
                        var imgPath = product.imagePath ? product.imagePath : '/assets/img/noimg.png';
                        var cardHtml = 
                            '<div class="col card-prod">' +
                                '<div class="card h-100 d-flex flex-row align-items-center product-card" data-prodid="' + product.prodId + '">' +
                                    '<img src="' + imgPath + '" class="fixed-image" alt="recommend">' +
                                    '<div class="card-body">' +
                                        '<p class="card-title">' + product.prodName + '</p>' +
                                        '<p class="card-text">' + product.cityAndDistrict + '</p>' +
                                        '<div class="d-flex justify-content-between align-items-center mt-2">' +
                                            '<p class="card-text mb-0">' + product.formattedPrice + '원</p>' +
                                            '<p class="card-text mb-0" style="margin-left: 10px;">' + product.relativeTime + '</p>' +
                                        '</div>' +
                                        '<p class="card-text">' + product.distanceKm + ' km</p>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                        $("#product-container").append(cardHtml);
                    });
                    $btn.data("offset", offset + 4);
                } else {
                    $btn.prop("disabled", true).text("더 이상 상품이 없습니다");
                }
            }
        });
    });
});
</script>
<script src="main.js" ></script>
</body>
</html>