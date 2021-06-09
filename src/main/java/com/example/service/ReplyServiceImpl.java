package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BoardVO;
import com.example.domain.ReplyVO;
import com.example.mapper_oracle.BoardMapper;
import com.example.mapper_oracle.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	BoardMapper bMapper;
	@Autowired
	ReplyMapper rMapper;
	
	
	@Override
	public void insert(ReplyVO vo) {
		rMapper.insert(vo);
		bMapper.updateReply(vo.getBno(), 1);
		
	}

	@Override
	public void delete(int rno) {		
		ReplyVO vo = rMapper.read(rno);
		bMapper.updateReply(vo.getBno(), -1);
		rMapper.delete(rno);
	}

}
