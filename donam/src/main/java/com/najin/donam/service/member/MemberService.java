package com.najin.donam.service.member;

import javax.servlet.http.HttpSession;

import com.najin.donam.model.member.dto.MemberDTO;

public interface MemberService {
	public void registerMember(MemberDTO memberDto); //회원가입
	public MemberDTO loginCheck(MemberDTO memberDto, HttpSession session); //로그인
	public MemberDTO reg_idCheck(String user_id); //회원가입시 아이디 중복여부확인
	public MemberDTO reg_niknameCheck(String user_nikname); //회원가입시 닉네임 중복여부확인
	public void logout(HttpSession session); //로그아웃
	public void user_update(MemberDTO memberDto); //회원정보수정
}
