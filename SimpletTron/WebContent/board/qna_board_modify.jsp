<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String type = (String)request.getAttribute("type");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
    html {
            font-family: 'Spoqa Han Sans', sans-serif;
            font-size: 16px;
        }

        body {
            background-color: #bdc3c7;
        }

        h2 {
            text-align: center;
        }

        table {
            margin: auto;
            width: 50%;

            min-width: 450px;


            border-collapse: separate;
            border-spacing: 0 3px;
        }


        .td_left {
            width: 33%;

            text-align: right;
            padding-right: 10px;
        }


        .td_left label {
            display: block;
        }

        .td_right {
            width: 150px;
        }

        input {
            width: 97%;
            height: 27px;

            max-width: 300px;

            border: none;
            border-radius: 10px;

        }

        textarea {
            width: 98%;
            height: 313px;

            border: none;
            border-radius: 5px;
        }

        #commandCell {
            text-align: center;
        }
        
        a {
            margin-top: 10px;
            margin-right: 15px;
            padding: 3px 20px;
            font-size: 13px;
                  
            background-color: #1abc9c;
            border:none;
            border-radius: 5px;
            cursor: pointer;
            
            transition: all 1s;
            
            text-decoration: none;
            color: black;
        }
        
        a:hover {
            background-color: #16a085;
        }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>게시판글수정</h2>
<form action="boardModifyPro.bo" method="post" name = "modifyform"
>
<input type = "hidden" name = "BOARD_NUM" value = "<%=article.getBOARD_NUM()%>"/>
<table>
	<tr>
		<td class="td_left">
			<label for = "BOARD_NAME">글쓴이</label>
		</td>
		<td class="td_right">
			<input type = "text" name="BOARD_NAME" id = "BOARD_NAME" value = "<%=article.getBOARD_NAME()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "BOARD_PASS">비밀번호</label>
		</td>
		<td class="td_right">
			<input name="BOARD_PASS" type="password" id = "BOARD_PASS"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "BOARD_SUBJECT">제 목</label>
		</td>
		<td class="td_right">
			<input name="BOARD_SUBJECT" type="text" id = "BOARD_SUBJECT" value = "<%=article.getBOARD_SUBJECT()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "BOARD_CONTENT">내 용</label>
		</td>
		<td>
			<textarea id = "BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea>
		</td>
	</tr>
</table>
	<section id = "commandCell">
			<a href="javascript:modifyboard()">수정</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">뒤로</a>
	</section>
	<input style="display:none;" value= <%=type%> name = "type"/>
</form>
</section>
</body>
</html>