package com.najin.donam.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.najin.donam.model.board.dto.BoardDTO;
import com.najin.donam.service.board.BoardService;
import com.najin.donam.service.board.Pager;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	//미구현 게시판 점검페이지 표시
	@RequestMapping("checking")
	public String register() throws Exception {
		return "board/default";
	}
	
	//게시판 글쓰기창 이동
	@RequestMapping("write")
	public String write() throws Exception {
		return "board/write";
	}
	
	//게시판 리스트 출력
	@RequestMapping("list")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword
			) throws Exception {
		int count=boardService.countArticle(search_option, keyword); //레코드 갯수
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<BoardDTO> list = boardService.list(start, end, search_option, keyword); //목록
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list"); //이동할 페이지 지정
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //맵에 자료 저장
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map); //데이터 저장
		return mav; //페이지 이동(출력)
	}
	
	//게시글 추가
	@RequestMapping("insert")
	public String insert(@ModelAttribute BoardDTO boardDto, HttpServletRequest request) throws Exception {
		String writer = (String)request.getParameter("user_nikname");
		boardDto.setWriter(writer);
		boardService.insert(boardDto);
		return "redirect:/board/list";
	}
	
	//게시글 상세보기 (조회수 증가처리)
	@RequestMapping(value="read", method=RequestMethod.GET)
	public ModelAndView read(@RequestParam int bno,
			@RequestParam int curPage,
			@RequestParam String search_option,
			@RequestParam String keyword,
			HttpSession session) throws Exception {
		boardService.increaseViewcnt(bno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/read");
		mav.addObject("dto", boardService.read(bno));
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
	}
	
	//게시글 수정창이동
	@RequestMapping(value="edit")
	public ModelAndView edit(int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/edit");
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}
	
	//게시글 업데이트
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(BoardDTO boardDto) throws Exception {
		boardService.update(boardDto);
		return "redirect:/board/list";
	}
	
	//게시글 삭제
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String delete(int bno) throws Exception {
		boardService.delete(bno);
		return "redirect:/board/list";
	}
}
