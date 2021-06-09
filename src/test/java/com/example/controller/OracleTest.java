package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.mapper.MysqlMapper;
import com.example.mapper_oracle.BoardMapper;
import com.example.mapper_oracle.OracleMapper;
import com.example.mapper_oracle.ReplyMapper;



@RunWith(SpringJUnit4ClassRunner.class) 
//먼저 SpringJUnit4ClassRunner.class import한다. 

@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OracleTest {
	 @Autowired
	 private ReplyMapper mapper;
	 
	 
	 @Test
	 public void list() {
		 Criteria cri=new Criteria();	
		 mapper.list(144,cri);
	 }
}
