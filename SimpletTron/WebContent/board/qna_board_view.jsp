<%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
    String type = (String)request.getAttribute("type");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MVC 게시판</title>
	<link href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
	<style>
        html {
            font-family: 'Spoqa Han Sans', sans-serif;
            font-size: 16px;
        }
            body {
            background-color: #bdc3c7;
        }

        a {
            text-decoration: none;
            color: black;
        }

        h1,
        h2 {
            text-align: center;
            margin-bottom: 5px;
        }

        h1,
        h2,
        p {
            margin: 0
        }

        button {
            margin-top: 10px;
            margin-right: 15px;
            padding: 3px 20px;
            font-size: 13px;


            background-color: #1abc9c;
            border: none;
            border-radius: 5px;
            cursor: pointer;

            transition: all 1s;
        }

        button:hover {
            background-color: #16a085;
        }

        #articleForm {
            width: 500px;
            margin: auto;
        }

        #basicInfoArea {
            margin-top: 10px;
            
            text-align: center;
            background-color: #ecf0f1;

            border-radius: 10px;
        }

        #articleContentArea {
            margin-top: 10px;
            padding: 10px;

            background-color: #ecf0f1;
            border-radius: 10px;
        }

        #commandList {
            margin: auto;
            width: 500px;
            text-align: center;
        }
    </style>
</head>

<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			<h2><%=article.getBOARD_SUBJECT()%></h2>
			<p>첨부파일 :
			<%if(!(article.getBOARD_FILE()==null)){ %>
			<a href="file_down?downFile=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE() %>
			</a>
			<%} %></p>
		</section>
		<section id="articleContentArea">
			<pre><%=article.getBOARD_CONTENT() %></pre>
		</section>
	</section>
	<section id="commandList">
		<a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>&type=<%=type%>">
			<button>답변</button> </a> 
		<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>&type=<%=type%>">
			<button>수정</button> </a> 
		<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>&type=<%=type%>">
			<button>삭제</button></a> 
		<a href="boardList.bo?page=<%=nowPage%>&type=<%=type%>"><button>목록</button></a>&nbsp;&nbsp;
	</section>
</body>
</html>