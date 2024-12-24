<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign up</title>
	<link rel="stylesheet" href="/css/login.css">
</head>
<body>
    <div class="container">
        <div class="logo-section">
            <img src="/static/assets/img/logo01.png" alt="푸른이음 로고" class="logo">
            <p class="logo-text">어쩔 티비 저쩔 티비<br>어쩔 티비 저쩔 티비</p>
        </div>
        <div class="form-section">
            <form class="login-form">
                <h2>회원가입</h2>
                <div class="form-group">
                    <label for="mem_id">아이디</label>
                    <input type="text" id="mem_id" name="mem_id" placeholder="아이디를 입력하세요" required>
                </div>
                <div class="form-group">
                    <label for="mem_pass">비밀번호</label>
                    <input type="password" id="mem_pass" name="mem_pass" placeholder="비밀번호를 입력하세요" required>
                </div>
                <div class="form-group">
                    <label for="mem_name">이름</label>
                    <input type="text" id="mem_name" name="mem_name" placeholder="이름을 입력하세요" required>
                </div>
                <div class="form-group">
                    <label for="mem_phone">전화번호</label>
                    <input type="text" id="mem_phone" name="mem_phone" placeholder="전화번호를 입력하세요">
                </div>
                <div class="form-group">
                    <label for="mem_nic">닉네임</label>
                    <input type="text" id="mem_nic" name="mem_nic" placeholder="닉네임을 입력하세요">
                </div>
				<div class="form-group">
				    <label for="mem_addr">주소</label>
				    <!-- 주소 표시 영역 -->
				    <div id="address-container">
				        <span id="address-value">임시값 임시값 임시값</span>
				        <button type="button" id="delete-address" onclick="deleteAddress()">X</button>
				    </div>
				    <!-- 주소 찾기 버튼 -->
				    <button type="button" id="find-address" onclick="findAddress()">주소 찾기</button>
				</div>
                <button type="submit" class="sign-in-btn">가입하기</button>
            </form>
        </div>
    </div>
    
    <script>
	    function findAddress() {
	        // 주소 찾기 창 호출 (여기서는 임시값 설정으로 대체)
	        const addressValue = "서울특별시 강남구 임시값";
	        document.getElementById("address-value").textContent = addressValue;
	        document.getElementById("address-container").style.display = "block"; // 주소 영역 보이기
	    }
	
	    function deleteAddress() {
	        // 주소 삭제
	        document.getElementById("address-value").textContent = "";
	        document.getElementById("address-container").style.display = "none"; // 주소 영역 숨기기
	    }
	
	    // 초기 상태에서 주소 표시 영역 숨기기
	    document.addEventListener("DOMContentLoaded", () => {
	        document.getElementById("address-container").style.display = "none";
	    });
	</script>
    
</body>
</html>

