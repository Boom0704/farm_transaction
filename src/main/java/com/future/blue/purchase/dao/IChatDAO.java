package com.future.blue.purchase.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.future.blue.purchase.vo.ChatVO;
import com.future.blue.purchase.vo.RoomVO;

@Mapper
public interface IChatDAO {
    //채팅방 리스트
    public ArrayList<RoomVO> getRoomList();
    
    //채팅방 생성
    public int createRoom(RoomVO roomVO);
    
    //대화 기록 (chatId를 String 타입으로 변경)
    public ArrayList<ChatVO> getChatList(String chatId);  // 변경: int -> String
    
    //대화 저장
    public int insertChat(ChatVO vo);
    
    // 기존 채팅방 조회
    public String findChatRoom(RoomVO room);
    
    // 새로운 채팅방 생성
    public int createChatRoom(RoomVO roomVO);
    
    // 특정 채팅방의 상세 정보 조회
    public RoomVO getRoomDetails(String chatId);

    }

