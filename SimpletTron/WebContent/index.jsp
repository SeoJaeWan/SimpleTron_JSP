<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/121e4dcf8f.js" crossorigin="anonymous"></script>
    <link href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <style>
        html {
            font-family: 'Spoqa Han Sans', sans-serif;
            font-size: 16px;
        }

        body {
            background-color: #bdc3c7;
        }

        h1,
        p {
            margin: 0;
        }

        a {
            text-decoration: none;
            color: black;

            font-weight: bold;
        }

        .projectTitle {
            margin: 0 auto;
            margin-top: 60px;
            text-align: center;
        }

        .projectTitle>p {
            color: gray;
            padding-top: 10px;

        }
        
        .projectMain {
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            text-align: center;

            width: 45%;

            min-height: 500px;
            padding: 50px 0px;
            margin: 0 auto;
            margin-top: 40px;

            box-shadow: 0 6px 15px 0 rgba(0, 0, 0, 0.4);

            border-radius: 15px;
            background-color: #ecf0f1;
            
            transition: all 1s;
        }

        .projectMain:hover {
            transform: translateY(-10px);
        }

        .fas,
        .far {
            display: block;
            padding-bottom: 10px;
        }
    </style>

</head>

<body>
    <header>
        <div class='projectTitle'>
            <h1>1601126 서재완의 <strong>JSP</strong>과제 홈페이지</h1>
            <p>만나서 반갑습니다!</p>
        </div>
    </header>

    <main>
        <div class='projectMain'>
            <section class=''>
                <a href="boardWriteForm.bo?type=board&content=">
                    <i class="fas fa-edit fa-7x"></i>
                    <p>게시판글쓰기<p>
                </a>
            </section>

            <section>
                <a href="boardList.bo?type=board">
                    <i class="far fa-list-alt fa-7x"></i>
                    <p>게시글보기</p>
                </a>
            </section>

            <section>
                <a href="machine.bo">
                    <i class="fas fa-robot fa-7x"></i>
                    <p>어썸한 프로그램 보기</p>
                </a>
            </section>
        </div>

    </main>

</body></html>
