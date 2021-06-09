package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);
	public int totalCount();
	public BoardVO read(int bno);
	public void updateReply(@Param("bno") int bno,@Param("amount") int amount);
	public void updateView(int bno);
}
