<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험응시</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_exam.css">
</head>

<Script language="JavaScript">
    function func()
        {
        window.open('s_popup_exam.jsp', '시험출제', 'Width=1600px, Height=1000px, Top=50px, Left=100px, Toolbar=yes, Menubar=yes, Statusbar=yes, Scrollbar=yes, Resizable=yes, fullscreen=yes');
        }

    function func_x()
        {
        alert("이미 답안을 제출한 시험은 다시 응시할 수 없습니다.")
        }
</Script>

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
                <div class="incontain">
                    <div class = "p_container">
                        <p>시험 응시</p>
                    </div>
                    <div class = "subject_container">
                        <div class="subject">
                            <div class="sname">2020 2학기 xx학</div>                        
                            <div class="excute">
                                <input type="button" value="제출하기" class = "before" onclick="func()">
                            </div>
                        </div>
                        <div class="subject">
                            <div class="sname">2020 2학기 aa학</div>
                            <div class="excute">
                                <input type="button" value="제출하기" class = "before" onclick="func()">
                            </div>
                        </div>
                        <div class="subject">
                            <div class="sname">2020 2학기 oo학</div>
                            <div class="excute">
                                <input type="button" value="제출하기" class = "before" onclick="func()">
                            </div>
                        </div>
                        <div class="subject">
                            <div class="sname">2020 2학기 xx학</div>
                            <div class="complete">
                                <input type="button" value="응시완료" class = "after" onclick="func_x()">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>