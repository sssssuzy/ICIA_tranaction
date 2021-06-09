<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
</head>
<body>
	<h1>게시판 목록</h1>
	<div>게시글 수 : ${pm.totalCount}</div>
	<table>
			<td>NO</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>VIEW</td>
		<c:forEach items="${list}" var="vo">
		<tr onClick="location.href='read?bno=${vo.bno}'">
			<td>${vo.bno}</td>
			<td>${vo.title}(댓글 : ${vo.replyCnt})</td>
			<td>${vo.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${vo.regdate}"/></td>
			<td>${vo.viewCnt}</td>
		</tr>
		</c:forEach>
	</table>
	<div id="pagination">
		<c:if test="${pm.prev}">
			<a href="list?page=${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${i==cri.page}">
				<a href="list?page=${i}" class="active">${i}</a>
			</c:if>
			<c:if test="${i!=cri.page}">
				<a href="list?page=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="list?page=${pm.endPage+1}">▶</a>
		</c:if>
	</div>
</body>
</html>