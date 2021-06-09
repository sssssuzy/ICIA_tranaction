package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper_oracle.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper mapper;
	
	@Transactional
	@Override
	public BoardVO read(int bno) {
		BoardVO vo = mapper.read(bno);
		mapper.updateView(bno);
		return vo;
	}

}
