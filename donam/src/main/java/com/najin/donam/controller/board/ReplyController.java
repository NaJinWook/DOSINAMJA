package com.najin.donam.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.najin.donam.model.board.dto.ReplyDTO;
import com.najin.donam.service.board.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	//리플등록
	@RequestMapping("insert")
	public void insert(ReplyDTO dto, HttpServletRequest request) throws Exception {
		String user_nikname = (String)request.getParameter("user_nikname");
		dto.setReply_user(user_nikname);
		replyService.create(dto);
	}
	
	//리플 리스트
	@RequestMapping("list")
	public ModelAndView list(int bno, ModelAndView mav) throws Exception {
		List<ReplyDTO> list = replyService.list(bno);
		mav.setViewName("board/reply_list");
		mav.addObject("list", list);
		return mav;
	}
	
	//게시글 삭제
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String delete(int rno) throws Exception {
		replyService.delete(rno);
		return "DELETE COMPLETE";
	}
}
