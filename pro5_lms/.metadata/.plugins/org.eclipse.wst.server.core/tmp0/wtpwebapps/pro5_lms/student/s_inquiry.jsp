<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_inquiry.css">
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
                <div class="incontain">
                    <div class="head">
                        <p>성적조회</p>
                    </div>
                    <div>
                        <div>
                            <div class="th">년도</div>
                            <div class="th">학기</div>
                            <div class="th">교과구분</div>
                            <div class="th wide">과목명</div>
                            <div class="th">학점</div>
                            <div class="th">등급</div>
                            <div class="th">비고</div>
                        </div>
                        <div>
                            <div class="a td">2020</div>
                            <div class="a td">1</div>
                            <div class="a td">교양선택</div>
                            <div class="a td wide">&nbsp;</div>
                            <div class="a td">&nbsp;</div>
                            <div class="a td">&nbsp;</div>
                            <div class="a td">&nbsp;</div>
                        </div>
                        <div>
                            <div class="b td">2020</div>
                            <div class="b td">1</div>
                            <div class="b td">교양선택</div>
                            <div class="b td wide">&nbsp;</div>
                            <div class="b td">&nbsp;</div>
                            <div class="b td">&nbsp;</div>
                            <div class="b td">&nbsp;</div>
                        </div>
                        <div>
                            <div class="c td">2020</div>
                            <div class="c td">1</div>
                            <div class="c td">전공기초</div>
                            <div class="c td wide">&nbsp;</div>
                            <div class="c td">&nbsp;</div>
                            <div class="c td">&nbsp;</div>
                            <div class="c td">&nbsp;</div>
                        </div>
                        <div>
                            <div class="d td">2020</div>
                            <div class="d td">1</div>
                            <div class="d td">전공기초</div>
                            <div class="d td wide">&nbsp;</div>
                            <div class="d td">&nbsp;</div>
                            <div class="d td">&nbsp;</div>
                            <div class="d td">&nbsp;</div>
                        </div>
                        <div>
                            <div class="e td">2020</div>
                            <div class="e td">1</div>
                            <div class="e td">전공기초</div>
                            <div class="e td wide">&nbsp;</div>
                            <div class="e td">&nbsp;</div>
                            <div class="e td">&nbsp;</div>
                            <div class="e td">&nbsp;</div>
                        </div>
                        <div>
                            <div class="last td">2020</div>
                            <div class="last td width">신청학점 00 &nbsp; | &nbsp; 취득학점 00 &nbsp; | &nbsp; 총평점 00 &nbsp; | &nbsp; 평균평점 00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>