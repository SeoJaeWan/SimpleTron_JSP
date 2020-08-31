<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String type = (String)request.getAttribute("type");
	String content = (String)request.getAttribute("content");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MVC 게시판</title>
    <link href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
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

        button {
            margin-top: 10px;
            margin-right: 15px;
            padding: 3px 20px;
            font-size: 13px;

       
            background-color: #1abc9c;
            border:none;
            border-radius: 5px;
            cursor: pointer;
            
            transition: all 1s;
        }
        
        button:hover {
            background-color: #16a085;
        }

        #commandCell {
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- 게시판 등록 -->
    <section >
        <h2>게시판글등록</h2>
        <form action="boardWritePro.bo" method="post" enctype="multipart/form-data" name="boardform">
            <table>
                <tr>
                    <td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
                    <td class="td_right">
                        <input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required" /></td>
                </tr>
                <tr>
                    <td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
                    <td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required" /></td>
                </tr>
                <tr>
                    <td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
                    <td class="td_right"><input name="BOARD_PASS" type="password" id="BOARD_PASS" required="required" /></td>
                </tr>
                <tr>
                    <td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
                    <td>
                    <textarea id="BOARD_CONTENT" name="BOARD_CONTENT" required="required"><%=content%></textarea></td>
                </tr>
                <%if(type.equals("board")){ %>
                <tr>
                    <td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
                    <td class="td_right"><input name="BOARD_FILE" type="file" id="BOARD_FILE" required="required" /></td>
                </tr>
                 <%} %>
            </table>
            <section id="commandCell">
                <button type="submit" value = <%=type%> name = "type">등록</button>
                <button type="reset">다시쓰기</button>
            </section>
        </form>
    </section>
    <!-- 게시판 등록 -->
</body></html>