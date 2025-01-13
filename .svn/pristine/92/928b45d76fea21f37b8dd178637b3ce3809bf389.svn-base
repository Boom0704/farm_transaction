// 게시판 파일 관련 데이터 저장

package com.future.blue.board.vo;

import java.util.Date;

public class BoardFileVO {
	
	private int fileId;           // 파일 넘버
    private int boardId;          // 게시글 넘버
    private String filePath;      // 파일 경로
    private String fileName;      // 파일명
    private Date createDt;        // 생성일
    private Date updateDt;        // 수정일
    
    // 공통 상수 선언(유틸리티 클래스에서 관리) / 값이 'Y' or 'N'으로 제한되어 있기 떄문에 상수로 관리.
    /** 유틸리티 클래스란? 
     *  비슷한 기능의 메서드와 상수를 모아서 캡슐화 한 것.
     *  사용 이유는 static method는  따로 객체 만들지 않고 바로 클래스로 메서드 호출 가능
     *  but 오직  static 변수만 접근 가능함
     *  그래서 유틸리티 사용
     * */
    public static final String USE_YES = "Y";
    public static final String USE_NO = "N"; 
    
    
    /** Getters / Setters 메소드
     *  메소드를 통해 데이터 접근 유도.
     *  오브젝트 내의 함수들을 괄호없이 쓸 수 있게 만들어 줌.
     *  결론: 데이터의 무결성 보존을 위해 사용.
     *  get: 데이터 가져옴 / set: 데이터 입력, 수정
     *  ** 규칙 **
     *  get: 파라미터 x, 함수 내에 return
     *  set: 파라미터 존재
     * **/
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }

    public Date getUpdateDt() {
        return updateDt;
    }

    public void setUpdateDt(Date updateDt) {
        this.updateDt = updateDt;
    }
    
    // 유효성 검사: 잘못된 파일 경로가 저장되지 않도록 해줌. 
    // 파일 경로 유효성 검사
    public boolean isValidFilePath() {
        return filePath != null && filePath.matches("^([a-zA-Z]:)?(\\\\[a-zA-Z0-9_-]+)+\\\\?$");
    }

    // 파일명 유효성 검사
    public boolean isValidFileName() {
        return fileName != null && fileName.matches("^[\\w,\\s-]+\\.[A-Za-z]{3,4}$");
    }

	

}
