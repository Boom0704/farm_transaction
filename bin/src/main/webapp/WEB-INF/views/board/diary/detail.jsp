<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상세 게시글</title>
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
                max-width: 1000px;
                margin: 20px auto;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                font-size: 28px;
                color: #4CAF50;
                margin-bottom: 20px;
            }
        

            /* 게시글 정보 스타일 */
            .post-info {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 10px 0;
                    border-bottom: 1px solid #ddd;
                    margin-bottom: 20px;
                    font-size: 14px;
                    color: #666;
                }

                .post-info div {
                    margin: 0 10px;
                }

            .block {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .block img {
                width: 50%;
                height: auto;
                border-radius: 8px;
                object-fit: cover;
            }

            .block textarea, .text-block {
                width: 100%;
                padding: 15px;
                font-size: 16px;
                line-height: 1.6;
                border: none;
                background-color: #f9f9f9;
                border-radius: 8px;
                resize: none;
            }

            /* 좌블록 */
            .left-block img {
                margin-right: 15px;
            }

            /* 우블록 */
            .right-block img {
                margin-left: 15px;
            }

            /* 그림 블록 */
            .image-block {
                text-align: center;
                margin: 20px 0;
            }

            .image-block img {
                width: 80%;
                max-width: 600px;
                border-radius: 8px;
            }

            /* 반응형 */
            @media (max-width: 768px) {
                .block {
                    flex-direction: column;
                    text-align: center;
                }

                .block img {
                    width: 100%;
                    margin: 0 0 10px 0;
                }
            }
        </style>
    </head>
    <body>

<div class="container">
    <!-- 게시글 제목 -->
    <h1>${diary.diaryTitle}</h1>

    <!-- 게시글 정보 -->
    <div class="post-info">
        <div><strong>제목:</strong> ${diary.diaryTitle}</div>
        <div><strong>작성자:</strong> ${diary.diaryWriter}</div>
        <div><strong>작성일:</strong> ${diary.createDt}</div>
    </div>

    <!-- 게시글 내용 -->
    <div class="block left-block">
        <div class="text-block">
            ${diary.diaryContents}
        </div>
    </div>

    <!-- 이미지 -->
    <div class="image-block">
        <img src="${diary.diaryImage}" alt="Diary Image">
    </div>

    <!-- 좋아요 카운트 -->
    <div><strong>좋아요:</strong> ${diary.likeCount}</div>

    <!-- 수정하기 버튼 -->
    <a href="/diary/edit/${diary.diaryId}" class="edit-button">수정하기</a>
</div>

</body>
</html>