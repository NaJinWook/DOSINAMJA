package com.najin.donam.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.najin.donam.model.board.dto.BoardDTO;
import com.najin.donam.model.member.dto.MemberDTO;
import com.najin.donam.service.board.BoardService;
import com.najin.donam.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@Inject
	BoardService boardService;
	
	//홈화면 게시글 표시
	@RequestMapping(value="home")
	public ModelAndView home() throws Exception {
		List<BoardDTO> list = boardService.top_list();
		List<BoardDTO> best_list = boardService.best_list();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/home");
		mav.addObject("list", list);
		mav.addObject("best_list", best_list);
		return mav;
	}
	
	//회원가입창 이동
	@RequestMapping(value = "register")
	public String register() throws Exception {
		return "member/register";
	}
	
	//회원가입 완료
	@RequestMapping(value = "rgcommit")
	public String register_commit(MemberDTO memberDto) throws Exception {
		memberService.registerMember(memberDto);
		return "member/register_commit";
	}
	
	//로그인
	@RequestMapping(value = "login_check", method = RequestMethod.POST)
	public ModelAndView login_check(MemberDTO memberDto, HttpSession session) throws Exception{
		MemberDTO login = memberService.loginCheck(memberDto, session);
		List<BoardDTO> list = boardService.top_list();
		List<BoardDTO> best_list = boardService.best_list();
		ModelAndView mav = new ModelAndView();
		if(login != null) {
			mav.setViewName("member/home");
			mav.addObject("member", login);
			mav.addObject("list", list);
			mav.addObject("best_list", best_list);
		} else {
			mav.setViewName("member/home");
			mav.addObject("message", "error");
			mav.addObject("list", list);
			mav.addObject("best_list", best_list);
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		memberService.logout(session); //세션 초기화
		List<BoardDTO> list = boardService.top_list();
		List<BoardDTO> best_list = boardService.best_list();
		mav.setViewName("member/home"); //이동할 페이지 이름
		mav.addObject("list", list);
		mav.addObject("best_list", best_list);
		return mav; //페이지 이동
	}
	
	//회원가입시 아이디 중복여부확인
	@ResponseBody
	@RequestMapping(value = "reg_id_check", method = RequestMethod.POST)
	public int reg_id_check(HttpServletRequest request) throws Exception {
		String user_id = request.getParameter("user_id");
		MemberDTO id_check = memberService.reg_idCheck(user_id);
		int result = 0;
		if(id_check != null) {
			result = 1;
		}
		return result;
	}
	
	//회원가입시 닉네임 중복여부확인
	@ResponseBody
	@RequestMapping(value = "reg_nikname_check", method = RequestMethod.POST)
	public int reg_nikname_check(HttpServletRequest request) throws Exception {
		String user_nikname = request.getParameter("user_nikname");
		MemberDTO nikname_check = memberService.reg_niknameCheck(user_nikname);
		int result = 0;
		if(nikname_check != null) {
			result = 1;
		}
		return result;
	}
	
	//회원 정보 불러오기(내 정보)
	@RequestMapping(value = "user_info", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_info() throws Exception {
		return "member/mypage";
	}
	
	//회원 정보 업데이트
	@RequestMapping(value = "user_update", method = RequestMethod.POST)
	public String user_update(HttpSession session, MemberDTO memberDto) throws Exception {
		memberService.user_update(memberDto);
		session.invalidate();
		return "redirect:/";
	}
}
