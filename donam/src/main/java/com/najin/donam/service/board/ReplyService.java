package com.najin.donam.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.najin.donam.model.board.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(Integer bno);
	public int count(int bno);
	public void create(ReplyDTO dto);
	public void update(ReplyDTO dto);
	public void delete(int rno);
	public ReplyDTO detail(int rno);
}
