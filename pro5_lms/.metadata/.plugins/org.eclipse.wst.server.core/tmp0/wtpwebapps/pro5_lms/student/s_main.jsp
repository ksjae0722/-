<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_main.css">
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
            <div class = "container">
                <div class = "top">
                    <img src="../images/logo.png" alt="">
                </div>
                <div class = "middle">
                    <div class = "right">
                        <div class = "info_container">
                            <p>공지사항</p>
                            <div>
                                <i class="fa-solid fa-angle-left"></i>
                                <i class="fa-solid fa-angle-right"></i>
                            </div>
                        </div>
                        <div class = "ul_container">
                            <ul>
                                <li><a href="">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href="">4</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class = "left">
                        <div class = "info_container">
                            <p>학사일정</p>
                            <div>
                                <i class="fa-solid fa-angle-left"></i>
                                <i class="fa-solid fa-angle-right"></i>
                            </div>
                        </div>
                        <div class = "ul_container">
                            <ul>
                                <li><a href="">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href="">4</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class = "bottom">
                    <div class = "top">
                        <p>과목별 게시글</p>
                        <select name="class" id="class">
                            <option value="subject1">수강과목1</option>
                            <option value="subject2">수강과목2</option>
                            <option value="subject3">수강과목3</option>
                            <option value="subject4">수강과목4</option>
                        </select>
                    </div>
                    <div class = "middle">
                        <ul>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">5</a></li>
                            <li><a href="">6</a></li>
                            <li><a href="">7</a></li>
                            <li><a href="">8</a></li>
                            <li><a href="">9</a></li>
                            <li><a href="">10</a></li>
                        </ul>
                    </div>
                    <div class = "bottom">
                        <div></div>
                        <div>
                            <i class="fa-solid fa-angle-left"></i>
                            <i class="fa-solid fa-angle-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>