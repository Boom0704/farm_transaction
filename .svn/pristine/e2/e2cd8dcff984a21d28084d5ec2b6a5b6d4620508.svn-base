<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅 화면</title>
<style>
/* 공통 스타일 */
* {
	margin-right: 5px;
	padding: 0;
	box-sizing: border-box;
}

body {
	f font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	height: 100vh;
	display: flex;
	flex-direction: column;
	margin: 0 10%;
	border-radius: 5%;
}

/* 상태 바 */
.status-bar {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
	font-size: 1rem;
}

/* 물품 정보 */
.item-info {
	display: flex;
	align-items: center;
	background-color: white;
	padding: 15px;
	border-bottom: 1px solid #ddd;
}

.item-info img {
	width: 100px;
	height: 100px;
	border-radius: 10px;
	margin-right: 15px;
	object-fit: cover;
}

.item-details {
	flex: 1;
}

.item-details div {
	margin: 5px 0;
	font-size: 14px;
}

.item-details .title {
	font-size: 1.1rem;
	font-weight: bold;
}

/* 거래 진행도 */
.progress {
	display: flex;
	justify-content: space-around;
	padding: 10px 0;
	background-color: #f4f4f4;
	border-bottom: 1px solid #ddd;
}

.progress div {
	flex: 1;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	color: #888;
	cursor: pointer;
}

.progress div.active {
	color: white;
	background-color: #4CAF50;
	padding: 8px 0;
	border-radius: 5px;
}

/* 채팅 영역 */
.chat-container {
	flex: 1;
	overflow-y: auto;
	padding: 10px;
	background-color: #fff;
}

.message {
	display: flex;
	margin-bottom: 15px;
	font-size: 14px;
	align-items: center;
}

.message img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
	object-fit: cover;
}

.message.right {
	justify-content: flex-end;
}

.message .content {
	max-width: 60%;
	padding: 10px;
	border-radius: 10px;
	background-color: #f1f1f1;
	position: relative;
}

.message.right .content {
	background-color: #4CAF50;
	color: white;
}

.message .time {
	font-size: 10px;
	color: #888;
	margin-left: 5px;
}

/* 입력창 */
.input-container {
	display: flex;
	align-items: center;
	padding: 10px;
	background-color: #f4f4f4;
	border-top: 1px solid #ddd;
}

.input-container button {
	background: none;
	border: none;
	margin-left: 10px;
	cursor: pointer;
}

.input-container button img {
	width: 25px;
	height: 25px;
}

.input-container input {
	flex: 1;
	padding: 10px;
	border-radius: 20px;
	border: 1px solid #ddd;
	outline: none;
	font-size: 14px;
}
	.me{
				text-align : right;
				/* text-align:center; */
			}

/* 반응형 */
@media ( max-width : 768px) {
	body {
		font-family: Arial, sans-serif;
		background-color: #f9f9f9;
		height: 100vh;
		display: flex;
		flex-direction: column;
		margin: 0;
	}
	.item-info img {
		width: 80px;
		height: 80px;
	}
	.message .content {
		max-width: 80%;
	}
	.progress div {
		font-size: 10px;
	}
}
</style>
</head>
<body id="page-top">
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<div id="chat-containerK">
				<div class="chatWrap">
					<!-- 방 정보 -->
					<div class="main_tit"></div>
					<div class="content chatcontent border border-secondary"
						id="chat-content">
						<div id="list-guestbook"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 상태 바 -->
	<div class="status-bar">
		<span>아이디: user123</span> <span>신뢰도: 90%</span>
	</div>
	<!-- 물품 정보 -->
	<div class="item-info">
		<div class="item-details">
			<div class="title">${roomView.sellTitle}</div>
			<div>${roomView.sellPrice}원</div>
			<div>${roomView.sellRegion}</div>
		</div>
	</div>



	<!-- 거래 진행도 -->
	<div class="progress" id="progress">
		<div onclick="updateProgress(0)">약속잡기</div>
		<div onclick="updateProgress(1)">거래완료</div>
		<div onclick="updateProgress(2)">후기 보내기</div>
	</div>

	<!-- 채팅 영역 -->
	<div class="chat-container">
		<div class="content chatcontent border border-secondary"
			data-room-no="">
			<c:forEach var="chat" items="${chatList}">
				
				<!-- 내 채팅일 경우 -->
				<!-- 수정해야함 -->
				<c:if test="${'do' eq chat.tmSender }">
					<ul>
						<li data-no="" class="me pr-2">
							<strong class="">${chat.tmSender }</strong>
							<img src="${chat.tmImgName }" class="rounded-circle img-thumbnail shadow-sm" width="50" >
							<div class="me">
							     <c:if test="${chat.tmContentType eq 'TEXT' }">
									<p class='myChat chat-box text-left p-3'>${chat.tmContent }</p>
							     </c:if>
							     <c:if test="${chat.tmContentType eq 'IMG' }">
									  <img src="${chat.tmContent }" width="100" >					     
							     </c:if>
 								 <br><strong style="display : inline;" class="align-self-end">${chat.tmDate }</strong>
							</div>
						</li>
					</ul>
				</c:if>
				<!-- 다른사람의 채팅일 경우 -->
				<!-- 수정해야함 -->
				<c:if test="${'do' ne chat.tmSender }">
				<ul>
					<li data-no="" class="pl-2">
						<strong>${chat.tmSender }</strong>
						<img src="${chat.tmImgName }" class="rounded-circle img-thumbnail shadow-sm" width="50" >
						<div>
							<c:if test="${chat.tmContentType eq 'TEXT' }">
								<p class='chat-box bg-light p-3'>${chat.tmContent }</p>
							</c:if>
							<c:if test="${chat.tmContentType eq 'IMG' }">
									  <img src="${chat.tmContent }" width="100" >					     
							</c:if>
								<br><strong style="display : inline;" class="align-self-center">${chat.tmDate }</strong>
						</div>
					</li>
				</ul>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<!-- 입력창 -->
	<div class="input-container">
		<button id="addImageButton" aria-label="사진 추가">
			<img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png"
				alt="추가 버튼">
		</button>
		<input type="file" id="fileInput" accept="image/*" style="display: none;">
		<input type="text" id="msgi" placeholder="메시지를 입력해주세요">
		<button>
			<img src="https://cdn-icons-png.flaticon.com/512/742/742751.png"
				alt="이모지">
		</button>
		<button id="btnSend">
			<img src="https://cdn-icons-png.flaticon.com/512/786/786205.png"
				alt="전송">
		</button>
	</div>

	<!-- jQuery CDN 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- SockJS와 STOMP CDN 추가 -->
	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script>
        var tmChatId = '${chatId}';  // 채팅방 ID
        
        var memId = '${roomView.chatBuyer}';  // 사용자 ID
        var memNm = '테스트 사용자';  // 사용자 이름
        $(document).ready(function () {
            var client;

            // WebSocket 연결 설정
            var sock = new SockJS("/endpoint");
            client = Stomp.over(sock);

            // 서버 연결
            client.connect({ "userId": memId, "tmChatId": tmChatId }, function () {
                console.log("WebSocket 연결 성공");

                // 채팅 구독
                client.subscribe("/subscribe/chat/${chatId}", function (chat) {
                    var body = JSON.parse(chat.body);
					console.log(body);
                    // 메시지 렌더링
                    var messageHtml = renderList(body);
                    $(".chat-container").append(messageHtml);
                    scrollDown();
                });
            }, function (error) {
                console.error("WebSocket 연결 실패:", error);
                alert("채팅 서버와 연결할 수 없습니다.");
            });

            // 메시지 전송
            $("#btnSend").click(sendMessage);
            $("#msgi").keydown(function (e) {
                if (e.keyCode === 13) sendMessage();
            });

            // 메시지 전송 함수
            function sendMessage() {
                var msg = $("#msgi").val().trim();
                if (msg === "") return;

                client.send(`/app/hello/${chatId}`, {}, JSON.stringify({
                	tmContent: msg,
                	tmSender: memId,
                	tmContentType:"TEXT",
                	tmChatId: tmChatId,
                    memNm: memNm
                }));
                $("#msgi").val('');
            }
            // 이미지 전송 함수
			$(document).ready(function () {
			    // 파일 선택 버튼 클릭 시 fileInput 클릭 트리거
			    $("#addImageButton").click(function () {
			        $("#fileInput").click();
			    });
				
			    // 파일 선택 후 이벤트 처리
			    $("#fileInput").change(function (event) {
			        const file = event.target.files[0];
			        if (file) {
			            console.log('사진이 선택되었습니다:', file.name);
			            // 파일 처리 로직 추가
			            let fileType= file['type'];
						let valTypes = ['image/gif','image/jpeg','image/jpg','image/png'];
						if(!valTypes.includes(fileType)){
							alert("유효한 이미지 타입이 아닙니다.!!");
							$(this).val(''); //선택파일 초기화
						}else{
							// 수정해야함. 
							 var formData = new FormData();
						     formData.append('file', file);
						     formData.append('tmSender', 'do');
						     formData.append('tmChatId', tmChatId);
						     console.log(formData);
							$.ajax({
								 url : '<c:url value="/files/upload" />'
								,type:'POST'
								,data:formData
								,dataType:'json'
								,processData:false //formData객체를 URL인코딩하지 않도록
								,contentType:false //디폴트 전송인 application/x-www-form-urlencoded 로 전송하지 않도록
								                   // 파일은 multipart/form-data 이진 데이터 형태로 전송
								,success:function(res){
									client.send(`/app/hello/${chatId}`, {}, JSON.stringify({
					                	tmContent: res.imagePath,
					                    tmContentType: 'IMG', 
					                    tmSender: memId,
					                    tmChatId: tmChatId,
					                    memNm: memNm
					                }));
									console.log(res);
								},error:function(e){
									console.log(e)
								}
							});
						}
			        }
			    });
		    });


			// 메시지 출력
			function renderList(vo) {
				console.log(vo);
			    var str = "";
			    var content = "";

			    // 내가 보낸 메시지 (memId가 일치하는 경우)
			    if (vo.tmSender === memId) {
			    	if(vo.chatType == 'IMG'){
			    		alert("이미지!!");
			    	}
			        content = "<p class='myChat chat-box text-left p-3'>" + vo.tmContent + "</p>";
			        str = "<li data-no='' class='me pr-2'>" +
			            "<strong class=''>" + vo.tmSender + "</strong>" +
			            "<div class='me'>" + content +
			            "</div>" +
			            "<strong style='display: inline;' class='align-self-end'>" + vo.tmDate + "</strong>" +
			            "</li>";
			    } else {
			        // 다른 사람이 보낸 메시지
			        content = "<p class='chat-box bg-light p-3'>" + vo.tmContent + "</p>";
			        str = "<li data-no='' class='pr-2'>" +
			            "<strong class=''>" + vo.tmSender  +"</strong>" +
			            "<div>" + content +
			            "</div>" +
			            "<strong style='display: inline;' class='align-self-end'>" + vo.tmDate + "</strong>" +
			            "</li>";
			    }

			    return str;
			}


            // 채팅창 스크롤 하단 이동
            function scrollDown() {
                $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
            }

            // 거래 진행도 업데이트
            window.updateProgress = function (index) {
                $(".progress div").each(function (i) {
                    $(this).toggleClass("active", i <= index);
                });
            };
        });
    </script>
</body>

</html>
