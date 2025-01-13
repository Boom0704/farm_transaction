// 게시판 좋아요 관련 데이터 저장

package com.future.blue.board.vo;

import java.util.Date;

public class BoardLikeVO {
    private int likeId;           // 좋아요 넘버
    private int boardId;          // 게시판 넘버
    private String likeMemId;     // 좋아요 클릭한 회원 ID
    private int commentId;        // 댓글 넘버
    private Date createDt;        // 생성일
    private String useYn;         // 사용 여부

    
    /** Getters / Setters 메소드
     *  메소드를 통해 데이터 접근 유도.
     *  오브젝트 내의 함수들을 괄호없이 쓸 수 있게 만들어 줌.
     *  결론: 데이터의 무결성 보존을 위해 사용.
     *  get: 데이터 가져옴 / set: 데이터 입력, 수정
     *  ** 규칙 **
     *  get: 파라미터 x, 함수 내에 return
     *  set: 파라미터 존재
     * **/
    public int getLikeId() {
        return likeId;
    }

    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public String getLikeMemId() {
        return likeMemId;
    }

    public void setLikeMemId(String likeMemId) {
        this.likeMemId = likeMemId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public Date getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    
    // commentId -> 댓글 좋아요인지 게시글 좋아요인지 구분
    // 댓글 좋아요 여부 확인
    public boolean isCommentLike() {
        return commentId > 0; // 0보다 크면 댓글 좋아요
    }

    // 게시글 좋아요 여부 확인
    public boolean isBoardLike() {
        return commentId == 0; // 0이면 게시글 좋아요
    }

}
