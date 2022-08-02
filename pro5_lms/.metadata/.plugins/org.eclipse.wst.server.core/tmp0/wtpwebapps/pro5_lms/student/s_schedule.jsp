<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시간표</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_schedule.css">
</head>
<body>
    <!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "s_main.jsp"><img src="../images/logo.png" alt="ITUNIVERSITY"></a>
            </div>

            <div class = "nav_user_container">
                <a>
                    사람 이름
                </a>
            </div>

            <div class = "nav_ul_container information">
                <ul>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">학적 관리</label>
                    </div>
                    <input type="checkbox" name="box" id="box1">
                    <li><a href="s_info.jsp">기본 정보 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container enrolment">
                <ul>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box2">수강 신청</label>
                    </div>
                    <input type="checkbox" name="box" id="box2">
                    <li><a href="s_subject.jsp">수강 신청</a></li>
                    <li><a href="s_schedule.jsp">시간표 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container test">
                <ul>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box3">시험 응시</label>
                    </div>
                    <input type="checkbox" name="box" id="box3">
                    <li><a href="s_exam.jsp">시험 응시</a></li>
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
                    <li><a href="s_inquiry.jsp">성적 조회</a></li>
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
                <div>
                    <p>시간표</p>
                    <form action="">
                        <input type="submit" value="출력">
                    </form>
                </div>
                <table>
                    <tr class = "week week">
                        <th>
                            &nbsp;<br>
                            &nbsp;<br>
                            &nbsp;
                        </th>
                        <th class = "day mon"><font size = "6">월</font></th>
                        <th class = "day thu"><font size = "6">화</font></th>
                        <th class = "day wed"><font size = "6">수</font></th>
                        <th class = "day tur"><font size = "6">목</font></th>
                        <th class = "day fri"><font size = "6">금</font></th>
                    </tr>
                    <tr class = "week 1class">
                        <th class = "time">
                            1교시<br>
                            09:00<br>
                            ~09:50
                        </th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 2class">
                        <th class = "time">
                            2교시<br>
                            10:00<br>
                            ~10:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 3class">
                        <th class = "time">
                            3교시<br>
                            11:00<br>
                            ~11:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 4class">
                        <th class = "time">
                            4교시<br>
                            12:00<br>
                            ~12:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 5class">
                        <th class = "time">
                            5교시<br>
                            13:00<br>
                            ~13:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 6class">
                        <th class = "time">
                            6교시<br>
                            14:00<br>
                            ~14:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 7class">
                        <th class = "time">
                            7교시<br>
                            15:00<br>
                            ~15:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 8class">
                        <th class = "time">
                            8교시<br>
                            16:00<br>
                            ~16:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr class = "week 9class">
                        <th class = "time">
                            9교시<br>
                            17:00<br>
                            ~17:50</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </section>
    </div>
</body>
</html>