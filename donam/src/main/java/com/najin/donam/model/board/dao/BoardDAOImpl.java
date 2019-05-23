package com.najin.donam.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.najin.donam.model.board.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	//게시판 리스트 출력
	@Override
	public List<BoardDTO> list(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectList("board.list", map);
	}
	
	//게시글 작성
	@Override
	public void insert(BoardDTO boardDto) throws Exception {
		sqlSession.insert("board.insert", boardDto);
	}
	
	//게시글 읽기
	@Override
	public BoardDTO read(int bno) throws Exception {
		return sqlSession.selectOne("board.read", bno);
	}
	
	//게시글 수정
	@Override
	public void update(BoardDTO boardDto) throws Exception {
		sqlSession.update("board.update", boardDto);
	}
	
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.update("board.delete", bno);
	}
	
	//전체 레코드 갯수 계산
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countArticle", map);
	}
	
	//조회수 증가 처리
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);
	}
	
	//홈화면 상위 게시물 표시
	@Override
	public List<BoardDTO> top_list() throws Exception {
		return sqlSession.selectList("board.top_list");
	}
	
	//홈화면 조회수 많은 게시물 표시
	@Override
	public List<BoardDTO> best_list() throws Exception {
		return sqlSession.selectList("board.best_list");
	}

}
