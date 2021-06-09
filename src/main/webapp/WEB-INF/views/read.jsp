<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
h1{text-align:center;}
.redRow{color:red;}
.blueRow{color:#364967;}
table {width: 100%; margin-top:10px;text-align:center; margin-bottom:10px; border-top: 1px solid #364967; border-collapse: collapse;}
tr, td {border-bottom: 1px solid #444444; text-align:center; padding: 10px;}
.title {border-bottom: 1px solid #444444; text-align:center; padding: 10px; background:#364967; color:white;}
.btnStyle, button{width: 100px;
              padding: .5em .5em;
              border: 1px solid #364967;
              background: #364967;
              color: white;    
              font-weight:bold;
   	}
.active { font-weight:bold; color:#364967;}
#pagination{text-align:center;}
a{text-decoration:none; color:#364967;font-size:20px;}
a:hover{font-weight:bold;}
.keyword{width: 200px;
  padding: .5em .5em;
  font-weight: 800;
  border: 1px solid #364967;
  background: white;
  color:black;        
}
#divHeader{margin-bottom:10px;}
select { width: 130px;
            padding: .5em .5em;
            border: 1px solid #364967;
            font-family: inherit;
            background: no-repeat 95% 50%;
            border-radius: 0px;
            }               
select::-ms-expand {display: none;}
</style>
<title>게시글 정보</title>
</head>
<body>
	<h1>게시글 정보</h1>
	<div style="float:right"><button onClick="location.href='list'">목록</button></div>
	<br>
	<div>제목 : ${vo.title}</div>
	<div>날짜 : <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${vo.regdate}"/></div>
	<div>작성자 : ${vo.writer}</div>
	<hr/>
	<div>내용 : ${vo.content}</div>
	<hr/>
	<jsp:include page="reply.jsp"/>

	
</body>
</html>