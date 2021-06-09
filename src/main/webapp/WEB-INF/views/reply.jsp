<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
<title>댓글 목록</title>
</head>
<body>
	<h2>댓글목록</h2>
	<div>
		<input type="text" size=50 class="keyword" id="txtReply">
		<input type="button" id="btnInsert" class="btnStyle" value="등록">
		<span>댓글 수 : <span id="totalCount"></span>건</span>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<tr class="row">
			<td>{{rno}}</td>
			<td>{{reply}}</td>
			<td>{{replyDate}}</td>
			<td><button class="btnDelete" rno={{rno}}>삭제</button></td>
		</tr>
		{{/each}}
	</script>
	<div id="pagination"></div>
</body>
<script>
	var bno=${vo.bno};
	var page=1;
	getList();
	
	$("#tbl").on("click",".row .btnDelete", function(){
		var rno=$(this).attr("rno");
		if(!confirm(rno + "을(를) 댓글을 삭제하시겠어요?")) return;
		$.ajax({
			type:"get",
			url:"/reply/delete",
			data:{"rno":rno},
			success:function(){
				alert("삭제완료!");
				getList();
			}
		});
	});
	
	$("#txtReply").on("keydown",function(e){
		if(e.keyCode==13) $("#btnInsert").click();
	})
	
	$("#btnInsert").on("click",function(){
		var reply=$("#txtReply").val();
		if(reply==""){
			alert("내용을 입력하세요!");
			return;
		}
		$.ajax({
			type:"post",
			url:"/reply/insert",
			data:{"bno":bno,"reply":reply},
			success:function(){
				alert("댓글 등록 완료");
				$("#txtReply").val("");
				getList();
			}
		});			
	});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"reply.json",
			data:{"bno":bno,"page":page},
			dataType:"json",
			success:function(data){
				  var temp=Handlebars.compile($("#temp").html());
			       $("#tbl").html(temp(data));
			       $("#totalCount").html(data.pm.totalCount);
			       var str="";
			       if(data.pm.prev){
			    	   str += "<a href='" + (data.pm.startPage-1) + "'>◀</a>  ";
			       }
			       for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
			    	   if(i==page){
			    		   str += "<a href='" + i + "' class='active'>" + i + "</a>  ";
			    	   }else{
			    		   str += "<a href='" + i + "'>" + i + "</a>  ";
			    	   }
			    	   
			       }
			       if(data.pm.next){
			    	   str += "<a href='" + (data.pm.endPage+1) + "'>▶</a>  ";
			       }
			       $("#pagination").html(str);
			}
		});
	}
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
</script>
</html>