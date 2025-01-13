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
<link rel="stylesheet" href="/css/chat.css">
</head>

<body>
<jsp:include page="/WEB-INF/inc/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/inc/modal/promiseModal.jsp"></jsp:include>

<!-- 후기 작성 모달  -->
<div class="modal fade" id="insertReviewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">후기 작성</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- hidden inputs -->
        <input type="hidden" id="revWriter"/>
        <input type="hidden" id="revTarget"/>
        <input type="hidden" id="revProdId"/>

        <!-- 별점 -->
        <div class="mb-3">
          <label class="form-label">별점</label>
          <div class="star-rating">
            <!-- 역순 별점 예시 -->
            <input type="radio" id="star5" name="revScore" value="5">
            <label for="star5">★</label>
            <input type="radio" id="star4" name="revScore" value="4">
            <label for="star4">★</label>
            <input type="radio" id="star3" name="revScore" value="3">
            <label for="star3">★</label>
            <input type="radio" id="star2" name="revScore" value="2">
            <label for="star2">★</label>
            <input type="radio" id="star1" name="revScore" value="1">
            <label for="star1">★</label>
          </div>
        </div>
        <!-- 후기 내용 -->
        <div class="mb-3">
          <label for="revContent" class="form-label">후기 내용</label>
          <textarea class="form-control" id="revContent" rows="4"
                    placeholder="후기를 작성해주세요" required></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
                data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary"
                onclick="submitReview()">등록</button>
      </div>
    </div>
  </div>
</div>

<!-- 후기 보기 모달 -->
<div class="modal fade" id="viewReviewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">후기 내용</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 후기 정보 표시 영역 -->
        <div id="reviewDetail"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 메인 컨테이너 -->
<div class="container">
  <!-- 서버에서 넘겨준 memId, chatId, roomView 등 -->
  <c:set var="memId" value="${userInfo.memId}" />
  <c:set var="tmStatus" value="${roomView.tmStatus != null ? roomView.tmStatus : 'N'}" />
  <c:set var="detailReview" value="${detailReview.revId != null ? detailReview.revId : null}" />

  <!-- 상태 바 -->
  <div class="status-bar">
    <button onclick="history.back()">←</button>
    <span class="chat-seller">아이디: ${roomView.chatSeller}</span>
    <span class="trust-level">
      신뢰도: <c:out value="${roomView.memReliability != null ? roomView.memReliability : 0}" />
    </span>
  </div>

  <!-- 물품 정보 영역 -->
  <div class="item-info">
    <img src="${roomView.prodPhotoPath}" alt="상품이미지">
    <div class="item-details">
      <div class="title">${roomView.prodName}</div>
      <div>${roomView.prodPrice}원</div>
      <div style="color:#666; font-size:0.9rem;">${roomView.prodPlace}</div>

      <!-- 거래 버튼들 (약속/완료/후기) -->
      <div class="trade-buttons" id="tradeButtons">
        <button id="btnAppointment" class="btn-appointment">약속잡기</button>
        <button id="btnComplete" class="btn-complete">거래완료</button>
        <button id="btnReview" class="btn-review">후기보내기</button>
      </div>
      <div id="alreadyReviewed">이미 후기 작성됨
		<button id="btnViewReview" class="btn btn-info" onclick="openReviewDetail()">후기보기</button>
      </div>
    </div>
  </div>

  <!-- 채팅 영역 -->
  <div class="chat-container">
    <div class="content chatcontent">
      <c:forEach var="chat" items="${chatList}">
        <!-- 내가 보낸 메시지 -->
        <c:if test="${memId eq chat.tmSender}">
          <ul>
            <li style="margin-bottom:10px; text-align:right;">
              <strong>${chat.tmSender}</strong>
              <div>
                <c:choose>
                  <c:when test="${chat.tmContentType eq 'TEXT'}">
                    <p class="chat-box">${chat.tmContent}</p>
                  </c:when>
                  <c:when test="${chat.tmContentType eq 'IMG'}">
                    <img src="${chat.tmContent}" width="100" style="cursor:pointer;"
                         onclick="openImageModal('${chat.tmContent}')">
                  </c:when>
                  <c:when test="${chat.tmContentType eq 'APPOINTMENT'}">
                    <span class="appointment-message">${chat.tmContent}</span>
                    <c:if test="${chat.tmStatus eq 'REQUEST'}">
                      <span style="color:orange;">(약속 요청중)</span>
                    </c:if>
                    <c:if test="${chat.tmStatus eq 'R'}">
                      <span style="color:green;font-weight:bold;">(예약중)</span>
                    </c:if>
                    <c:if test="${chat.tmStatus eq 'C'}">
                      <span style="color:red;font-weight:bold;">(거래완료)</span>
                    </c:if>
                  </c:when>
                  <c:otherwise>
                    <p class="chat-box">${chat.tmContent}</p>
                  </c:otherwise>
                </c:choose>
                <br>
                <small style="color:#999;">${chat.tmDate}</small>
              </div>
            </li>
          </ul>
        </c:if>

        <!-- 상대방 메시지 -->
        <c:if test="${memId ne chat.tmSender}">
          <ul>
            <li style="margin-bottom:10px; text-align:left;">
              <strong>${chat.tmSender}</strong>
              <div>
                <c:choose>
                  <c:when test="${chat.tmContentType eq 'TEXT'}">
                    <p class="chat-box bg-light">${chat.tmContent}</p>
                  </c:when>
                  <c:when test="${chat.tmContentType eq 'IMG'}">
                    <img src="${chat.tmContent}" width="100" style="cursor:pointer;"
                         onclick="openImageModal('${chat.tmContent}')">
                  </c:when>
                  <c:when test="${chat.tmContentType eq 'APPOINTMENT'}">
                    <span class="appointment-message">${chat.tmContent}</span>
                    <c:if test="${chat.tmStatus eq 'REQUEST'}">
                      <button class="confirm-button" onclick="confirmAppointment('${chat.tmChatId}')">확인</button>
                    </c:if>
                    <c:if test="${chat.tmStatus eq 'R'}">
                      <span style="color:green;font-weight:bold;">(예약중)</span>
                    </c:if>
                    <c:if test="${chat.tmStatus eq 'C'}">
                      <span style="color:red;font-weight:bold;">(거래완료)</span>
                    </c:if>
                  </c:when>
                  <c:otherwise>
                    <p class="chat-box">${chat.tmContent}</p>
                  </c:otherwise>
                </c:choose>
                <br>
                <small style="color:#999;">${chat.tmDate}</small>
              </div>
            </li>
          </ul>
        </c:if>
      </c:forEach>

      <!-- 거래완료 안내문 (파란색) -->
      <div id="completeNotice" class="complete-notice">
        거래가 완료되었습니다!
      </div>

    </div>
  </div>

  <!-- 채팅 입력창 -->
  <div class="input-container">
    <button id="btnImgAttach">
      <img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png"
           alt="이미지첨부">
    </button>
    <input type="file" id="fileInput" accept="image/*">
    <input type="text" id="msgInput" placeholder="메시지를 입력해주세요...">

    <button id="btnEmoji">
      <img src="https://cdn-icons-png.flaticon.com/512/742/742751.png"
           alt="이모티콘">
    </button>

    <button id="btnSend">
      <img src="https://cdn-icons-png.flaticon.com/512/786/786205.png"
           alt="전송">
    </button>
  </div>
</div>

<jsp:include page="/WEB-INF/inc/common/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
  var tmChatId   = "${chatId}";
  var memId      = "${memId}";
  var chatSeller = "${roomView.chatSeller}";
  var chatBuyer  = "${roomView.chatBuyer}";
  var tmStatus   = "${tmStatus}"; // 'N','REQUEST','R','C'
  var client     = null;
  var detailReview   = "${detailReview}";

  // 문서 준비
  $(document).ready(function(){
    // 1) 거래 버튼/상태 초기화
    initTradeButtons();
	
    // 2) STOMP 연결
    var sock = new SockJS("/endpoint");
    client = Stomp.over(sock);

    client.connect({"userId": memId,"tmChatId": tmChatId}, function(){
      console.log("STOMP 연결 성공");
      // 구독
      client.subscribe("/subscribe/chat/"+tmChatId, function(msg){
        var data = JSON.parse(msg.body);
        console.log("수신:", data);

        // 새 메시지 렌더링
        var html = renderList(data);
        $(".chatcontent ul:last").append(html);
        scrollDown();

        // 약속/거래 상태 업데이트
        if(data.tmContentType==="APPOINTMENT"){
          if(data.tmStatus==="R"){
            tmStatus="R";
          } else if(data.tmStatus==="C"){
            tmStatus="C";
            // 파란 안내문 표시
            $("#completeNotice").show();
          }
          initTradeButtons();
        }
      });
    }, function(err){
      console.error("STOMP 연결 실패:", err);
      alert("채팅 서버 연결 실패");
    });

    // 3) 버튼 이벤트
    $("#btnSend").click(sendMessage);
    $("#msgInput").keydown(function(e){
      if(e.keyCode===13) sendMessage();
    });
    $("#btnImgAttach").click(function(){ 
      $("#fileInput").click();
    });
    $("#fileInput").change(onImageSelected);
  });

  /* ========== 거래 버튼 상태 ========== */
  function initTradeButtons(){
    $("#btnAppointment").hide();
    $("#btnComplete").hide();
    $("#btnReview").hide();
    $("#alreadyReviewed").hide();
    if(tmStatus==="N" || tmStatus==="REQUEST"){
      // 약속잡기만
      $("#btnAppointment").show().off("click").on("click", handleAppointment);
    } else if(tmStatus==="R"){
      // 거래완료만
      $("#btnComplete").show().off("click").on("click", handleComplete);
    } else if(tmStatus==="C"){
    	if(detailReview == null || detailReview == ""){
	       // 후기보내기만
   		    $("#btnReview").show().off("click").on("click", openReviewModal);
    	}else{
    		$("#alreadyReviewed").show();    		
    	}
      // 파란 안내문도 표시
      $("#completeNotice").show();
    }
  }

  /* ========== 이미지 선택 업로드 ========== */
  function onImageSelected(e){
    var file = e.target.files[0];
    if(!file)return;
    var valid=["image/jpeg","image/png","image/gif","image/jpg"];
    if(valid.indexOf(file.type)<0){
      alert("이미지 파일만 업로드 가능");
      $(this).val("");
      return;
    }
    var fd=new FormData();
    fd.append("file", file);
    fd.append("tmSender", memId);
    fd.append("tmChatId", tmChatId);

    $.ajax({
      url:"/files/upload",
      type:"POST",
      data:fd,
      dataType:"json",
      processData:false,
      contentType:false,
      success:function(res){
        // STOMP 전송
        client.send("/app/hello/"+tmChatId,{}, JSON.stringify({
          tmContent:res.imagePath,
          tmContentType:"IMG",
          tmSender:memId,
          tmChatId:tmChatId,
          chatSeller:chatSeller
        }));
      },
      error:function(err){
        console.log(err);
        alert("이미지 업로드 실패");
      }
    });
  }

  /* ========== 메시지 전송 ========== */
  function sendMessage(){
    var msg=$("#msgInput").val().trim();
    if(!msg)return;
    client.send("/app/hello/"+tmChatId,{},JSON.stringify({
      tmContent:msg,
      tmSender:memId,
      tmContentType:"TEXT",
      tmChatId:tmChatId,
      chatSeller:chatSeller
    }));
    $("#msgInput").val("");
  }

  /* ========== 메시지 렌더링 ========== */
  function renderList(vo){
    var content="";
    if(vo.tmContentType==="APPOINTMENT"){
      content=renderAppointment(vo);
    } else if(vo.tmContentType==="IMG"){
      content="<img src='"+vo.tmContent+"' width='100' style='cursor:pointer;'"
             +" onclick=\"openImageModal('"+vo.tmContent+"')\">";
    } else {
      // TEXT
      content="<p class='chat-box'>"+vo.tmContent+"</p>";
    }

    var li="";
    if(vo.tmSender===memId){
      // 내 메시지
      li+="<li style='margin-bottom:10px; text-align:right;'>";
      li+="<strong>"+vo.tmSender+"</strong>";
      li+="<div>"+content+"<br>"
        +"<small style='color:#999;'>"+(vo.tmDate||"")+"</small></div>";
      li+="</li>";
    } else {
      // 상대방
      li+="<li style='margin-bottom:10px; text-align:left;'>";
      li+="<strong>"+vo.tmSender+"</strong>";
      li+="<div>"+content+"<br>"
        +"<small style='color:#999;'>"+(vo.tmDate||"")+"</small></div>";
      li+="</li>";
    }
    return li;
  }

  /* ========== 약속 메시지 렌더링 ========== */
  function renderAppointment(vo){
    var html="<span class='appointment-message'>"+vo.tmContent+"</span>";
    if(vo.tmStatus==="REQUEST"){
      if(vo.tmSender!==memId){
        html+=" <button class='confirm-button' onclick=\"confirmAppointment('"+vo.tmChatId+"')\">확인</button>";
      } else {
        html+=" <span style='color:orange;'>(요청중)</span>";
      }
    } else if(vo.tmStatus==="R"){
      html+=" <span style='color:green;font-weight:bold;'>(예약중)</span>";
    } else if(vo.tmStatus==="C"){
      html+=" <span style='color:red;font-weight:bold;'>(거래완료)</span>";
    }
    return html;
  }

  /* ========== 스크롤 맨 아래로 ========== */
  function scrollDown(){
    var cc=document.querySelector(".chatcontent");
    if(cc) cc.scrollTop=cc.scrollHeight;
  }

  /* ========== 약속잡기 ========== */
  function handleAppointment(){
    if(tmStatus==="R"||tmStatus==="C"){
      alert("이미 약속중이거나 거래완료된 상태입니다!");
      return;
    }
    // 약속 모달
    var m=new bootstrap.Modal(document.getElementById("promiseModal"));
    m.show();
  }

  /* ========== 약속확인 ========== */
  function confirmAppointment(chatId){
    client.send("/app/hello/"+chatId,{},JSON.stringify({
      tmContent:"약속 확인되었습니다.",
      tmSender:memId,
      tmContentType:"APPOINTMENT",
      tmStatus:"R",
      tmChatId:chatId
    }));
  }

  /* ========== 거래완료 ========== */
  function handleComplete(){
    if(tmStatus!=="R"){
      alert("예약중 상태가 아니므로 거래완료 불가");
      return;
    }
    client.send("/app/hello/"+tmChatId,{},JSON.stringify({
      tmContent:"거래 완료",
      tmSender:memId,
      tmContentType:"APPOINTMENT",
      tmStatus:"C",
      tmChatId:tmChatId
    }));
  }

  /* ========== "후기보내기" 버튼 → 후기작성 모달 열기 ========== */
  function openReviewModal(){
    // 작성자(나), 대상자(상대방), 상품ID
    $("#revWriter").val(memId);
    if(memId===chatSeller){
      $("#revTarget").val(chatBuyer);
    } else {
      $("#revTarget").val(chatSeller);
    }
    $("#revProdId").val("${roomView.chatProdId}");

    // 별점/내용 초기화
    $("input[name='revScore']").prop("checked",false);
    $("#revContent").val("");

    let m=new bootstrap.Modal(document.getElementById("insertReviewModal"));
    m.show();
  }

  /* ========== 후기작성 실제 전송 ========== */
  function submitReview(){
    var writer=$("#revWriter").val();
    var target=$("#revTarget").val();
    var prodId=$("#revProdId").val();
    var score=$("input[name='revScore']:checked").val();
    var content=$("#revContent").val().trim();

    if(!score){ alert("별점을 선택하세요"); return; }
    if(!content){ alert("후기를 입력하세요"); return; }

    var dataObj={
      revWriter:writer,
      revTarget:target,
      revProdId:prodId,
      revScore:score,
      revContent:content
    };
    $.ajax({
      url:"/review/write",
      type:"POST",
      data: JSON.stringify(dataObj),
      contentType:"application/json; charset=utf-8",
      dataType:"json",
      success:function(res){
        if(res.success){
          alert("후기 등록 성공");
          let modalElem=document.getElementById("insertReviewModal");
          let m=bootstrap.Modal.getInstance(modalElem);
          m.hide();
          $("#btnReview").hide();
          // 이미 작성됨 표시 및 후기보기 버튼 활성화
          $("#alreadyReviewed").show();
          // 후기보기 버튼이 포함되어 있으므로 별도 처리 불필요
        } else {
          alert(res.message);
        }
      },
      error:function(err){
        console.log(err);
        alert("후기 등록 실패");
      }
    });
  }

  /* ========== 후기 보기 모달 ========== */
  function openReviewDetail(){
    $.ajax({
      url:"/review/detail",
      type:"GET",
      data:{
    	revProdId:"${roomView.chatProdId}",
    	revWriter:memId
      },
      dataType:"json",
      success:function(res){
        if(res.success){
          let rv=res.review;
          let html="<p><strong>별점:</strong> "+rv.revScore+"</p>"
                  +"<p><strong>내용:</strong> "+rv.revContent+"</p>"
                  +"<p><strong>작성일:</strong> "+(rv.revDate||"")+"</p>";
          $("#reviewDetail").html(html);
        } else {
          $("#reviewDetail").html("<p>"+res.message+"</p>");
        }
        let m=new bootstrap.Modal(document.getElementById("viewReviewModal"));
        m.show();
      },
      error:function(err){
        console.log(err);
        alert("후기 불러오기 실패");
      }
    });
  }

  /* ========== 이미지 모달 열기/닫기 ========== */
  function openImageModal(url){
    $("#imageModalImg").attr("src",url);
    $("#imageModal").css("display","flex");
  }
  function closeImageModal(){
    $("#imageModal").hide();
    $("#imageModalImg").attr("src","");
  }

</script>
</body>
</html>