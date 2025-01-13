<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농사 팁 게시판</title>

<!-- Summernote CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"
	rel="stylesheet">
<!-- 다이어리 작성 CSS 파일 링크 추가 -->
<link rel="stylesheet" href="/css/diary_create.css">
<style>

</style>

<!-- Summernote JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>

	<div class="wrapper">
		<!-- 상단 제목과 설명 -->
		<div class="header">
			<h1>농사 팁 공유</h1>
			<div class="sub-header">농사 재배와 관련된 유용한 팁을 공유하세요!</div>
		</div>

		<!-- 게시글 작성 영역 -->
		<div class="content">
			<h2>게시글 작성</h2>

			<!-- 제목 입력란 추가 -->
			<div class="input-container">
				<label for="postTitle">제목</label> <input type="text" id="postTitle"
					placeholder="게시글 제목을 입력하세요" />
			</div>

			<!-- Summernote 에디터 -->
			<textarea id="summernote"></textarea>
			<!-- 글 작성 버튼 -->
			<button class="cancel-button" onclick="savePost()">취소</button>
			<!-- 글 작성 버튼 -->
			<button class="write-button" onclick="savePost()">글 작성하기</button>
		</div>
	</div>

<script>
    // 전역 변수로 선언
    var lastUploadedImageUrl = '';  // 마지막으로 업로드된 이미지 URL을 저장할 변수

    $(document).ready(function() {
        // Summernote 초기화
        $('#summernote').summernote({
            height: 500, // 에디터 높이
            placeholder: '여기에 글을 작성해주세요...',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['link', 'picture']] // 이미지 삽입 기능
            ],
            callbacks: {
                // 이미지 업로드 후 서버로 전송
                onImageUpload: function(files) {
                    var formData = new FormData();
                    
                    // 첫 번째 파일만 처리
                    var file = files[0];
                    formData.append("file", file);  // "file"은 서버에서 받을 파라미터 이름

                    // 헤더에 파일 이름 추가
                    var fileName = file.name;
                    var headers = {
                        "file-name": fileName  // 서버가 사용할 file-name 헤더
                    };

                    // 서버에 이미지 업로드 요청
                    $.ajax({
                        url: '/files/upload', // 서버 이미지 업로드 처리 URL
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        headers: headers,  // 헤더 추가
                        success: function(response) {
                            // 서버에서 반환된 이미지 경로(imgPath)를 받아서 Summernote에 삽입
                            var imgUrl = response.imagePath;

                            // 서버에서 반환된 이미지를 <img> 태그로 변환하여 삽입
                            if (imgUrl) {
                                var imgTag = '<img src="' + imgUrl + '" alt="Uploaded Image" />';

                                // Summernote에 이미지를 삽입
                                $('#summernote').summernote('insertNode', $(imgTag)[0]);

                                // 마지막으로 업로드된 이미지 URL을 저장
                                lastUploadedImageUrl = imgUrl;
                            }
                        },
                        error: function(xhr, status, error) {
                            console.log('이미지 업로드 실패:', error);
                        }
                    });
                }
            }
        });
    });

    // 글 작성 후 저장하는 함수
function savePost() {
    // 제목과 내용을 가져오기
    var title = $('#postTitle').val();
    var content = $('#summernote').val();

    console.log('제목:', title);
    console.log('작성된 글:', content);
    console.log('마지막 업로드된 이미지 URL:', lastUploadedImageUrl);  // 마지막 업로드된 이미지 URL 출력

    // 마지막 업로드된 이미지 URL을 DIARY_IMAGE 필드에 추가하여 전송
    var postData = {
        title: title,
        content: content,
        diaryImage: lastUploadedImageUrl,  // 마지막 업로드된 이미지 URL을 추가
        memId: 'zzxx147'  // 예시로 회원 ID 설정 (필요한 경우 로그인 시스템으로 바꿀 수 있음)
    };

    // 서버로 데이터 전송
    $.ajax({
        url: '/diary/write',  // 게시글 작성 처리 URL
        type: 'POST',
        data: postData,
        success: function(response) {
            console.log('게시글 저장 성공:', response);
            // 게시글 작성 후 리다이렉트 혹은 페이지 이동 (예: 게시글 상세 페이지)
            window.location.href = '/diary/detail/' + response.diaryId;
        },
        error: function(error) {
            console.log('게시글 저장 실패:', error);
        }
    });
}
</script>



</body>
</html>

