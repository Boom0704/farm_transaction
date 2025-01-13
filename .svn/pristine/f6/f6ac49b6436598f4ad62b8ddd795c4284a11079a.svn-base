<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>findId</title>
<link rel="stylesheet" href="/css/login.css">
</head>
<body>
	<div class="container">
		<div class="logo-section">
			<img src="/static/assets/img/logo01.png" alt="푸른이음 로고" class="logo">
			<p class="logo-text">
				어쩔 티비 저쩔 티비<br>어쩔 티비 저쩔 티비
			</p>
		</div>
		<div class="form-section">
			<form class="login-form">
				<div id="findDiv">
					<div class="form-group">
						<label for="phoneNumber">핸드폰번호를 입력해주세요</label> 
						<input type="text" id="phoneNumberInput" placeholder="phoneNumber">
					</div>
					<button id="findBtn" type="button" class="sign-in-btn">아이디찾기</button>
				</div>
				<div id="resultDiv" style="display:none;">
					<p>해당 번호로 가입되어있는 아이디는 <br>
					<strong id="result"></strong><br>
					입니다.</p><br>
					<button id="goToLoginBtn" type="button" class="sign-in-btn">로그인하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	/* jshint esversion: 6 */ 
	function findId() {
	    const memPhone = document.getElementById('phoneNumberInput').value;
	    const findDiv = document.getElementById('findDiv')
	    const resultDiv = document.getElementById('resultDiv')
	    const result = document.getElementById('result')
    	
	    fetch('/auth/findIdDo', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json' 
	        },
	        body: JSON.stringify(memPhone)
	    })
	    .then(response => {
	        if (response.ok) {
	            return response.text(); 
	        } else {
	            throw new Error('찾기 실패');
	        }
	    })
	    .then(response => {
	    	console.log(response)
	    	findDiv.style.display = 'none';
	    	result.innerHTML = response;
	    	resultDiv.style.display = 'block';
	    	alert("찾기 성공")
	    })
	    .catch(error => {
	        console.log('찾기 실패', error);
	        alert('전화번호를 확인해주세요');
	    });
	}
	
	/* jshint esversion: 6 */ 
	function goToLogin() {
		const memId = document.getElementById('result').innerHTML;
	    window.location.href = 'loginView?memId=' + encodeURIComponent(memId);
	}
	
	document.getElementById("findBtn").addEventListener('click', findId);
	document.getElementById("phoneNumberInput").addEventListener('keydown', function(event) {
	    if (event.key === 'Enter') {
	    	findId();
	    }
	});
	
	document.getElementById("goToLoginBtn").addEventListener('click', goToLogin)
	
	
</script>

</html>

