<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>블록 관리</title>
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
            font-size: 24px;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        /* 제목 입력 */
        .title-input {
            display: flex;
            margin-bottom: 20px;
        }

        .title-input label {
            font-size: 18px;
            margin-right: 10px;
        }

        .title-input input {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* 블록 스타일 */
        .block {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 0;
            margin-bottom: 10px;
        }

        .block textarea {
            flex: 1;
            margin: 0 10px;
            padding: 10px;
            width: auto;
            height: 300px;
            font-size: 14px;
            resize: vertical;
            border: none;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .block img, .image-upload {
            width: 50%;
            height: auto;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
        }

        /* 그림 블록 */
        .image-block {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .image-block img {
            width: 50%;
            height: auto;
            border-radius: 8px;
        }

        /* 추가 블록 */
        .add-block {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .add-block select, .add-block button {
            padding: 12px 16px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-block select {
            background-color: #f4f4f9;
            border: 1px solid #ccc;
            flex: 1;
        }

        .add-block button {
            background-color: #4CAF50;
            color: white;
            flex: 1;
        }

        .add-block button:hover {
            background-color: #45a049;
        }

        /* 제출 및 취소 버튼 */
        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .actions button {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }

        .submit-btn {
            background-color: #4CAF50;
        }

        .cancel-btn {
            background-color: #f44336;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .block {
                flex-direction: column;
            }

            .block img, .image-upload, .image-block img {
                width: 100%;
            }

            .add-block {
                flex-direction: column;
            }

            .add-block select, .add-block button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 제목 입력 -->
    <div class="title-input">
        <label for="title">제목:</label>
        <input type="text" id="title" placeholder="제목을 입력하세요">
    </div>

    <!-- 블록 보관함 -->
    <div id="blockContainer"></div>

    <!-- 블록 추가 -->
    <div class="add-block">
        <select id="blockType">
            <option value="right">우블록</option>
            <option value="left">좌블록</option>
            <option value="image">그림블록</option>
            <option value="text">글블록</option>
        </select>
        <button onclick="addBlock()">블록 추가</button>
    </div>

    <!-- 제출 및 취소 -->
    <div class="actions">
        <button class="submit-btn" onclick="submitForm()">제출</button>
        <button class="cancel-btn" onclick="resetForm()">취소</button>
    </div>
</div>

<script>
    const blockContainer = document.getElementById('blockContainer');

    // 블록 추가 함수
    function addBlock() {
        const blockType = document.getElementById('blockType').value;
        const block = document.createElement('div');

        if (blockType === 'right') {
            block.className = 'block';
            block.innerHTML = `
                <textarea placeholder="내용을 입력하세요"></textarea>
                <img src="https://via.placeholder.com/150" onclick="selectImage(this)">
            `;
        } else if (blockType === 'left') {
            block.className = 'block';
            block.innerHTML = `
                <img src="https://via.placeholder.com/150" onclick="selectImage(this)">
                <textarea placeholder="내용을 입력하세요"></textarea>
            `;
        } else if (blockType === 'image') {
            block.className = 'image-block';
            block.innerHTML = `
                <img src="https://via.placeholder.com/300" onclick="selectImage(this)">
            `;
        } else if (blockType === 'text') {
            block.className = 'block';
            block.innerHTML = `
                <textarea placeholder="내용을 입력하세요" rows="5"></textarea>
            `;
        }

        blockContainer.appendChild(block);
    }

    // 이미지 선택 함수
    function selectImage(img) {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.style.display = 'none';

        input.addEventListener('change', (e) => {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (event) {
                    img.src = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        input.click();
    }

    // 폼 제출 및 초기화
    function submitForm() {
        alert("제출되었습니다!");
    }

    function resetForm() {
        document.getElementById('title').value = '';
        blockContainer.innerHTML = '';
    }
</script>

</body>
</html>
 