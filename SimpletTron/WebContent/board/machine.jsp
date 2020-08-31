<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonBuilderFactory"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="structure.Operation"%>
<%@page import="org.codehaus.jettison.json.JSONArray" %>
<%@page import="org.codehaus.jettison.json.JSONException" %>
<%@page import="org.codehaus.jettison.json.JSONObject" %>
<%@page import="javax.json.JsonObjectBuilder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	Operation operation =new Operation();

	String jsonStr = (String)request.getAttribute("jsonStr");
	String jsonStrRe="";
	String memory;
	String text;
	
    int count;
	
    try{
		JSONObject js = new JSONObject(jsonStr);
		
		memory = js.getString("memory");
		text = js.getString("text");
		count = js.getInt("count");
		
	}catch(Exception e){
		memory = "";
		text ="" ;
	    count = 0;
	}
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

	<% if(count < 0){%>
		<form action ="MachineResultAction.bo" method="POST">
			<textarea name ="jsonStr" style ="display: none;"><%=jsonStr%></textarea>
			<%if(count == -200) {%>
				<input name = "code" type = "text" placeholder="입력할 값을 입력해주세요" autofocus> 
				<%} %>
			<button type = "submit">수행</button>
		</form>
		
	<%}else{%>
		<form action ="MachineProAction.bo" method="POST">	
			<textarea name ="jsonStr" style ="display: none;"><%=jsonStr%></textarea>
			
			<input name = "code" type = "text" placeholder="코드를 입력하세요" autofocus>
			<button type = "submit">입력</button>
		</form>
	<%}%>
	</div>
	<nav>
		<h1 style="display:none;">네비게이션</h1>
		<a href="boardList.bo?type=simple">
	         <i class="far fa-list-alt fa-x"></i>게시글보기
	     </a>
	</nav>
</body>
</html>