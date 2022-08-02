<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./p_score.css">
</head>
<body>
	<!--nav 시작-->
<nav id = "navbar">
    <div class = "nav_container">
        <div class = "nav_logo_container">
            <a href = "p_main.jsp"><img src="../images/logo.png" alt="ITUNIVERSITY"></a>
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
                <input type="checkbox" name="box" id="box2">
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
                <input type="checkbox" name="box" id="box4" checked>
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
            <div class = "container">
                <div class="title">
                    <div class="admin_title">성적관리</div>
                </div>
                <div class="content">
                    <div class="select_item">
                        <form action="#">
                            <select name="subject" id="subject">
                                <option value="a과목">a과목</option>
                                <option value="b과목">b과목</option>
                                <option value="c과목">c과목</option>
                                <option value="d과목">d과목</option>
                            </select>
                            <select name="student" id="student">
                                <option value="김자바">김자바</option>
                                <option value="김학생">김학생</option>
                                <option value="c학생">c학생</option>
                                <option value="d학생">d학생</option>
                            </select>
                            <input type="submit" value="조회">
                        </form>
                    </div>
                    <div class="middle1">
                        <div class="middle1_border">
                            <div class="middle1_left">
                                <div class="QA1">
                                    <div class="Q1">
                                        <div class="Q_item">1</div>
                                        <div class="Q_item">2</div>
                                        <div class="Q_item">3</div>
                                        <div class="Q_item">4</div>
                                        <div class="Q_item">5</div>
                                        <div class="Q_item">6</div>
                                        <div class="Q_item">7</div>
                                        <div class="Q_item">8</div>
                                        <div class="Q_item">9</div>
                                        <div class="Q_item">10</div>
                                    </div>
                                    <div class="A1">
                                        <div class="A_item">1</div>
                                        <div class="A_item">1</div>
                                        <div class="A_item">1</div>
                                        <div class="A_item">1</div>
                                        <div class="A_item incorrect">1</div>
                                        <div class="A_item">2</div>
                                        <div class="A_item">2</div>
                                        <div class="A_item">2</div>
                                        <div class="A_item">2</div>
                                        <div class="A_item">2</div>
                                    </div>
                                </div>
                                <div class="QA1">
                                    <div class="Q1">
                                        <div class="Q_item">11</div>
                                        <div class="Q_item">12</div>
                                        <div class="Q_item">13</div>
                                        <div class="Q_item">14</div>
                                        <div class="Q_item">15</div>
                                        <div class="Q_item">16</div>
                                        <div class="Q_item">17</div>
                                        <div class="Q_item">18</div>
                                        <div class="Q_item">19</div>
                                        <div class="Q_item">20</div>
                                    </div>
                                    <div class="A1">
                                        <div class="A_item">3</div>
                                        <div class="A_item">3</div>
                                        <div class="A_item">3</div>
                                        <div class="A_item">3</div>
                                        <div class="A_item">3</div>
                                        <div class="A_item">4</div>
                                        <div class="A_item">4</div>
                                        <div class="A_item">4</div>
                                        <div class="A_item incorrect">4</div>
                                        <div class="A_item">4</div>
                                    </div>
                                </div>
                            </div>
                            <div class="middle1_right">
                                <p>점수</p>
                                <div class="score">
                                    90
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="middle2">
                        <div class="total">
                            <p>수업일수</p>
                            <input type="readonly" name="total" id="total" placeholder="30">
                        </div>
                        <div class="attend">
                            <p>출석일</p>
                            <input type="readonly" name="attend" id="attend" placeholder="28">
                        </div>
                        <div class="absence">
                            <p>결석일</p>
                            <input type="number" name="absence" id="absence" placeholder="2">
                        </div>
                    </div>
                    <div class="admin_bottom">
                        <div class="grade">
                            <p>총점</p>
                            <input type="readonly" name="attend" id="attend" placeholder="">
                        </div>
                        <div class="final">확정하기</div>
                    </div>
                </div>         
            </div>
        </section>
    </div>
</body>
</html>