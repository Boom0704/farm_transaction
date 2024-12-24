<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농사 재배 팁 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .wrapper {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
        }

        .header {
            padding: 20px 0;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            border-radius: 10px;
        }

        .header h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
        }

        .sub-header {
            font-size: 16px;
            color: #eee;
            margin-top: 10px;
        }

        /* 게시글 정보 */
        .post-info {
            display: flex;
            justify-content: space-between;
            background: #fff;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .post-info div {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .post-info strong {
            color: #4CAF50;
        }

        .post-info .meta {
            font-size: 14px;
            color: #888;
        }

        /* 게시글 내용 */
        .post-content {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .post-content p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .post-content img {
            width: 100%;
            height: auto;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 댓글 입력 */
        .comment-section {
            margin-top: 40px;
        }

        .comment-section h2 {
            font-size: 22px;
            color: #333;
        }

        .input-container {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .input-container input {
            flex: 1;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .input-container button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .input-container button:hover {
            background-color: #45a049;
        }

        /* 댓글 및 대댓글 표시 영역 */
        #commentList {
            margin-top: 20px;
            padding: 0;
        }

        .comment {
            background: #f1f1f1;
            padding: 10px;
            margin-top: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .comment .author {
            font-weight: bold;
            color: #4CAF50;
        }

        .comment .content {
            margin-top: 5px;
        }

        /* 반응형 디자인 */
        @media screen and (max-width: 768px) {
            .input-container {
                flex-direction: column;
            }

            .input-container input,
            .input-container button {
                width: 100%;
            }

            .post-info {
                flex-direction: column;
                align-items: center;
            }

            .post-content img {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="wrapper">
    <!-- 상단 제목과 설명 -->
    <div class="header">
        <h1>농사 팁 공유</h1>
        <div class="sub-header">농사 재배와 관련된 유용한 팁을 공유하세요!</div>
    </div>

    <!-- 게시글 정보 -->
    <div class="post-info">
        <div><strong>제목:</strong> 집에서 토마토 키워 보신분 계신가요?ㅠㅠ</div>
        <div><strong>작성자:</strong> 관리자(admin)</div>
        <div><strong>작성일:</strong> 12/10 11:58:57</div>
        <div class="meta">
            <span>조회 1733</span> | <span>추천 14</span> | <span>댓글 68</span>
        </div>
    </div>

    <!-- 게시글 내용 -->
    <div class="post-content">
        <p>과거도 바람도 불어와서 집에서 키워보고 싶었던 코디입니다ㅠ<br>
           토마토를 키워보신 분들 지혜를 나눠주세요!</p>
        
        <!-- 이미지 포함 -->
        <img src="https://via.placeholder.com/800x400" alt="토마토 사진">
    </div>

    <!-- 댓글 입력 및 댓글 표시 -->
    <div class="comment-section">
        <h2>댓글</h2>
        <div class="input-container">
            <input type="text" placeholder="댓글을 입력하세요.">
            <button>등록</button>
        </div>

        <!-- 댓글 및 대댓글 표시 영역 -->
        <div id="commentList">
            <!-- 댓글 예시 -->
            <div class="comment">
                <div class="author">사용자1</div>
                <div class="content">저도 집에서 키워봤는데, 토마토는 배수가 중요해요!</div>
            </div>
            <div class="comment">
                <div class="author">사용자2</div>
                <div class="content">햇빛을 많이 받는 곳에 놓으면 좋아요. 꼭 성공하시길!</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

