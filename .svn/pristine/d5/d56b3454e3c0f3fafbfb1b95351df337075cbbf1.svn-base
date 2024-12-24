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
            font-size: 36px;
            font-weight: bold;
            margin: 0;
        }

        .sub-header {
            font-size: 16px;
            color: #eee;
            margin-top: 10px;
        }

        /* 카테고리 셀렉트 박스 스타일 */
        .category-select {
            margin: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .category-select label {
            font-size: 18px;
            color: #4CAF50;
            font-weight:bolder;
        }

        .category-select select {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 20%;
            background-color: #f1f1f1;
        }

        .post {
            display: flex;
            flex-direction: row;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
        }

        .post-content {
            flex: 2;
            margin-right: 20px;
        }

        .post-header {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .post-meta {
            font-size: 14px;
            color: #888;
            margin-bottom: 10px;
        }

        .post-meta span {
            margin-right: 10px;
        }

        .post-body {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .post-image {
            flex: 1;
            max-width: 300px;
            margin-left: 20px;
            border-radius: 10px;
            object-fit: cover;
        }

        /* 반응형 디자인 */
        @media screen and (max-width: 768px) {
            .post {
                flex-direction: column;
                align-items: center;
            }

            .post-image {
                margin-left: 0;
                margin-top: 10px;
                width: 100%;
            }

            .post-content {
                margin-right: 0;
            }

            .category-select select {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

<div class="wrapper">
    <div class="header">
        <h1>농사 팁 공유</h1>
        <div class="sub-header">농사 재배와 관련된 유용한 팁을 공유하세요!</div>
    </div>

    <!-- 카테고리 셀렉트 박스 -->
    <div class="category-select">
        <label for="category">카테고리:</label>
        <select id="category" name="category">
            <option value="고추">고추</option>
            <option value="배추">배추</option>
            <option value="양파">양파</option>
            <option value="무">무</option>
            <option value="마늘">마늘</option>
        </select>
    </div>

    <div class="post">
        <div class="post-content">
            <div class="post-header">고추 재배 팁: 병충해 예방하기</div>
            <div class="post-meta">
                <span>2024. 11. 30.</span>
                <span>댓글 6</span>
            </div>
            <div class="post-body">
                고추를 재배할 때 가장 중요한 점은 병충해 예방입니다. 특히, 고추는 여름철에 병에 취약하므로 철저한 관리가 필요합니다. 예를 들어, 배수 좋은 토양을 준비하고, 과잉 물빠짐을 방지하기 위해 멀칭을 적용하세요. 또한, 병에 강한 품종을 선택하는 것도 중요한 요소입니다.
            </div>
        </div>
        <img src="https://via.placeholder.com/300" alt="고추 재배 이미지" class="post-image">
    </div>

    <div class="post">
        <div class="post-content">
            <div class="post-header">배추 재배 팁: 토양 관리의 중요성</div>
            <div class="post-meta">
                <span>2024. 11. 28.</span>
                <span>댓글 8</span>
            </div>
            <div class="post-body">
                배추는 토양의 pH가 6~7 사이일 때 가장 잘 자랍니다. 따라서 토양의 산도 조절을 위해 필요한 경우 석회질 비료를 추가해야 합니다. 배추의 성장에 필요한 양분을 충분히 공급하려면 유기질 비료와 함께 화학 비료를 적절히 혼합하여 사용해야 합니다.
            </div>
        </div>
        <img src="https://via.placeholder.com/300" alt="배추 재배 이미지" class="post-image">
    </div>
    <div class="post">
        <div class="post-content">
            <div class="post-header">배추 재배 팁: 토양 관리의 중요성</div>
            <div class="post-meta">
                <span>2024. 11. 28.</span>
                <span>댓글 8</span>
            </div>
            <div class="post-body">
                배추는 토양의 pH가 6~7 사이일 때 가장 잘 자랍니다. 따라서 토양의 산도 조절을 위해 필요한 경우 석회질 비료를 추가해야 합니다. 배추의 성장에 필요한 양분을 충분히 공급하려면 유기질 비료와 함께 화학 비료를 적절히 혼합하여 사용해야 합니다.
            </div>
        </div>
    </div>
</div>

</body>
</html>
