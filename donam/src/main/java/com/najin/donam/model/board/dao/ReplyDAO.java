package com.najin.donam.model.board.dao;

import java.util.List;

import com.najin.donam.model.board.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(Integer bno);
	public int count(int bno);
	public void create(ReplyDTO dto);
	public void update(ReplyDTO dto);
	public void delete(int rno);
	public ReplyDTO detail(int rno);
}
