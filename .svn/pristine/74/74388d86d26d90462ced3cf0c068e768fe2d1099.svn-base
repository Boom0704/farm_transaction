// 게시판 댓글 관련 데이터 저장

package com.future.blue.board.vo;

import java.sql.Timestamp;

public class BoardCommentVO {
    private int commentId;           // 댓글 ID
    private int boardId;             // 게시글 ID
    private String commentContent;   // 댓글 내용
    private Timestamp createDt;      // 작성일
    private Timestamp updateDt;      // 수정일
    private Integer parentCommentId; // 부모 댓글 ID(대댓글)
    private String useYn;            // 사용 여부

    
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

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Timestamp getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Timestamp createDt) {
        this.createDt = createDt;
    }

    public Timestamp getUpdateDt() {
        return updateDt;
    }

    public void setUpdateDt(Timestamp updateDt) {
        this.updateDt = updateDt;
    }

    public Integer getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(Integer parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    
    // 부모 댓글 여부 확인 메서드
    public boolean isParentComment() {
        return parentCommentId == null; // null이면 부모 댓글
    }

}
