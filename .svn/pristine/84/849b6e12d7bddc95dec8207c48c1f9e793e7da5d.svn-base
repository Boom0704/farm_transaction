package com.future.blue.purchase.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.future.blue.purchase.dao.IChatDAO;
import com.future.blue.purchase.vo.ChatVO;
import com.future.blue.purchase.vo.RoomVO;

@Service
public class ChatService {

    @Autowired
    IChatDAO dao;
    
   // 기존 채팅방 조회
    public String checkChat(RoomVO room) {
    	  return dao.findChatRoom(room);
    }
    // 기존 채팅방을 찾거나, 새 채팅방을 생성
    public String getOrCreateChatRoom(RoomVO room) {
    	 dao.createRoom(room);
        return room.getChatId();  // 새 채팅방 생성
    }

    // 채팅 내용 저장
    public void insertChatContent(ChatVO vo) {
        dao.insertChat(vo);  // DAO의 insertChat 호출
    }
    
    // 채팅 내용 이미지 저장
    public String insertChatImage(ChatVO vo, String upload, String webPath, MultipartFile file ) throws Exception {
    	
    	// 파일명 생성
		String origin = file.getOriginalFilename();
		String uniqe = UUID.randomUUID().toString() + "_" + origin;
		String dbPath = webPath + uniqe;
		Path filePath = Paths.get(upload, uniqe); 
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dbPath;
		
    }
    // 특정 채팅방의 대화 내용 조회
    public ArrayList<ChatVO> getChatList(String chatId) {
        return dao.getChatList(chatId);  // DAO에서 채팅 기록 조회
    }

    // 전체 채팅방 리스트 조회
    public ArrayList<RoomVO> getRoomList() {
        return dao.getRoomList();  // DAO에서 전체 채팅방 리스트 조회
    }
    // 특정 채팅방의 상세 정보 조회
    public RoomVO getRoomDetails(String chatId) {
        return dao.getRoomDetails(chatId);  // DAO에서 특정 채팅방 정보 조회
    }

    // 채팅 내용을 시간 차이에 맞게 표시
    public String getTimeAgo(long chatTimeMillis) {
        long currentTime = System.currentTimeMillis();
        long diffMillis = currentTime - chatTimeMillis;

        long diffMinutes = diffMillis / (60 * 1000); // 분 단위
        long diffHours = diffMillis / (60 * 60 * 1000); // 시간 단위

        if (diffMinutes < 5) {
            return "방금 전";
        } else if (diffMinutes < 60) {
            return diffMinutes + "분 전";
        } else if (diffHours < 24) {
            return diffHours + "시간 전";
        } else {
            return "하루 이상";
        }
    }
}
