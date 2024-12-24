package com.future.blue.purchase.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.blue.purchase.service.ChatService;
import com.future.blue.purchase.vo.ChatVO;
import com.future.blue.purchase.vo.RoomVO;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@RequestMapping("/chat")
	public String chatView(Model model, RoomVO room) {
		if (room.getChatSeller() != null && room.getChatBuyer() != null && room.getChatProdId() != null) { // getProId 에서 getChatProdId 이걸로 바꿈
			String chatId = chatService.checkChat(room);
			System.out.println(chatId);
			if (chatId == null) {
				chatId = chatService.getOrCreateChatRoom(room); // 새로운 채팅방 생성
				ArrayList<ChatVO> chatList = chatService.getChatList(chatId); // 생성된 채팅방의 대화 내용 조회
				model.addAttribute("chatId", chatId);
				model.addAttribute("chatList", chatList);
			} else {
				ArrayList<ChatVO> chatList = chatService.getChatList(chatId); // 채팅 내용 조회
				model.addAttribute("chatId", chatId);
				model.addAttribute("chatList", chatList);
			}

			// 방정보 가져오기
			RoomVO roomView = chatService.getRoomDetails(chatId);
			System.out.println(roomView);
			model.addAttribute("roomView", roomView);
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

	// 채팅 메시지 전달
	@MessageMapping("/hello/{chatId}")
	@SendTo("/subscribe/chat/{chatId}")
	public ChatVO broadcasting(ChatVO chatVO) {
		System.out.println(chatVO);
		try {
			// 채팅 로그 저장 (서비스를 통해 DB에 저장)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			chatVO.setTmDate(sdf.format(new Date()));
			chatService.insertChatContent(chatVO);
		} catch (Exception e) {
			System.out.println("채팅 메시지 저장 중 오류 발생: " + e.getMessage());
		}
		
		return chatVO; // 클라이언트로 전송
	}
}
