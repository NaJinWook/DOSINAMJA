package com.najin.donam.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.najin.donam.model.member.dao.MemberDAO;
import com.najin.donam.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;
	
	//회원가입
	@Override
	public void registerMember(MemberDTO memberDto) {
		memberDao.registerMember(memberDto);
	}
	
	//로그인
	@Override
	public MemberDTO loginCheck(MemberDTO memberDto, HttpSession session) {
		MemberDTO login = memberDao.loginCheck(memberDto);
		if(login != null) {
			session.setAttribute("member", login);
		}
		return login;
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션초기화
	}
	
	//회원가입시 아이디 중복여부확인
	@Override
	public MemberDTO reg_idCheck(String user_id) {
		return memberDao.reg_idCheck(user_id);
	}
	
	//회원가입시 닉네임 중복여부확인
	@Override
	public MemberDTO reg_niknameCheck(String user_nikname) {
		return memberDao.reg_niknameCheck(user_nikname);
	}
	
	//회원정보수정
	@Override
	public void user_update(MemberDTO memberDto) {
		memberDao.user_update(memberDto);
	}

}
