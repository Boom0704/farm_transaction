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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script defer src="/js/home.js"></script>
<style>
/* Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #f9f9f9;
}
.btn-location {
	background-color: #f9f9f9;
    margin: 20px;
    padding: 0.3%;
    font-size: 1rem;
    border: #f9f9f9;
    border-radius: 10px;
    text-align: center;
    color: lightcoral;
}

/*controls*/
.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    text-align: center;
}
.swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    transition-timing-function: var(--swiper-wrapper-transition-timing-function,initial);
    box-sizing: content-box;
}

.swiper a {
	display: block;
	position: relative
}

.swiper a:focus {
	outline: 2px dashed #99b0cb;
	outline-offset: -2px
}

.swiper-slide dl {
    padding: 10px;
    margin-top: 0 !important;
 	margin-bottom: 0 !important;
    background-color: white;
}
.swiper-slide img{
    width: 100%;
    height: 150px;
    object-fit: cover;
}

.swiper {
	width: 100%;
	height: 300px;
	border-radius: 10px;
}
.mWrap.clearfix {
    background-image: url("/static/assets/img/2.jpg");
    background-size: cover; /* 배경 이미지를 컨테이너에 맞게 조정 */
    background-position: center; /* 배경 이미지 중앙 정렬 */
    padding: 50px 19%;
    border-radius: 10px;
}

.swiper-button-prev:after, .swiper-button-next:after {
	font-size: 16px;
	color: black;
}

.mainArea section.rowgroup .mWrap {
	position: relative;
	width: 1400px;
	margin: auto;
	padding-top: 20px;
	padding-bottom: 40px;
}
/* 화살표 버튼 커스텀 */
.arrow {
    width: 40px;
    height: 40px;
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    cursor: pointer;
}

.swiper-button-prev:after, .swiper-button-next:after {
    font-size: 16px;
    color: white;
}

/* 페이지네이션 */
.swiper-pagination {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
}

.swiper-pagination-bullet {
	width: 12px;
	height: 12px;
	background: rgba(255, 255, 255, 0.7);
	border-radius: 50%;
	margin: 0 5px;
	cursor: pointer;
}

.swiper-pagination-bullet-active {
	background: #007bff;
}

.mainArea section.rowgroup .mWrap {
	position: relative;
	width: 1400px;
	margin: auto;
	padding-top: 20px;
	padding-bottom: 40px;
}

.swiper {
	margin-left: auto;
	margin-right: auto;
	position: relative;
	overflow: hidden;
	list-style: none;
	padding: 0;
	z-index: 1;
	display: block;
	width: 100%;
	height: 100%;
}
.swiper-slide curation_item{
	padding:100px;
}
.col card-prod{
	padding:10px;
}

.curation_wrap .curation_item dl {
	padding: 1.5rem 1.25rem;
}

@media screen and (max-width: 1400px) {
    .mainArea section.rowgroup .mWrap {
        width: 100%;
        padding: 40px 2%;
    }
}

@media screen and (max-width: 1024px) {
    .swiper {
        height: auto; /* 높이를 유동적으로 설정 */
    }
    .swiper-slide img {
        height: 200px; /* 중간 화면에서 이미지 높이 조정 */
    }
    .mainArea section.rowgroup .mWrap {
        padding: 20px;
    }
}

@media screen and (max-width: 768px) {
    .swiper-slide {
        border-radius: 5px; /* 작은 화면에서 둥글기를 줄임 */
    }
    .swiper-slide img {
        height: 150px; /* 이미지 높이 축소 */
    }
    .swiper-pagination-bullet {
        width: 10px;
        height: 10px;
    }
}

@media screen and (max-width: 480px) {
    .swiper-wrapper {
        border: none; /* 작은 화면에서는 테두리 제거 */
        box-shadow: none;
    }
    .swiper-wrapper dl {
        padding: 5px;
    }
    .swiper-wrapper img {
        height: 120px;
    }
}
@media screen and (max-width: 320px) {
    .swiper-slide img {
        height: 100px; /* 작은 화면에서는 이미지 크기 축소 */
    }
    .card-title {
        font-size: 0.8rem; /* 제목 폰트 크기 축소 */
    }
}
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/inc/common/header.jsp"></jsp:include>
		<div class="search-section mb-3">
			<form id="searchForm" action="/" method="get"
				class="d-flex align-items-center">
				<input type="text" id="search-input" name="query"
					class="search-input" placeholder="상품을 검색하세요" value="${query}">
				<button type="submit" id="search-button" class="search-button">
					<i class="fas fa-search"></i>
				</button>
			</form>
		<!-- 위치 정보를 가져오는 버튼 -->
		<div class="btn-location" id="getLocationBtn">현재위치<img src="/static/assets/img/location.png" style="margin-left: 5px; margin-bottom:5px;"></div>
		
		<!-- 위도와 경도를 표시할 숨겨진 필드 -->
		<input type="hidden" id="latitude" name="latitude" value="36.35212915">
		<input type="hidden" id="longitude" name="longitude" value="127.37818526">

	</div>
	<!-- Carousel Start -->
	<section class="rowgroup">
		<div class="mWrap clearfix">
			<div class="swiper curationSlider">
				<div class="swiper-wrapper">
					<div class="swiper-slide curation_item">
						<a
							href="/portal/ps/psv/psvr/psvre/curationDtl.ps?menuId=PS03352&amp;srchCurationNo=2007">
							<span class="thumB"> <img
								src="https://www.nongsaro.go.kr/portal/imgView.do?ep=a5gb/CMEYLclIUPoWw9/DZpAzn2z8@sWTCNA5pR4wDUDqp0Qot6eK6Ng@cw3dhvIzd8IF7zcZgm2v4b1eBz/Hg!!"
								alt="딸기 주요 생리장해에 대해 알아 볼까요?" class="swiper-lazy">
						</span>
						</a>
							<dl>
								<dt>딸기 주요 생리장해에 대해 알아 볼까요?</dt>
								<dd class="date">1월 초순</dd>
							</dl>
					</div>
					<div class="swiper-slide curation_item">
						<a href="/portal/ps/psv/psvr/psvre/curationDtl.ps?menuId=PS03352&amp;srchCurationNo=2008">
							<span class="thumB"> <img
								src="https://www.nongsaro.go.kr/portal/imgView.do?ep=a5gb/CMEYLclIUPoWw9/DZpAzn2z8@sWTCNA5pR4wDX/8RFBEuKfnIUj6wnjBI1kzd8IF7zcZgm2v4b1eBz/Hg!!"
								alt="딸기 주요 생리장해에 대해 알아 볼까요?" class="swiper-lazy">
						</span>
						</a>
							<dl>
								<dt>딸기 주요 생리장해에 대해 알아 볼까요?</dt>
								<dd class="date">1월 초순</dd>
							</dl>
					</div>
					<div class="swiper-slide curation_item">
						<a
							href="/portal/ps/psv/psvr/psvre/curationDtl.ps?menuId=PS03352&amp;srchCurationNo=2008">
							<span class="thumB"> <img
								src="https://www.nongsaro.go.kr/portal/imgView.do?ep=a5gb/CMEYLclIUPoWw9/DZpAzn2z8@sWTCNA5pR4wDVVe/ttneoHjYMGdA9aiCeJzd8IF7zcZgm2v4b1eBz/Hg!!"
								alt="딸기 주요 생리장해에 대해 알아 볼까요?" class="swiper-lazy">
						</span>
						</a>
							<dl>
								<dt>12312312312312312312</dt>
								<dd class="date">2월 초순</dd>
							</dl>
					</div>
					<div class="swiper-slide curation_item">
						<a
							href="/portal/ps/psv/psvr/psvre/curationDtl.ps?menuId=PS03352&amp;srchCurationNo=2008">
							<span class="thumB"> <img
								src="https://www.nongsaro.go.kr/portal/imgView.do?ep=a5gb/CMEYLclIUPoWw9/DZpAzn2z8@sWTCNA5pR4wDWSD5iCGUfJREvtQa8gpAZpzd8IF7zcZgm2v4b1eBz/Hg!!"
								alt="딸기 주요 생리장해에 대해 알아 볼까요?" class="swiper-lazy">
						</span>
						</a>
							<dl>
								<dt>2</dt>
								<dd class="date">3월 초순</dd>
							</dl>
					</div>
					<div class="swiper-slide curation_item">
						<a
							href="/portal/ps/psv/psvr/psvre/curationDtl.ps?menuId=PS03352&amp;srchCurationNo=2008">
							<span class="thumB"> <img
								src="https://www.nongsaro.go.kr/portal/imgView.do?ep=a5gb/CMEYLclIUPoWw9/DZpAzn2z8@sWTCNA5pR4wDVVe/ttneoHjYMGdA9aiCeJzd8IF7zcZgm2v4b1eBz/Hg!!"
								alt="딸기 주요 생리장해에 대해 알아 볼까요?" class="swiper-lazy">
						</span>
						</a>
							<dl>
								<dt>32112312312312321</dt>
								<dd class="date">4월 초순</dd>
							</dl>
					</div>
				</div>
			</div>
			<!-- 다음/이전 버튼 -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>

			<!-- 페이지네이션 -->
			<div class="swiper-pagination"></div>
		</div>
	</section>
	<!-- Carousel End -->
	<div class="container-h mt-4">


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
	const swiper = new Swiper('.swiper', {
	    slidesPerView: 1, // 작은 화면에서는 한 슬라이드만 표시
	    breakpoints: {
	        640: {
	            slidesPerView: 2, // 화면 폭이 640px 이상일 때 2개
	            spaceBetween: 20,
	        },
	        1024: {
	            slidesPerView: 2, // 화면 폭이 1024px 이상일 때 3개
	            spaceBetween: 30,
	        },
	        1400: {
	            slidesPerView: 4, // 기본 설정
	            spaceBetween: 50,
	        },
	    },
	    loop: true,
	    autoplay: {
	        delay: 3000,
	        disableOnInteraction: false,
	    },
	    pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	    },
	    navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	    },
	});


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