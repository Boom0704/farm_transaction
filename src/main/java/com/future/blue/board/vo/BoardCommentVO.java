// 게시판 댓글 관련 데이터 저장

package com.future.blue.board.vo;

public class BoardCommentVO {
    private int commentId;           // 댓글 번호
    private int boardId;             // 게시글 번호
    private String memId;			 // 작성자 ID
    private String commentContent;   // 댓글 내용
    private Integer parentCommentId; // 부모 댓글 ID(대댓글)

    
    
    /** Getters / Setters 메소드
     *  메소드를 통해 데이터 접근 유도.
     *  오브젝트 내의 함수들을 괄호없이 쓸 수 있게 만들어 줌.
     *  결론: 데이터의 무결성 보존을 위해 사용.
     *  get: 데이터 가져옴 / set: 데이터 입력, 수정
     *  ** 규칙 **
     *  get: 파라미터 x, 함수 내에 return
     *  set: 파라미터 존재
     * **/
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getBoardId() {
        return boardId;
    }

    public String getmemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }
    
    public void setCommentAuthor(String memId) {
        this.memId = memId;
    }
    
    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }


    public Integer getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(Integer parentCommentId) {
        this.parentCommentId = parentCommentId;
    }
    
    // 부모 댓글 여부 확인 메서드
    public boolean isParentComment() {
        return parentCommentId == null; // null이면 부모 댓글
    }
    
//    @Override
//    public String toString() {
//        return "댓글 번호: " + commentId + ", 내용: " + commentContent + ", 작성자: " + memId + ", 작성일: " + createDt;
//    }



    
}
