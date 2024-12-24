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
<!-- 헤더 (네비게이션 바) -->
<header class="navbar navbar-expand-lg navbar-light fixed-top nav-custom">
    <a class="navbar-brand" href="/">
        <img src="/static/assets/img/logo01.png" alt="푸른이음 로고" style="width:40px; height:40px;">
        푸른이음
    </a>
    <!-- 토글 버튼 -->
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- 웹 전용 메뉴 -->
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/"><i class="fas fa-home"></i>홈</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/signin">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/">게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/">재배팁</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/signup"><i class="fas fa-user-plus"></i></a>
            </li>
        </ul>
    </div>
</header>

<!-- 모바일 전용 Offcanvas -->
<div class="offcanvas offcanvas-end offcanvas-custom" id="offcanvasMenu" tabindex="-1" aria-labelledby="offcanvasMenuLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasMenuLabel">민호</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="navbar-nav">
            <!-- 모바일 전용 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="/"><i class="fas fa-mobile-alt"></i>홈</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/mobile-signin"><i class="fas fa-sign-in-alt"></i> 모바일 추가</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/mobile-signup"><i class="fas fa-user-plus"></i> 모바일 추가</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/settings"><i class="fas fa-cog"></i> 추가</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/help"><i class="fas fa-info-circle"></i>아이콘 다른거 원할시 추가</a>
            </li>
        </ul>
    </div>
</div>
    