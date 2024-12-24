<%@ 게시글 상세보기 %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세 페이지</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #4CAF50;
            text-align: center;
        }

        /* 글 정보 */
        .post-info {
            margin-bottom: 15px;
        }

        .post-info div {
            margin: 10px 0;
        }

        .image-container img {
            width: 100%;
            height: auto;
            margin: 10px 0;
            border-radius: 10px;
        }

        /* 댓글 섹션 */
        .comment-section {
            margin-top: 20px;
        }

        .comment {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .reply {
            margin-left: 20px;
            background-color: #f4f4f4;
            border-radius: 5px;
            padding: 8px;
        }

        /* 입력창 */
        .input-container {
            display: flex;
            margin-top: 10px;
        }

        .input-container input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .input-container button {
            margin-left: 5px;
            padding: 8px 12px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .input-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 게시글 정보 -->
    <h1>게시글</h1>
    <div class="post-info">
        <div><strong>제목:</strong> 집에서 토마토 키워 보신분 계신가요?ㅠㅠ</div>
        <div><strong>작성자:</strong> 관리자(admin)</div>
        <div><strong>작성일:</strong> 12/10 11:58:57</div>
    </div>

    <!-- 이미지 -->
    <div class="image-container">
        <img src="https://via.placeholder.com/800x400" alt="토마토 사진">
    </div>

    <!-- 내용 -->
    <div class="post-content">
        <p>과거도 바람도 불어와서 집에서 키워보고 싶었던 코디입니다ㅠ<br>
           토마토를 키워보신 분들 지혜를 나눠주세요!</p>
    </div>

    <!-- 댓글 입력 -->
    <div class="comment-section">
        <h2>댓글</h2>
        <div class="input-container">
            <input type="text" placeholder="댓글을 입력하세요.">
            <button>등록</button>
        </div>

        <!-- 댓글 및 대댓글 표시 영역 -->
        <div id="commentList"></div>
    </div>
</div>

<script>
    // 댓글과 대댓글 자동 생성
    const commentList = document.getElementById("commentList");

    // 댓글 5개, 각 댓글에 대댓글 1개
    for (let i = 1; i <= 5; i++) {
        // 댓글 생성
        const comment = document.createElement("div");
        comment.className = "comment";
        comment.innerHTML = `<strong>test${i}:</strong> 댓글 내용 ${i} 입니다. <span style="font-size: 12px; color: #888;">12/10 12:0${i}</span>`;
        commentList.appendChild(comment);

        // 대댓글 생성
        const reply = document.createElement("div");
        reply.className = "comment reply";
        reply.innerHTML = `<strong>test${i}-reply:</strong> 대댓글 내용 ${i} 입니다. <span style="font-size: 12px; color: #888;">12/10 12:1${i}</span>`;
        commentList.appendChild(reply);
    }
</script>

</body>
</html>
