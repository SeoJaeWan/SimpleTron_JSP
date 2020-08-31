<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
    String nowPage = (String)request.getAttribute("page");
    String type = (String)request.getAttribute("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>MVC 게시판</title>
<style>

	#passForm{
		width:400px;
		margin:auto;
		border : 1px solid orange;
	}
	
</style>
</head>
<body>
<section id = "passForm">
<form name="deleteForm" action="boardDeletePro.bo?board_num=<%=board_num %>" 
	method="post">
<input type = "hidden" name = "page" value = "<%=nowPage %>"/>
<table>
<tr>
	<td>
		<label>글 비밀번호 : </label>
	</td>
	<td>
		<input name="BOARD_PASS" type="password">
	</td>
</tr>
<tr>
	<td>
	<button type="submit" value = "<%=type%>" name = "type">삭제</button>
		&nbsp;&nbsp;
		<input type = "button" value = "돌아가기" onClick ="javascript:history.go(-1)"/>
	</td>
</tr>
</table>
</form>
</section>
</body>
</html>