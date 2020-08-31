<%@page import="java.util.Arrays"%>
<%@page import="structure.Operation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	String text = (String)request.getAttribute("text");
	String value = (String)request.getAttribute("value");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Simpletron</title>
<script src="https://kit.fontawesome.com/121e4dcf8f.js" crossorigin="anonymous"></script>
<link href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<style type="text/css">
		@keyframes colorChange {

		0%{

			color:red;

		}



		25%{

			color:Yellow;

		}



		50%{	

			color:green;

		}



		75%{

			color:blue;

		}



		100%{

			color:Violet;

		}

	}

        html {
            font-family: 'Spoqa Han Sans', sans-serif;
            font-size: 16px;
        }

        body {
            background-color: #bdc3c7;

        }
        
        nav{
        	text-align:center;
        }
        
        a {
            text-decoration: none;
            color: black;

            font-weight: bold;
        }

        div {
            text-align: center;
        }
        
        h1:hover {

		animation-name:colorChange;

		animation-duration: 1s;

	}
        
</style>
</head>

<body>
	<div>
		<h1> <i class="fas fa-robot fa-2x"></i>어썸한 프로그램 <i class="fas fa-robot fa-2x"></i></h1>
			<pre> *** Welcome to Simpletron! ***
*** Please enter your program one istruction ***
*** (or data word) at a time. I will type the ***
*** location number and a question mark (?) ***
*** You then type the word for that location. ***
*** Type the sectinel -99999 to stop entering ***
*** your program ****
<%=text%></pre>
	</div>
	
	<nav>
		<h1 style="display:none;">네비게이션</h1>
		<form name="paging">
			<textarea style ="display: none;" name="content"><%=value%></textarea>
			<a href="javascript:page_move('boardList.bo?type=simple')">
		         <i class="far fa-list-alt fa-x"></i>게시글보기
		    </a>
		     
	        <a href="javascript:page_move('boardWriteForm.bo?type=simple')">
	            <i class="fas fa-edit fa-x"></i>게시판글쓰기
	        </a>
		</form>
	</nav>
	
	<script>
		function page_move(link){		
			let p = document.paging;
						
			p.action=link;
			p.method = "post";
			p.submit();
		}
	</script>
</body>
</html>