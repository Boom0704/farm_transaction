/**
 * DAO, DTO 차이
 * DAO → 데이터베이스 데이터 처리. (상호작용)
 * DTO → 데이터를 클라이언트나 다른 계층으로 전달함. (데이터 전송) **/

package com.future.blue.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// VO 클래스 임포트
import com.future.blue.board.vo.BoardCommentVO;
import com.future.blue.board.vo.BoardFileVO;
import com.future.blue.board.vo.BoardLikeVO;
import com.future.blue.board.vo.BoardVO;


@Mapper
public interface BoardDAO {

	// 기존 기능들
    List<BoardVO> getBoardList();                  // 게시글 목록 조회
    BoardVO getBoardDetail(int boardId);           // 게시글 상세 조회
    int createBoard(BoardVO board);                // 게시글 작성
    int updateBoard(BoardVO board);                // 게시글 수정
    int deleteBoard(int boardId);                  // 게시글 삭제
    int increaseBoardHit(int boardId);             // 조회수 증가

    // New 기능: 파일 처리
    int addBoardFile(BoardFileVO file);            // 파일 추가
    List<BoardFileVO> getBoardFiles(int boardId);  // 게시글의 파일 목록 조회

    // New 기능: 댓글 처리
    int addComment(BoardCommentVO comment);        // 댓글 작성
    List<BoardCommentVO> getComments(int boardId); // 댓글 목록 조회
    int deleteComment(int commentId);              // 댓글 삭제

    // New 기능: 좋아요 처리
    int addLike(BoardLikeVO like);                 // 좋아요 추가
    int removeLike(BoardLikeVO like);              // 좋아요 제거
    int getLikeCount(int boardId);                 // 좋아요 개수 조회
}
