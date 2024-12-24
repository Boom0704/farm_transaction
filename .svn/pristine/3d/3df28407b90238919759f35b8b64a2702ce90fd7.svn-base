// 게시판 관련 데이터 저장

package com.future.blue.board.vo;

import java.sql.Timestamp;
import java.util.Arrays;

    public class BoardVO {
        private int boardId;           // 게시판 넘버
        private String boardCategory;  // 게시판 카테고리
        private String boardWriter;    // 글쓴이
        private String boardTitle;     // 제목
        private String boardPass;      // 비밀번호
        private String boardContents;  // 내용
        private Timestamp createDt;    // 생성일
        private Timestamp updateDt;    // 수정일
        private String memId;          // 회원 ID
        private int boardHit;          // 조회수
        private int boardLike;         // 좋아요수
        private String useYn;          // 사용여부

        
        /** Getters / Setters 메소드
         *  메소드를 통해 데이터 접근 유도.
         *  오브젝트 내의 함수들을 괄호없이 쓸 수 있게 만들어 줌.
         *  결론: 데이터의 무결성 보존을 위해 사용.
         *  get: 데이터 가져옴 / set: 데이터 입력, 수정
         *  ** 규칙 **
         *  get: 파라미터 x, 함수 내에 return
         *  set: 파라미터 존재
         * **/
        public int getBoardId() {             	// getter
            return boardId;
        }

        public void setBoardId(int boardId) { 	// setter
            this.boardId = boardId;
        }

        public void setBoardCategory(String boardCategory) {
            this.boardCategory = boardCategory;
        }
        
        // boardCategory 값이 유효한지 확인. ex)허용된 카테고리만 저장
        // 카테고리 유효성 검사
        public boolean isValidCategory() {
            String[] validCategories = {"free", "crop", "diary"};
            return Arrays.asList(validCategories).contains(boardCategory);
        }


        public String getBoardWriter() {
            return boardWriter;
        }

        public void setBoardWriter(String boardWriter) {
            this.boardWriter = boardWriter;
        }

        public String getBoardTitle() {
            return boardTitle;
        }

        public void setBoardTitle(String boardTitle) {
            this.boardTitle = boardTitle;
        }

        public String getBoardPass() {
            return boardPass;
        }

        public void setBoardPass(String boardPass) {
            this.boardPass = boardPass;
        }

        public String getBoardContents() {
            return boardContents;
        }

        public void setBoardContents(String boardContents) {
            this.boardContents = boardContents;
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

        public String getMemId() {
            return memId;
        }

        public void setMemId(String memId) {
            this.memId = memId;
        }

        public int getBoardHit() {
            return boardHit;
        }

        public void setBoardHit(int boardHit) {
            this.boardHit = boardHit;
        }

        public int getBoardLike() {
            return boardLike;
        }

        public void setBoardLike(int boardLike) {
            this.boardLike = boardLike;
        }

        public String getUseYn() {
            return useYn;
        }

        public void setUseYn(String useYn) {
            this.useYn = useYn;
        }
        
        // 게시글 목록에서 간단한 내용 요약을 보여줌
        // 게시글 내용 요약
        public String getSummary(int length) {
            if (boardContents == null || boardContents.length() <= length) {
                return boardContents; // 내용이 짧으면 그대로 반환
            }
            return boardContents.substring(0, length) + "..."; // 지정 길이만큼 잘라 반환
        }

    }