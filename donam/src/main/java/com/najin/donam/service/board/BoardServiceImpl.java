package com.najin.donam.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.najin.donam.model.board.dao.BoardDAO;
import com.najin.donam.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;
	
	//게시판 리스트 출력
	@Override
	public List<BoardDTO> list(int start, int end, String search_option, String keyword) throws Exception {
		return boardDao.list(start, end, search_option, keyword);
	}
	
	//게시글 작성
	@Override
	public void insert(BoardDTO boardDto) throws Exception {
		boardDao.insert(boardDto);
	}
	
	//게시글 읽기
	@Override
	public BoardDTO read(int bno) throws Exception {
		return boardDao.read(bno);
	}
	
	//게시글 수정
	@Override
	public void update(BoardDTO boardDto) throws Exception {
		boardDao.update(boardDto);
	}
	
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}
	
	//전체 레코드 갯수 계산
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return boardDao.countArticle(search_option, keyword);
	}
	
	//조회수 증가 처리
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		boardDao.increaseViewcnt(bno);
	}
	
	//홈화면 상위 게시물 표시
	@Override
	public List<BoardDTO> top_list() throws Exception {
		return boardDao.top_list();
	}
	
	//홈화면 조회수 많은 게시물 표시
	@Override
	public List<BoardDTO> best_list() throws Exception {
		return boardDao.best_list();
	}

}
