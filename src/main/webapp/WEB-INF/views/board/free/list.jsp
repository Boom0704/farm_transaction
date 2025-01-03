<%@ 게시글 목록 %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 리스트</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        /* 검색 영역 */
        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
        }

        .search-container input,
        .search-container button {
            padding: 8px;
            margin: 5px;
            border: none;
            border-radius: 5px;
        }

        .search-container input {
            flex: 1;
            max-width: 300px;
        }

        .search-container button {
            background-color: white;
            color: #4CAF50;
            cursor: pointer;
            font-weight: bold;
        }

        .search-container button:hover {
            background-color: #ddd;
        }

        /* 테이블 영역 */
        .board-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .board-table th, .board-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .board-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .board-table td:nth-child(2) {
            text-align: left;
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .pagination button:hover {
            background-color: #45a049;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .board-table, .board-table th, .board-table td {
                font-size: 12px;
            }

            .search-container {
                flex-direction: column;
            }

            .search-container input {
                width: 100%;
                margin-bottom: 5px;
            }
        }

        @media (max-width: 480px) {
            .board-table, .board-table th, .board-table td {
                font-size: 10px;
                padding: 5px;
            }
        }
    </style>
</head>
<body>

<!-- 검색 영역 -->
<div class="search-container">
    <input type="text" placeholder="제목">
    <input type="text" placeholder="-- 전체 --">
    <button>검색</button>
</div>

<!-- 게시판 테이블 -->
<table class="board-table">
    <thead>
        <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody id="boardContent"></tbody>
</table>

<!-- 페이지네이션 -->
<div class="pagination">
    <button>1</button>
    <button>2</button>
    <button>3</button>
</div>

<script>
    // 글 목록 자동 생성
    const boardContent = document.getElementById('boardContent');
    for (let i = 20; i >= 1; i--) {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${i}</td>
            <td>테스트 제목 ${i}</td>
            <td>test${i % 3}</td>
            <td>12/10 12:30:${i < 10 ? '0' + i : i}</td>
            <td>${Math.floor(Math.random() * 100)}</td>
        `;
        boardContent.appendChild(row);
    }
</script>

</body>
</html>

