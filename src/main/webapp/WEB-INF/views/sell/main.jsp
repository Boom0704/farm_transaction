<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 물건 팔기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sell_main.css">
</head>

<body>
<jsp:include page="/WEB-INF/inc/common/header.jsp"></jsp:include>
<div class="container">
    <form id="itemForm" enctype="multipart/form-data" action="register" method="post">
        <h4>내 물건 팔기</h4>

        <!-- 이미지 업로드 -->
        <div class="mb-3">
            <label for="imageUpload">사진 (최대 10개)</label>
            <div class="image-upload">
                <label for="imageUpload">
                    <span>+</span>
                    <small>이미지 추가</small>
                    <input type="file" id="imageUpload" name="imageUpload" style="display: none;" multiple accept="image/*">
                </label>
                <div id="imagePreview"></div>
            </div>
            <small id="imageCount">0/10</small>
        </div>

        <!-- 자동완성 여부 -->
        <div class="mb-3">
            <label for="autoCompleteSwitch" class="form-label">자동완성</label>
            <div class="switch-wrapper">
                <input type="checkbox" id="autoCompleteSwitch" class="toggle-switch">
                <label for="autoCompleteSwitch" class="switch-label"></label>
            </div>
            <!-- prodCategory 입력 필드 -->
		    <div class="ms-3 flex-grow-1">
		        <label for="prodCategoryInput" class="form-label">카테고리</label>
		        <input type="text" id="prodCategoryInput" name="prodCategory" class="form-control" placeholder="카테고리를 입력하세요">
		    </div>
        </div>

        <!-- 제목 -->
        <div class="mb-3">
            <label for="prodName">제목</label>
            <input type="text" id="prodName" name="prodName" placeholder="제목을 입력해주세요">
        </div>

        <!-- 거래 방식 -->
        <div class="mb-3">
            <label>거래 방식</label>
            <div class="radio-button-group">
                <div class="form-check">
                    <input type="radio" id="prodOption" name="tradeOption" value="판매하기" checked>
                    <label for="prodOption">판매하기</label>
                </div>
                <div class="form-check">
                    <input type="radio" id="giveOption" name="tradeOption" value="나눠주기">
                    <label for="giveOption">나눠주기</label>
                </div>
            </div>
        </div>

        <!-- 가격 -->
        <div class="mb-3">
            <label for="price">가격</label>
            <input type="number" id="price" name="prodPrice" placeholder="가격을 입력해주세요" required>
        </div>

        <!-- 상세 설명 -->
        <div class="mb-3">
            <label for="description">자세한 설명</label>
            <textarea id="description" name="prodContent" rows="5" placeholder="내용을 입력해주세요"></textarea>
        </div>

        <!-- 거래 희망 장소 -->
        <div class="mb-3">
            <label for="fullAddr">거래 희망 장소</label>
            <input type="text" id="fullAddr" name="prodPlace" placeholder="주소를 입력해주세요" readonly>
            <button type="button" class="btn btn-outline-secondary" onclick="fn_search()">주소 검색</button>
        </div>
        
        <!-- 지도 컨테이너 추가 -->
    	<div id="map" style="width:100%;height:350px;margin-top:15px;"></div>

        <!-- 작성하기 버튼 -->
        <div>
            <button type="submit">작성하기</button>
        </div>
    </form>
</div>
<jsp:include page="/WEB-INF/inc/common/footer.jsp"></jsp:include>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoApiKey}&libraries=services"></script>
<script> 

//체크박스 요소 가져오기
const autoCompleteSwitch = document.getElementById("autoCompleteSwitch");

// 이벤트 리스너 추가
$('#autoCompleteSwitch').change(function () {
    if (this.checked) {
        // 자동완성이 활성화되었을 때 실행
        console.log("자동완성: 활성화됨");

        // 입력된 카테고리 값 가져오기
        const cropType = $('#prodCategoryInput').val().trim();

        if (!cropType) {
            alert("카테고리를 입력해주세요.");
            this.checked = false; // 체크박스 비활성화
            return;
        }

        // AJAX 요청
        $.ajax({
            url: '/api_auto/generate', // Flask Controller와 일치하도록 경로 수정
            type: 'POST',
            contentType: 'application/json', // JSON 데이터 전송
            dataType: 'json',
            data: JSON.stringify({ category: cropType }), // JSON 형식으로 데이터 전송
            success: function (data) {
                if (data.error) {
                    console.error("Error from server:", data.error);
                    alert("자동완성 데이터를 가져오는 중 오류가 발생했습니다.");
                } else {
                    console.log("자동완성 결과:", data);

                    // 폼 필드 업데이트
                    $('#prodCategoryInput').val(data.category);
                    $('#prodName').val(data.title || ''); // 제목 자동완성
                    $('#description').val(data.content || ''); // 내용 자동완성
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error);
                alert("Flask 서버와의 통신 중 오류가 발생했습니다.");
            }
        });
    } else {
        console.log("자동완성: 비활성화됨");

        // 자동완성 필드 초기화
        $('#prodCategoryInput').val('');
        $('#prodName').val('');
        $('#description').val('');
    }
});
	
    const imageUpload = document.getElementById('imageUpload');
    const imagePreview = document.getElementById('imagePreview');
    const imageCount = document.getElementById('imageCount');
    let selectedFiles = [];

    imageUpload.addEventListener('change', function () {
        const files = Array.from(imageUpload.files);
        if (selectedFiles.length + files.length > 10) {
            alert('최대 10개의 이미지만 업로드 가능합니다.');
            // 파일 개수를 넘어서는 경우 선택되지 않도록 설정
            return;
        }

        selectedFiles = selectedFiles.concat(files);
        renderImagePreview();
    });

    function renderImagePreview() {
        imagePreview.innerHTML = '';
        for (let i = 0; i < selectedFiles.length; i++) {
            const file = selectedFiles[i];
            const reader = new FileReader();
            reader.onload = function (e) {
                const container = document.createElement('div');
                container.classList.add('image-container');

                const img = document.createElement('img');
                img.src = e.target.result;

                const removeBtn = document.createElement('span');
                removeBtn.classList.add('remove-image');
                removeBtn.textContent = 'X';
                removeBtn.addEventListener('click', () => removeImage(i));

                container.appendChild(img);
                container.appendChild(removeBtn);
                imagePreview.appendChild(container);
            };
            reader.readAsDataURL(file);
        }
        imageCount.textContent = selectedFiles.length + '/10';
    }

    function removeImage(index) {
        selectedFiles.splice(index, 1);
        renderImagePreview();
    }
<<<<<<< .mine
    
    /* function testAutoCompleteByCropType(cropType) {
        $.ajax({
            url: 'fawefawe/autoCompleteByCropType',
            type: 'GET',
            dataType: 'json',
            data: { cropType: cropType },
            success: function(data) {
                if (data.error) {
                    console.log(data.error);
                } else {
                    console.log("CropType:", data.cropType);
                    console.log("Title:", data.saleTitle);
                    console.log("Content:", data.saleContent);
                    // 폼에 자동 완성
                    $('#sellCategoryInput').val(data.cropType);
                    $('#sellTitle').val(data.saleTitle);
                    $('#description').val(data.saleContent);
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error:", status, error);
            }
        });
    } */
||||||| .r183
    
    /* function testAutoCompleteByCropType(cropType) {
        $.ajax({
            url: '/autoCompleteByCropType',
            type: 'GET',
            dataType: 'json',
            data: { cropType: cropType },
            success: function(data) {
                if (data.error) {
                    console.log(data.error);
                } else {
                    console.log("CropType:", data.cropType);
                    console.log("Title:", data.saleTitle);
                    console.log("Content:", data.saleContent);
                    // 폼에 자동 완성
                    $('#sellCategoryInput').val(data.cropType);
                    $('#sellTitle').val(data.saleTitle);
                    $('#description').val(data.saleContent);
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error:", status, error);
            }
        });
    } */
=======
>>>>>>> .r212

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 지도 중심 좌표
        level: 3 // 초기 확대 레벨
    };
	/////////////////////////////////////////////////////////////////
	// 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 지도 마커 변수 (기존 마커 제거를 위해 전역 선언)
	var marker = null;
	
	function fn_search() {
	    new daum.Postcode({
	        oncomplete: function (data) {
	            var addr = data.address; // 사용자가 선택한 주소
	            document.getElementById('fullAddr').value = addr;
	
	            // 주소로 좌표를 검색
	            geocoder.addressSearch(addr, function (result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	                    // 기존 마커 제거
	                    if (marker) marker.setMap(null);
	
	                    // 새 마커 생성 및 추가
	                    marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords
	                    });
	                    
	                    // 인포윈도우 추가
						var infowindow = new kakao.maps.InfoWindow({
						    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + addr + '</div>'
						});
						infowindow.open(map, marker);
	
	                    // 지도 중심 좌표 이동
	                    map.setCenter(coords);
	                } else {
	                    alert("주소를 검색할 수 없습니다.");
	                }
	            });
	        }
	    }).open();
	}
</script>
</html>
