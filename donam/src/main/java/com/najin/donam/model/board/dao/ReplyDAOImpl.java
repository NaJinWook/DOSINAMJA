package com.najin.donam.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.najin.donam.model.board.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession sqlSession;
	
	//댓글 리스트 출력
	@Override
	public List<ReplyDTO> list(Integer bno) {
		return sqlSession.selectList("reply.list", bno);
	}
	
	//댓글 갯수 조회
	@Override
	public int count(int bno) {
		return sqlSession.selectOne("reply.count", bno);
	}
	
	//댓글 등록
	@Override
	public void create(ReplyDTO dto) {
		sqlSession.insert("reply.insert", dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply.delete", rno);
	}

	@Override
	public ReplyDTO detail(int rno) {
		// TODO Auto-generated method stub
		return null;
	}

}
