<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script defer src="/js/home.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/inc/common/header.jsp"></jsp:include>
    <div class="container mt-4">
        <!-- 검색창 -->
        <div class="search-section mb-3">
            <form id="searchForm" action="/" method="get">
                <input type="text" id="search-input" name="query" class="search-input" placeholder="상품을 검색하세요" value="${query}">
                <button type="submit" id="search-button" class="search-button"><i class="fas fa-search"></i></button>
            </form>
        </div>
        
        <!-- 카드 리스트 영역 -->
        <div class="row row-cols-1 row-cols-md-4 g-4" id="product-container">
            <c:forEach var="product" items="${productList}">
                <div class="col card-prod">
                     <div class="card h-100 clickable-card product-card" data-prodid="${product.prodId}">
                        <%-- 추후에 배포했을때 주석 풀기!! <img src="${product.imagePath}" class="card-img-top fixed-image" alt="recommend"> --%>
                        <img src="/assets/img/noimg.png" class="card-img-top fixed-image" alt="recommend">
                        <div class="card-body">
                            <p class="card-title">제목: ${product.prodName}</p>
                            <p class="card-text">가격: ${product.prodPrice}</p>
                            <p class="card-text">주소: ${product.prodPlace}</p>
                            <p class="card-text">${product.createDt}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- 더보기 버튼 -->
        <div class="mt-4 d-flex justify-content-end">
            <button class="btn btn-primary" id="more" data-offset="8">더보기 +</button>
        </div>
    </div>
<jsp:include page="/WEB-INF/inc/common/footer.jsp"></jsp:include>

<!-- 판매 등록 버튼 -->
<button class="fixed-sell-button" onclick="window.location.href='/sell/main'">
    <i class="fas fa-plus">판매등록</i>
</button>

<script>
$(document).ready(function() {
    var query = "${query}";

    // 이벤트 위임: #product-container에 클릭 이벤트 걸고, 자식 중 .clickable-card .card-body가 클릭될 때 처리
    $("#product-container").on("click", ".clickable-card .card-body", function () {
        var prodId = $(this).closest(".clickable-card").data("prodid");
        if (prodId) {
            window.location.href = "/product/detail?prodId=" + prodId;
        }
    });

    $("#more").on("click", function() {
        var $btn = $(this);
        var offset = $btn.data("offset");
        
        $.ajax({
            url: "/more",
            type: "GET",
            data: {
                query: query,
                offset: offset
            },
            dataType: "json",
            success: function(data) {
                if(data && data.length > 0) {
                    $.each(data, function(index, product) {
                        var imgPath = 'assets/img/noimg.png'; // 추후 실제 배포 시 product.imagePath로 변경
                        
                        // 기존 카드 구조와 동일하게 class와 data-sellid 적용
                        var cardHtml = '<div class="col card-prod">' +
                                           '<div class="card h-100 clickable-card product-card" data-prodid="' + product.prodId + '">' +
                                               '<img src="' + imgPath + '" class="card-img-top fixed-image" alt="recommend">' +
                                               '<div class="card-body">' +
                                                   '<p class="card-title">제목: ' + product.prodName + '</p>' +
                                                   '<p class="card-text">가격: ' + product.prodPrice + '</p>' +
                                                   '<p class="card-text">주소: ' + product.prodPlace + '</p>' +
                                                   '<p class="card-text">' + product.createDt + '</p>' +
                                               '</div>' +
                                           '</div>' +
                                       '</div>';
                        $("#product-container").append(cardHtml);
                    });
                    // offset 값 갱신
                    $btn.data("offset", offset + 4);
                } else {
                    // 더 이상 상품이 없다면
                    $btn.prop("disabled", true).text("더 이상 상품이 없습니다");
                }
            }
        });
    });

    
    $(".card-prod").on("click", ".card-body", function () {
        // 상위 카드의 data-sellid 값을 가져옴
        var prodId = $(this).closest(".clickable-card").data("prodid");
        if (prodId) {
            // 페이지 이동
            window.location.href = "/product/detail?prodId=" + prodId;
        }
    });
});
</script>

</body>
</html>