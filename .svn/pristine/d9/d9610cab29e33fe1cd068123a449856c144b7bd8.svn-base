<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 판매내역</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        /* 컨테이너 */
        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background-color: white;
            padding: 10px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 상단 메뉴 */
        .menu {
            display: flex;
            justify-content: space-around;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .menu div {
            padding: 10px;
            cursor: pointer;
            font-weight: bold;
            color: #4CAF50;
            border-bottom: 3px solid transparent;
            transition: border-bottom 0.3s, color 0.3s;
        }

        .menu div.active {
            color: #333;
            border-bottom: 3px solid #4CAF50;
        }

        /* 리스트 아이템 */
        .item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .item img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 15px;
        }

        .item-content {
            flex: 1;
        }

        .item-content h3 {
            margin: 0;
            font-size: 16px;
        }

        .item-content p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }

        .item-content .price {
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }

        .item-buttons {
            display: flex;
            gap: 10px;
        }

        .item-buttons button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .item-buttons button:hover {
            background-color: #45a049;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .item {
                flex-direction: column;
                align-items: flex-start;
            }

            .item img {
                width: 100%;
                height: auto;
                margin-right: 0;
                margin-bottom: 10px;
            }

            .item-buttons {
                flex-direction: column;
                width: 100%;
            }

            .item-buttons button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 상단 메뉴 -->
    <div class="menu">
        <div class="active" id="sellingTab">판매중</div>
        <div id="progressTab">진행중</div>
        <div id="soldTab">거래완료</div>
    </div>

    <!-- 판매중 리스트 -->
    <div id="sellingList">
        <div class="item">
            <img src="https://via.placeholder.com/120" alt="외발자전거">
            <div class="item-content">
                <h3>외발자전거</h3>
                <p>범동 · 끌올 1시간 전 · 끌올 1회</p>
                <div class="price">30,000원</div>
            </div>
            <div class="item-buttons">
                <button>끌어올리기</button>
            </div>
        </div>
    </div>

    <!-- 진행중 리스트 -->
    <div id="progressList" style="display: none;">
        <div class="item">
            <img src="https://via.placeholder.com/120" alt="프린터기">
            <div class="item-content">
                <h3>레이저 프린터기 3만원</h3>
                <p>서구 둔산1동 · 끌올 1시간 전 · 끌올 1회</p>
                <div class="price">30,000원</div>
            </div>
            <div class="item-buttons">
                <button>끌어올리기</button>
            </div>
        </div>
    </div>

    <!-- 거래완료 리스트 -->
    <div id="soldList" style="display: none;">
        <div class="item">
            <img src="https://via.placeholder.com/120" alt="LG TV">
            <div class="item-content">
                <h3>LG 티비 판매합니다</h3>
                <p>범1동 · 끌올 1시간 전 · 끌올 3회</p>
                <div class="price">100,000원</div>
            </div>
        </div>
    </div>
</div>

<script>
    // 탭 전환 기능
    const sellingTab = document.getElementById("sellingTab");
    const progressTab = document.getElementById("progressTab");
    const soldTab = document.getElementById("soldTab");

    const sellingList = document.getElementById("sellingList");
    const progressList = document.getElementById("progressList");
    const soldList = document.getElementById("soldList");

    sellingTab.addEventListener("click", () => showTab("selling"));
    progressTab.addEventListener("click", () => showTab("progress"));
    soldTab.addEventListener("click", () => showTab("sold"));

    function showTab(tab) {
        // 탭 초기화
        sellingTab.classList.remove("active");
        progressTab.classList.remove("active");
        soldTab.classList.remove("active");

        sellingList.style.display = "none";
        progressList.style.display = "none";
        soldList.style.display = "none";

        // 선택된 탭 활성화
        if (tab === "selling") {
            sellingTab.classList.add("active");
            sellingList.style.display = "block";
        } else if (tab === "progress") {
            progressTab.classList.add("active");
            progressList.style.display = "block";
        } else if (tab === "sold") {
            soldTab.classList.add("active");
            soldList.style.display = "block";
        }
    }
</script>

</body>
</html>
