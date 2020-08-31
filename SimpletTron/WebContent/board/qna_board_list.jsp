<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
    String type = (String)request.getAttribute("type");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
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

        h2 {
            text-align: center;
        }

        table {
            margin: auto;
            width: 50%;
            
            border-collapse: separate;       
            border-spacing: 0 10px;
            
           
        }

        td {
        text-align: center;
            background-color: #ecf0f1;
        }

        .title {
            text-align: left;
        }

        #pageList {
            margin: auto;
            width: 500px;
            text-align: center;
        }

        #emptyArea {
            margin: auto;
            width: 500px;
            text-align: center;
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
</style>
</head>

<body>
	<!-- 게시판 리스트 -->

	<section id="listForm">
		<h2>
			글 목록<a href="boardWriteForm.bo?type=<%=type%>&content=">게시판글쓰기</a>
		</h2>
		<table>
			<%
if(articleList != null && listCount > 0){
%>

			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>

			<%
		for(int i=0;i<articleList.size();i++){
			
	%>
			<tr>
				<td><%=articleList.get(i).getBOARD_NUM()%></td>

				<td class="title">
					<%if(articleList.get(i).getBOARD_RE_LEV()!=0){ %> <%for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>
					&nbsp; <%} %> ▶ <%}else{ %> ▶ <%} %> <a
					href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>&type=<%=type%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>
				</td>

				<td><%=articleList.get(i).getBOARD_NAME() %></td>
				<td><%=articleList.get(i).getBOARD_DATE() %></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>

	<section id="pageList">
		<%if(nowPage<=1){ %>
		<button>이전</button>&nbsp;
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage-1 %>&type=<%=type%>"><button>이전</button></a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardList.bo?page=<%=a %>&type=<%=type%>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<button>다음</button>
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage+1 %>&type=<%=type%>"><button>다음</button></a>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>
</body>
</html>