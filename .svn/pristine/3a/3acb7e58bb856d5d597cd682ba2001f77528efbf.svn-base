// 게시판 컨트롤러
// 클라이언트 요청을 처리

package com.future.blue.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.future.blue.board.service.BoardService;
import com.future.blue.board.vo.BoardCommentVO;
import com.future.blue.board.vo.BoardLikeVO;
import com.future.blue.board.vo.BoardVO;


@Controller
@RequestMapping("/board")
//@RequestMapping("/board/list") -> 세부 URL 중복되서 수정.
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 게시글 목록 조회
    @GetMapping("/list")
    public String getBoardList(Model model) {
        List<BoardVO> boardList = boardService.getBoardList();
        model.addAttribute("boardList", boardList);
        return "/views/board/free/list";
    }

    // 게시글 상세 조회
    @GetMapping("/detail/{boardId}")
    public String getBoardDetail(@PathVariable int boardId, Model model) {
        BoardVO board = boardService.getBoardDetail(boardId);
        model.addAttribute("board", board);
        return "/views/board/free/detail";
    }

    // 게시글 작성 페이지
    @GetMapping("/create")
    public String createBoardForm() {
        return "/views/board/free/create";
    }

    // 게시글 작성 처리
    @PostMapping("/create")
    public String createBoard(BoardVO board) {
        boardService.createBoard(board);
        return "redirect:/board/free/list";
    }

    // 게시글 수정 페이지
    @GetMapping("/edit/{boardId}")
    public String editBoardForm(@PathVariable int boardId, Model model) {
        BoardVO board = boardService.getBoardDetail(boardId);
        model.addAttribute("board", board);
        return "/views/board/free/edit";
    }

    // 게시글 수정 처리
    @PostMapping("/edit")
    public String editBoard(BoardVO board) {
        boardService.updateBoard(board);
        return "redirect:/board/free/detail/" + board.getBoardId();
    }

    // 게시글 삭제
    @GetMapping("/delete/{boardId}")
    public String deleteBoard(@PathVariable int boardId) {
        boardService.deleteBoard(boardId);
        return "redirect:/board/free/list";
    }
    
    // 댓글 작성
    @PostMapping("/comment/add")
    public String addComment(@RequestParam int boardId, @RequestParam String content) {
        BoardCommentVO comment = new BoardCommentVO();
        comment.setBoardId(boardId);
        comment.setCommentContent(content);
        boardService.addComment(comment);
        return "redirect:/board/free/detail/" + boardId;
    }

    // 좋아요 추가
    @PostMapping("/like/add")
    public String addLike(@RequestParam int boardId, @RequestParam String memId) {
        BoardLikeVO like = new BoardLikeVO();
        like.setBoardId(boardId);
        like.setLikeMemId(memId);
        boardService.addLike(like);
        return "redirect:/board/free/detail/" + boardId;
    }

    // 좋아요 제거
    @PostMapping("/like/remove")
    public String removeLike(@RequestParam int boardId, @RequestParam String memId) {
        BoardLikeVO like = new BoardLikeVO();
        like.setBoardId(boardId);
        like.setLikeMemId(memId);
        boardService.removeLike(like);
        return "redirect:/board/free/detail/" + boardId;
    }
}
