package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.BoardMapper;
import com.example.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
	@RequestMapping("list")
	public String list(Model model,Criteria cri){		
		 PageMaker pm=new PageMaker();
	      pm.setCri(cri);
	      pm.setTotalCount(mapper.totalCount());
	      
	      model.addAttribute("pm", pm);
	      model.addAttribute("cri", cri);
	      model.addAttribute("list", mapper.list(cri));
	      return "list";
	}
	
	@RequestMapping("read")
	public String read(Model model,int bno){
		model.addAttribute("vo",service.read(bno));
		return "read";
		
	}
	
	
}
