<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교수정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./p_info.css">
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
                <input type="checkbox" name="box" id="box1" checked>
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
                <div class="info_container">
                    <div class="info_title">
                        <div class="info_basicinfo">기본 정보 조회</div>
                        <input type="submit" value="수정">
                    </div>
                    <div class="info_info">
                        <div class="info_top">
                            <div class="info_top_left">
                                <div class="info_pic">
                                    <img src="../images/info.jpg" alt="img">
                                </div>
                                <div class="info_student">
                                    <p class="info_name">김교수</p>
                                    <p class="info_number">P123123123</p>
                                </div>
                            </div>
                            <div class="info_top_right">
                                <a href="changepw.jsp">비밀번호 변경</a>
                            </div>
                            
                        </div>
                        
                        <div class="info_bottom">
                            <div class="info_a">
                                <div class="category1">
                                    <div class="info_set">
                                        <div class="information">대학</div>
                                        <input type="text" class="fix" name="p_college" placeholder="융합공과대" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학과</div>
                                        <input type="text" class="fix" name="p_department" placeholder="컴퓨터공학과" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">전공</div>
                                        <input type="text" class="fix" name="p_major" placeholder="네트워크 보안" readonly>
                                    </div>
                                </div>
                            </div>
                            <form action="#" name="info_form">
                                <div class="category2">
                                    <div class="info_set">
                                        <div class="information">사무실</div>
                                        <input type="text" class="fix" name="p_adress" placeholder="공학관 A동 1층 101호">
                                    </div>
                                    <div class="info_set">
                                        <div class="information">전화번호</div>
                                        <input type="text" class="fix" name="p_phone" placeholder="055-211-1111">
                                    </div>
                                    <div class="info_set">
                                        <div class="information">이메일</div>
                                        <input type="text" class="fix" name="p_email" placeholder="professor_k@ituniversity.ac.kr">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>