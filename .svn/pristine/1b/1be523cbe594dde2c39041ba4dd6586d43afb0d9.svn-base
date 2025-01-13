<!-- 게시글 상세보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${board.boardTitle}</title>
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
        
        /* 좋아요 */
        a{
  		  text-decoration:none; color:inherit; cursor: pointer;
        }
        
        .right_area .icon{
          display: flex;
          align-items: center;
          justify-content: center;
          width: calc(100vw * (45 / 1920));
          height: calc(100vw * (45 / 1920));

          border-radius: 50%;
          border: solid 2px #eaeaea;
          background-color: #fff;
        }

        .icon.heart img{
            width: calc(100vw * (24 / 1920));
            height: calc(100vw * (24 / 1920));
        }

        .icon.heart.fas{
            color:red
        }
        
        .heart{
            transform-origin: center;
        }
        
        .heart.active img{
            animation: animateHeart .3s linear forwards;
        }

        @keyframes animateHeart{
            0%{transform:scale(.2);}
            40%{transform:scale(1.2);}
            100%{transform:scale(1);}
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 게시글 정보 -->
    <h1>${board.boardTitle}</h1>
    <div class="post-info">
    	<!-- 동적으로 데이터 표시 -->
    	<div><strong>글 번 호:</strong> ${board.boardId}</div> 
        <div><strong>제     목:</strong> ${board.boardTitle}</div>     
        <div><strong>작 성 자:</strong> ${board.memId}</div>
        <div><strong>작 성 일:</strong> ${board.createDt}</div>
        <div><strong>수 정 일:</strong> ${board.updateDt}</div>
        <div><strong>조 회 수:</strong> ${board.boardHit}</div>
    </div>

    <!-- 이미지 -->
    <c:if test="${not empty board.filePath}">
        <img src="${board.fileName}" alt="첨부 파일 " style= "max-width: 100%; height: auto;">
    </c:if>

    <!-- 내용 -->
    <div class="post-content">
        <p>${board.boardContents}</p>
    </div>

	<!-- 좋아요 버튼 -->
	<div class="right_area">
  		<a href="javascript:;" class="icon heart">
     	<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="좋아요">
  		</a>
	</div>
	
    <!-- 댓글 입력 -->
    <div class="comment-section">
        <h4>댓글</h4>
        
        <form action="/board/comment" method="post" class="input-container">
        <!-- 게시글 ID 숨겨진 필드로 전송 -->
        <input type="hidden" name="boardId" value="${board.boardId}">
        
        <!-- 댓글 내용 입력 -->
        <input 
            type="text" 
            name="content" 
            id="commentContent" 
            placeholder="댓글을 입력하세요." 
            required
            aria-label="댓글 입력">
        
        <!-- 댓글 등록 버튼 -->
        <button type="submit">등록</button>
    	</form>
	</div>

        <!-- 댓글 및 대댓글 표시 영역 -->
        <div id="commentList">
            <!-- 댓글 목록을 서버에서 동적으로 추가 -->
        </div>
        
        
    </div>
 
<script>
    
    
    
</script>

</body>
</html>
