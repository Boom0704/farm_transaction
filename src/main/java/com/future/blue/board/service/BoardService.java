// 게시판 비즈니스 로직 

package com.future.blue.board.service;

import java.util.List;

import com.future.blue.board.vo.BoardCommentVO;
import com.future.blue.board.vo.BoardFileVO;
import com.future.blue.board.vo.BoardLikeVO;
//import com.future.blue.board.dto.BoardDTO;
import com.future.blue.board.vo.BoardVO;
import com.future.blue.board.dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;

    // 게시글 목록 조회
    public List<BoardVO> getBoardList() {
        return boardDAO.getBoardList();
    }

    // 게시글 상세 조회
    public BoardVO getBoardDetail(int boardId) {
        boardDAO.increaseBoardHit(boardId); // 조회수 증가
        return boardDAO.getBoardDetail(boardId);
    }

    // 게시글 작성
    public int createBoard(BoardVO board) {
        return boardDAO.createBoard(board);
    }

    // 게시글 수정
    public int updateBoard(BoardVO board) {
        return boardDAO.updateBoard(board);
    }

    // 게시글 삭제
    public int deleteBoard(int boardId) {
        return boardDAO.deleteBoard(boardId);
    }

    // 파일 처리
    public int addBoardFile(BoardFileVO file) {
        return boardDAO.addBoardFile(file);
    }

    public List<BoardFileVO> getBoardFiles(int boardId) {
        return boardDAO.getBoardFiles(boardId);
    }

    // 댓글 처리
    public int addComment(BoardCommentVO comment) {
        return boardDAO.addComment(comment);
    }

    public List<BoardCommentVO> getComments(int boardId) {
        return boardDAO.getComments(boardId);
    }

    public int deleteComment(int commentId) {
        return boardDAO.deleteComment(commentId);
    }

    // 좋아요 처리
    public int addLike(BoardLikeVO like) {
        return boardDAO.addLike(like);
    }

    public int removeLike(BoardLikeVO like) {
        return boardDAO.removeLike(like);
    }

    public int getLikeCount(int boardId) {
        return boardDAO.getLikeCount(boardId);
    }
}
