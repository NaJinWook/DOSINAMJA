package com.najin.donam.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.najin.donam.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	//회원가입
	@Override
	public void registerMember(MemberDTO memberDto) {
		sqlSession.insert("member.register", memberDto);
	}
	
	//로그인
	@Override
	public MemberDTO loginCheck(MemberDTO memberDto) {
		return sqlSession.selectOne("member.login_check", memberDto);
	}
	
	//회원가입시 아이디 중복여부확인
	@Override
	public MemberDTO reg_idCheck(String user_id) {
		return sqlSession.selectOne("member.reg_id_check", user_id);
	}
	
	//회원가입시 닉네임 중복여부확인
	@Override
	public MemberDTO reg_niknameCheck(String user_nikname) {
		return sqlSession.selectOne("member.reg_nikname_check", user_nikname);
	}
	
	//회원정보수정
	@Override
	public void user_update(MemberDTO memberDto) {
		sqlSession.update("member.user_update", memberDto);
	}
}
