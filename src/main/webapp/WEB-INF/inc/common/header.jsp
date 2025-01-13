<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 6. 
   * 작성자     : 한준희
   * 상세설명  : 화면의 header(navber).jsp
   			  boostrap, custom.css 등 화면의 header 부분과 링크 설정하는 부분
   			   보통 부트스트랩을 먼저 읽게 하고, 커스텀css를 나중에 읽게함 **우선순위는 나중에 읽어온 링크
   * 화면ID  :
   * ================================================================= 
   * 수정일         작성자             내용      
   * ----------------------------------------------------------------------- 
   * ================================================================= 
   */
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS 추가 라인-->
<!-- bootstrap 스타일링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- 기본 스타일 설정, 폰트 설정, 모바일 크기 설정 등 커스텀 스타일 정의해 놓은 곳  -->
<link rel="stylesheet" href="/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- 웹 Header Section -->
<div class="desktop-header d-none d-md-block">
    <div class="header-utility d-flex align-items-center">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/" class="at text-decoration-none" title="푸른이음">
                <span>Everybody is a parmer </span>
            </a>
            <div class="utils">
                <ul class="list-inline mb-0">
                    <c:if test="${empty userInfo}">
                        <li class="list-inline-item me-3">
                            <a href="/auth/loginView" class="text-decoration-none">로그인</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="/auth/signupView" class="text-decoration-none">회원가입</a>
                        </li>
                    </c:if>
                    <c:if test="${not empty userInfo}">
                        <li class="list-inline-item me-3">
                            <a href="/">${userInfo.memNic}님 환영합니다</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="/auth/logout" class="text-decoration-none">로그아웃</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

    <header class="header-main position-relative">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/" class="d-flex align-items-center text-decoration-none">
                <img src="/static/assets/img/parm.png" alt="푸른이음 로고" style="width:102px; height:90px;">
            </a>
            <nav class="nav">
          		<a href="/" class="nav-link">홈</a>
                <ul class="nav d-flex justify-content-around">
                    <li class="nav-item"><a href="#" class="nav-link">스마트 농업 가이드</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">가격 정보</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">커뮤니티</a></li>
                    <li class="nav-item"><a href="/mypage/main" class="nav-link">마이페이지</a></li>
                </ul>
                <div class="header-dropdown-container">
                    <div class="header-dropdown-menu">
                        <div class="menu-column">
                            <a href="/board/list">자유게시판</a>
                            <a href="/crop/list">농업기술 정보방</a>
                            <a href="/diary/list">작물성장일기</a>
                        </div>
                        <div class="menu-column">
                            <a href="/tips">지역별 재배 정보</a>
                            <a href="/tips/status">농작물 상태 확인</a>
                        </div>
                        <div class="menu-column">
                            <a href="/market/priceMain">시세 및 예측</a>
                        </div>
                        <div class="menu-column">
                            <a href="/mypage/change">내 정보 수정</a>
                            <a href="/mypage/chat">채팅 목록</a>
                            <a href="/mypage/trade">거래 목록</a>
                            <a href="/mypage/review">후기 목록</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</div>

<!-- Mobile Header Section -->
<div class="mobile-header d-md-none">
    <header class="d-flex align-items-center justify-content-between px-3 py-2">
        <div>
            <c:if test="${empty userInfo}">
                <a href="/auth/loginView" class="text-color text-decoration-none">로그인</a>
            </c:if>

			<c:if test="${not empty userInfo}">
				<span class="text-color">${userInfo.memNic}님</span>
				<button class="btn btn-link p-0 text-color" data-id="${userInfo.memId}" id="subscribeBtn">
				    <i class="fas fa-bell" style="font-size: 1.5rem;"></i>
				</button>
				<input type="hidden" value="${vapidPublicKey}" id="key">
			</c:if>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu">
            <i class="fas fa-bars text-color"></i>
        </button>
    </header>
    <div class="offcanvas offcanvas-end offcanvas-custom" id="offcanvasMenu">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title">메뉴</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="navbar-nav">
	            <!-- 모바일 전용 메뉴 -->
	            <c:if test="${empty userInfo}">
				    <li class="nav-item">
				        <a class="nav-link i01 text-decoration-none" href="/auth/loginView">
				            <img src="/static/assets/img/login.png" alt="" style="width:20px; height:20px; "> 로그인
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link i02 text-decoration-none" href="/auth/signupView" title="회원가입">
				            <img src="/static/assets/img/sign.png" alt="" style="width:20px; height:20px;  margin-left:2px;"> 회원가입
				        </a>
				    </li>
				</c:if>
				<c:if test="${not empty userInfo}">
				    <li class="nav-item">
				        <a class="nav-link i01 text-decoration-none" href="/">
				            <i class="fas fa-user"></i> ${userInfo.memNic}님 환영합니다
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link i02 text-decoration-none" href="/auth/logout">
				            <img src="/static/assets/img/logout.png" alt="" style="width:20px; height:20px;"> 로그아웃
				        </a>
				    </li>
				</c:if>
	            <li class="nav-item">
	                <a class="nav-link" href="/"><img src="/static/assets/img/Home.png" alt="" style="width:20px; height:20px; margin-left:1px">   홈</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/mypage/main">
	                	<img src="/static/assets/img/mypage.png" alt="" style="width:21px; height:19px;">  마이페이지
	                </a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/mypage/chat">
						<img src="/static/assets/img/chatlist.png" alt="" style="width:20px; height:20px;">  채팅리스트
					</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/mypage/trade"> 
	                	<img src="/static/assets/img/trade.png" alt="" style="width:20px; height:20px;">  거래목록
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/market/current">
	                	<img src="/static/assets/img/predict.png" alt="" style="width:20px; height:20px;">  현재시세
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/crop/list">
	                	<img src="/static/assets/img/predict.png" alt="" style="width:20px; height:20px;">  예측시세
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/board/list">
	                	<img src="/static/assets/img/free.png" alt="" style="width:20px; height:20px;">  자유게시판
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/tips/status">
	                	<img src="/static/assets/img/check.png" alt="" style="width:20px; height:20px;">  농작물 상태 확인
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/tips">
	                	<img src="/static/assets/img/knowledge.png" alt="" style="width:20px; height:20px;">  지역별 재배 정보
                	</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/diary/list">
	                	<img src="/static/assets/img/diary.png" alt="" style="width:20px; height:20px;">  작물성장일기
	                </a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/crop/list">
	                	<img src="/static/assets/img/community.png" alt="" style="width:20px; height:20px;">  농업기술 정보방
                	</a>
	            </li>
	            
	        </ul>
	    </div>
	</div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', function () {
		
		let token = getCookie("accessToken");
		
		if(token) {
			let decoded = parseJwt(token);
	        console.log(decoded); 

	        let memId = decoded.sub; 
	        console.log('memId:', memId);
	    } else {
			let memId = null;
	    }
		
		function getCookie(name) {
		    const value = document.cookie;
		    const parts = value.split(`${name}=`);
		    if (parts.length === 2) return parts.pop().split(';')[0];
		    return null;
		}
		
		function parseJwt(token) {
		    const base64Url = token.split('.')[1]; 
		    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');  
		    const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
		        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		    }).join(''));
		    return JSON.parse(jsonPayload);  // JSON 형태로 변환
		}

		
		
	});
</script>
    