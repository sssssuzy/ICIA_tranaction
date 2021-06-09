package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper_oracle.ReplyMapper;
import com.example.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	ReplyService service;
	
	@RequestMapping("reply.json")
	@ResponseBody
	public HashMap<String,Object> list(int bno,Criteria cri){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(bno));
		map.put("list", mapper.list(bno, cri));
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping("reply")
	public String reply(){
		return "reply";
	}
	
	@RequestMapping(value="reply/insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(ReplyVO vo){
		service.insert(vo);
	}
	
	@RequestMapping("reply/delete")
	@ResponseBody
	public void delete(int rno){
		service.delete(rno);
	}
}








