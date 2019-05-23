package com.najin.donam.model.board.dao;

import java.util.List;

import com.najin.donam.model.board.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> list(int start, int end, String search_option, String keyword) throws Exception; //게시판 리스트 출력
	public void insert(BoardDTO boardDto) throws Exception; //게시글 작성
	public BoardDTO read(int bno) throws Exception; //게시글 읽기
	public void update(BoardDTO boardDto) throws Exception; //게시글 수정
	public void delete(int bno) throws Exception; //게시글 삭제
	public int countArticle(String search_option, String keyword) throws Exception; //전체 레코드 갯수 계산
	public void increaseViewcnt(int bno) throws Exception; //조회수 증가 처리
	public List<BoardDTO> top_list() throws Exception; //홈화면 상위 게시물 표시
	public List<BoardDTO> best_list() throws Exception; //홈화면 조회수 많은 순으로 표시
}
