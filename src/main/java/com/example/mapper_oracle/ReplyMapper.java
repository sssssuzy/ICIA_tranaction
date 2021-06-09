package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> list(@Param("bno") int bno,@Param("cri") Criteria cri); //댓글은 bno를 받아야함
	public int totalCount(int bno);
	public void insert(ReplyVO vo);
	public void delete(int bno);
	public ReplyVO read(int rno);
}
