package com.najin.donam.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.najin.donam.model.board.dao.ReplyDAO;
import com.najin.donam.model.board.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDao;
	
	@Override
	public List<ReplyDTO> list(Integer bno) {
		return replyDao.list(bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReplyDTO dto) {
		replyDao.create(dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rno) {
		replyDao.delete(rno);
	}

	@Override
	public ReplyDTO detail(int rno) {
		// TODO Auto-generated method stub
		return null;
	}

}
