package com.future.blue.purchase.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.future.blue.common.util.MemberUtil;
import com.future.blue.purchase.service.ChatService;
import com.future.blue.purchase.vo.ChatListVO;
import com.future.blue.purchase.vo.ChatVO;
import com.future.blue.purchase.vo.ReviewVO;
import com.future.blue.purchase.vo.RoomVO;
import com.future.blue.push.service.PushNotificationService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@Autowired
	private PushNotificationService pushService;
	
	@RequestMapping("/chat")
	public String chatView(Model model, RoomVO room, HttpServletRequest request) {
		
		
		if (room.getChatSeller() != null && room.getChatBuyer() != null && room.getChatProdId() != null) { // getProId 에서 getChatProdId 이걸로 바꿈
	        // 판매자와 구매자를 정렬하여 처리
//	        String normalizedSeller = room.getChatSeller().compareTo(room.getChatBuyer()) < 0 
//	                ? room.getChatSeller() 
//	                : room.getChatBuyer();
//	        String normalizedBuyer = room.getChatSeller().compareTo(room.getChatBuyer()) < 0 
//	                ? room.getChatBuyer() 
//	                : room.getChatSeller();
//
//	        room.setChatSeller(normalizedSeller);
//	        room.setChatBuyer(normalizedBuyer);

	        String chatId = chatService.checkChat(room); // 정렬된 정보를 기반으로 채팅방 조회
	        if (chatId == null) {
	            chatId = chatService.getOrCreateChatRoom(room); // 새로운 채팅방 생성
	        }
			ArrayList<ChatVO> chatList = chatService.getChatList(chatId); // 생성된 채팅방의 대화 내용 조회
			model.addAttribute("chatId", chatId);
			model.addAttribute("chatList", chatList);			

			// 방정보 가져오기
			RoomVO roomView = chatService.getRoomDetails(chatId);
			System.out.println(roomView);
			model.addAttribute("roomView", roomView);
			
			String memId = MemberUtil.getMemIdFromCookie(request);
			ReviewVO reviewVO = new ReviewVO();
			reviewVO.setRevWriter(memId);
			reviewVO.setRevProdId(roomView.getChatProdId());
			try {
				ReviewVO detailReview = chatService.getReview(reviewVO);
				model.addAttribute("detailReview",detailReview);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} else {
			model.addAttribute("error", "채팅 방을 생성하기 위한 파라미터가 부족합니다.");
			return "errorPage"; // 파라미터 부족 시 에러 처리
		}
		
		return "purchase/chat"; // 채팅 페이지로 리턴
	}

	@RequestMapping("/list")
	public String chatListView(Model model) {
		ArrayList<RoomVO> roomList = chatService.getRoomList();
		model.addAttribute("roomList", roomList);

		return "purchase/list";
	}

	/**
	 * Stomp를 통해 클라이언트가 "/app/hello/{chatId}" 경로로 보낸 메시지를 처리하는 메서드.
	 * 처리 결과는 "/subscribe/chat/{chatId}" 구독자들에게 broadcast.
	 * 
	 * - 일반 TEXT 채팅: tmContentType != "APPOINTMENT" 인 경우
	 * - 약속(REQUEST): tmContentType="APPOINTMENT", tmStatus="REQUEST"
	 * - 약속 확인(R): tmContentType="APPOINTMENT", tmStatus="R"
	 * - 거래 완료(C): tmContentType="APPOINTMENT", tmStatus="C"
	 *
	 * @param chatVO  클라이언트에서 전송된 ChatVO (채팅방 ID, 내용, 타입, 상태 등 포함)
	 * @return        최종적으로 구독 중인 클라이언트들에 뿌려줄 ChatVO
	 */
	/**
     * 메시지 전송 처리 (STOMP)
     * - /app/hello/{chatId} 로 들어온 메시지 → /subscribe/chat/{chatId} 로 방송
     */
    @MessageMapping("/hello/{chatId}")
    @SendTo("/subscribe/chat/{chatId}")
    public ChatVO broadcasting(ChatVO chatVO) {

        System.out.println("수신된 메시지: " + chatVO);

        // 1) 날짜 세팅
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            chatVO.setTmDate(sdf.format(new Date()));
        } catch (Exception e) {
            System.out.println("날짜 포맷 오류: " + e.getMessage());
        }

        // 2) 로직 분기 (약속 or 일반 메시지)
        String contentType = chatVO.getTmContentType(); // TEXT, IMG, APPOINTMENT
        String status = chatVO.getTmStatus();          // REQUEST, R, C ...

        try {
            if ("APPOINTMENT".equals(contentType)) {
                // 약속 메시지
                if ("REQUEST".equals(status)) {
                    // 약속 잡기
                    RoomVO room = new RoomVO();
                    room.setChatId(chatVO.getTmChatId());
                    room.setTmMeetDate(chatVO.getTmMeetDate()); // "YYYY-MM-DD HH:mm"
                    room.setTmMeetPlace(chatVO.getTmMeetPlace());
                    chatService.makeAppointment(room, chatVO);

                } else if ("R".equals(status)) {
                    // 약속 확인
                    RoomVO room = new RoomVO();
                    room.setChatId(chatVO.getTmChatId());
                    chatService.confirmAppointment(room, chatVO);
                    
                } else if ("C".equals(status)) {
                    // 거래 완료
                    RoomVO room = new RoomVO();
                    room.setChatId(chatVO.getTmChatId());
                    chatService.completeAppointment(room, chatVO);

                } else {
                    // 그 외 상태(추가로 REJECT 등)
                    chatService.insertChatContent(chatVO);
                }

            } else {
                // 일반 메시지 (TEXT, IMG)
                chatService.insertChatContent(chatVO);
                pushService.sendList(chatVO);
            }
        } catch (Exception e) {
            System.out.println("메시지 처리 중 오류 발생: " + e.getMessage());
        }

        return chatVO; // 최종적으로 /subscribe/chat/{chatId} 로 방송
    }

    /**
     * 특정 상품(prodId)에 대한 채팅 리스트 조회
     * - sample: /tradeChatList?prodId=123
     */
    @GetMapping("/tradeChatList")
    public String chatList(@RequestParam("prodId") int prodId, Model model) {
        List<ChatListVO> chatList = chatService.getChatListByProductId(prodId);
        model.addAttribute("chatList", chatList);
        return "purchase/tradeChatList"; 
    }

    /**
     * 후기 작성
     */
    @PostMapping("/review/write")
    @ResponseBody
    public Map<String, Object> writeReviewAjax(@RequestBody ReviewVO reviewVO) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 실제 tmStatus='C' 확인 로직 (생략)
            chatService.writeReview(reviewVO);

            // 성공 시
            result.put("success", true);
            result.put("message", "후기가 등록되었습니다.");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "후기 등록 실패: " + e.getMessage());
        }
        return result;  // JSON 형태로 반환
    }

    /** 
     * 이미 작성된 후기 보기 AJAX (상품+작성자 or 상품+대상 등으로 조회)
     */
    @GetMapping("/review/detail")
    @ResponseBody
    public Map<String, Object> getReviewDetail(ReviewVO reviewVO){
        Map<String, Object> result = new HashMap<>();
        try {
            ReviewVO review = chatService.getReview(reviewVO); 
            if(review != null){
                result.put("success", true);
                result.put("review", review);
            } else {
                result.put("success", false);
                result.put("message", "후기를 찾을 수 없습니다.");
            }
        } catch(Exception e){
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }
}