package com.future.blue.sell.vo;

import lombok.Data;

@Data
public class SellVO {
	
	private int sellId; //아이디
	private String sellTitle; //제목
	private String sellContents; //내용
	private String memId; //유저아이디 + 판매한 사람 아이디가 필요함
	private int sellPrice; //가격
	private String sellYn; //판매여부 -> chatroom 에서 만약 거완이 되면 이것도 변경해야함
	private String reservedYn; //예약 -> 만약 종속된 chatroom이 예약이 되면 나머지도 변경하거나 알려줘야하기 때문에 이것도 변경하고 마찬가지로 여기 종속된 다른 chatroom도 변경해야함
	private String sellRegion; //지역
	private String imagePath; //이미지
	private String sellCategory; //카테고리
	private String memNic; //닉네임 
	private String memReliability;
	private String createDt; //Date가 맞지 않나? 모름
	private String updateDt; //Date가 맞지 않나? 모름
	
}
