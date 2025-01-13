<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농사 팁 게시판</title>

    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/diary_create.css">
    <style>
        /* 여기에 스타일 추가 */
    </style>

    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="header">
        <h1>농사 팁 공유</h1>
        <div class="sub-header">농사 재배와 관련된 유용한 팁을 공유하세요!</div>
    </div>

    <div class="content">
        <h2>게시글 수정</h2>

        <!-- 제목 입력란 추가 -->
        <div class="input-container">
            <label for="postTitle">제목</label>
            <input type="text" id="postTitle" value="${diary.diaryTitle}" placeholder="게시글 제목을 입력하세요" />
        </div>

        <!-- Summernote 에디터 -->
        <textarea id="summernote">${diary.diaryContents}</textarea>

        <!-- 글 작성 버튼 -->
        <button class="cancel-button" onclick="cancelEdit()">취소</button>
        <button class="write-button" onclick="savePost()">수정 완료</button>
    </div>
</div>

<script>
    var lastUploadedImageUrl = ''; // 마지막 업로드된 이미지 URL을 저장할 변수

    $(document).ready(function() {
        // Summernote 초기화
        $('#summernote').summernote({
            height: 500,
            placeholder: '여기에 글을 작성해주세요...',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['link', 'picture']] // 이미지 삽입 기능
            ],
            callbacks: {
                onImageUpload: function(files) {
                    var formData = new FormData();
                    var file = files[0];
                    formData.append("file", file);

                    var fileName = file.name;
                    var headers = {
                        "file-name": fileName
                    };

                    $.ajax({
                        url: '/files/upload', // 서버 이미지 업로드 처리 URL
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        headers: headers,
                        success: function(response) {
                            var imgUrl = response.imagePath;
                            if (imgUrl) {
                                var imgTag = '<img src="' + imgUrl + '" alt="Uploaded Image" />';
                                $('#summernote').summernote('insertNode', $(imgTag)[0]);
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

        // 기존 게시글의 내용을 여기에 채워넣음
        $('#summernote').summernote('code', '${diary.diaryContents}');
    });

    // 수정 완료 후 저장하는 함수
    function savePost() {
        var title = $('#postTitle').val();
        var content = $('#summernote').val();

        var postData = {
            diaryId: '${diary.diaryId}', // 다이어리 ID
            diaryTitle: title,
            diaryContents: content,
            diaryImage: lastUploadedImageUrl // 마지막 업로드된 이미지 URL
        };

        $.ajax({
            url: '/diary/update',  // 실제 API 엔드포인트로 수정 필요
            type: 'POST',
            data: postData,
            success: function(response) {
                console.log('게시글 수정 성공:', response);
                window.location.href = '/diary/detail/' + '${diary.diaryId}'; // 수정된 게시글 상세 페이지로 이동
            },
            error: function(error) {
                console.log('게시글 수정 실패:', error);
            }
        });
    }

    function cancelEdit() {
        window.location.href = '/diary/detail/${diary.diaryId}'; // 취소 시 상세 페이지로 돌아가기
    }
</script>

</body>
</html>
