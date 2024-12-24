<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작물 성장 일기 게시판</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 제목 */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 24px;
            color: #4CAF50;
        }

        .header select, .header button, .header input {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .header button {
            background-color: #3366FF;
            color: white;
            border: none;
            cursor: pointer;
        }

        .header button:hover {
            background-color: #2558c2;
        }

        /* 게시판 그리드 */
        .post-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .post-item {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s;
        }

        .post-item:hover {
            transform: scale(1.02);
        }

        .post-item img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .post-item .content {
            padding: 10px;
        }

        .post-item h3 {
            font-size: 16px;
            margin: 10px 0;
            color: #333;
        }

        .post-item p {
            font-size: 12px;
            color: #777;
        }

        /* 비밀글 자물쇠 표시 */
        .lock-icon {
            font-size: 20px;
            color: #f44336;
        }

        /* 더보기와 글쓰기 버튼 */
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .buttons button {
            padding: 10px 15px;
            font-size: 14px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .buttons .more {
            background-color: #4CAF50;
        }

        .buttons .write {
            background-color: #FF9800;
        }

        .buttons button:hover {
            opacity: 0.9;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
            }

            .header input, .header select, .header button {
                width: 100%;
                margin-bottom: 10px;
            }

            .buttons {
                flex-direction: column;
                gap: 10px;
            }

            .buttons button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 상단 제목과 검색/정렬 -->
    <div class="header">
        <h1>작물 성장 일기 게시판</h1>
        <div>
            <select>
                <option>최신순</option>
                <option>오래된순</option>
            </select>
            <input type="text" placeholder="검색어를 입력하세요" />
            <button>검색</button>
        </div>
    </div>

    <!-- 게시판 그리드 -->
    <div class="post-grid">
        <div class="post-item">
            <img src="https://via.placeholder.com/150" alt="작물 이미지">
            <div class="content">
                <h3>주렁주렁 열렸네요</h3>
                <p>민들기 · 2024.10.14</p>
            </div>
        </div>

        <div class="post-item">
            <img src="https://via.placeholder.com/150" alt="작물 이미지">
            <div class="content">
                <h3>저희집 파 어때요?</h3>
                <p>파릇지킴러 · 2024.10.02</p>
            </div>
        </div>

        <div class="post-item">
            <img src="https://via.placeholder.com/150" alt="작물 이미지">
            <div class="content">
                <h3>2024 작물 일기 <span class="lock-icon">🔒</span></h3>
                <p>농부아빠 · 2023.04.18</p>
            </div>
        </div>

        <!-- 추가 게시물 -->
        <div class="post-item">
            <img src="https://via.placeholder.com/150" alt="작물 이미지">
            <div class="content">
                <h3>날 좋아하니 당근!</h3>
                <p>당근굴쟁이 · 2024.03.29</p>
            </div>
        </div>
        <div class="post-item">
            <img src="https://via.placeholder.com/150" alt="작물 이미지">
            <div class="content">
                <h3>봄동 많이 자랐습니다</h3>
                <p>배추도사무도사 · 2024.03.03</p>
            </div>
        </div>
    </div>

    <!-- 더보기 및 글쓰기 버튼 -->
    <div class="buttons">
        <button class="more">더보기</button>
        <button class="write">글쓰기</button>
    </div>
</div>

</body>
</html>
