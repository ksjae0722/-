<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청 현황</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./p_lecture.css">
</head>
<body>
	<!--nav 시작-->
<nav id = "navbar">
    <div class = "nav_container">
        <div class = "nav_logo_container">
            <a href = "p_main.html"><img src="../images/logo.png" alt="ITUNIVERSITY"></a>
        </div>

        <div class = "nav_user_container">
            <a>사람 이름</a>
        </div>

        <div class = "nav_ul_container information">
            <ul>
                <div>
                    <i class="fa-brands fa-blogger"></i>
                    <label for="box1">교원 정보</label>
                </div>
                <input type="checkbox" name="box" id="box1">
                <li><a href="p_info.jsp">기본 정보 조회</a></li>
            </ul>
        </div>

        <hr>

        <div class = "nav_ul_container enrolment">
            <ul>
                <div>
                    <i class="fa-brands fa-blogger"></i>
                    <label for="box2">수강 신청 현황</label>
                </div>
                <input type="checkbox" name="box" id="box2" checked>
                <li><a href="p_lecture.jsp">수강 신청 현황</a></li>
            </ul>
        </div>

        <hr>

        <div class = "nav_ul_container test">
            <ul>
                <div>
                    <i class="fa-brands fa-blogger"></i>
                    <label for="box3">시험 관리</label>
                </div>
                <input type="checkbox" name="box" id="box3">
                <li><a href="p_exam.jsp">시험 출제</a></li>
            </ul>
        </div>

        <hr>

        <div class = "nav_ul_container gradecheck">
            <ul>
                <div>
                    <i class="fa-brands fa-blogger"></i>
                    <label for="box4">성적 관리</label>
                </div>
                <input type="checkbox" name="box" id="box4">
                <li><a href="p_score.jsp">성적 산출</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--nav 끝-->

    <div>
        <section id = "banner">
            <input type="button" value="로그아웃">
        </section>
    
        <section id = "main">
            <div class = "container"><!--기본틀-->
                <div class = "title">
                    <p>수강 신청 현황</p>
                </div>
                <div class = "head">
                    <div class = "right">
                        <p>담당 과목</p>
                    </div>
                    <div class = "left">
                        <p>인원</p>
                    </div>
                </div>
                <div class = "sugang">
                    <div class = "ul_container con1">
                        <ul class = "right">
                            <li><p>담당 과목 1</p></li>
                            <li><p>담당 과목 2</p></li>
                            <li><p>담당 과목 3</p></li>
                            <li><p>담당 과목 4</p></li>
                            <li><p>담당 과목 5</p></li>
                        </ul>
                        <ul class = "left">
                            <li><p>n</p></li>
                            <li><p>m</p></li>
                            <li><p>o</p></li>
                            <li><p>p</p></li>
                            <li><p>q</p></li>
                        </ul>
                    </div>
                    <!--<div class = "ul_container con2">
                        <ul class = "right">
                            <li><p>담당 과목 6</p></li>
                            <li><p>담당 과목 7</p></li>
                            <li><p>담당 과목 8</p></li>
                            <li><p>담당 과목 9</p></li>
                            <li><p>담당 과목 10</p></li>
                        </ul>
                        <ul class = "left">
                            <li><p>n</p></li>
                            <li><p>m</p></li>
                            <li><p>o</p></li>
                            <li><p>p</p></li>
                            <li><p>q</p></li>
                        </ul>
                    </div>
                    <div class = "ul_container con3">
                        <ul class = "right">
                            <li><p>담당 과목 11</p></li>
                            <li><p>담당 과목 12</p></li>
                            <li><p>담당 과목 13</p></li>
                            <li><p>담당 과목 14</p></li>
                            <li><p>담당 과목 15</p></li>
                        </ul>
                        <ul class = "left">
                            <li><p>n</p></li>
                            <li><p>m</p></li>
                            <li><p>o</p></li>
                            <li><p>p</p></li>
                            <li><p>q</p></li>
                        </ul>
                    </div>-->
                </div>
                <div class = "foot">
                    <p><i class="fa-solid fa-angle-left"></i></p>
                    <p><i class="fa-solid fa-angle-right"></i></p>
                </div>
            </div>
        </section>
    </div>
</body>
</html>