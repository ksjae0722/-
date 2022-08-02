<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_info.css">
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
                                    <p class="info_name">김재학생</p>
                                    <p class="info_number">1111111111</p>
                                </div>
                            </div>
                            <div class="info_top_right">
                                <a href="../changepw/changepw.jsp">비밀번호 변경</a>
                            </div>
                            
                        </div>
                        
                        <div class="info_bottom">
                            <div class="info_a">
                                <div class="category1">
                                    <div class="info_set">
                                        <div class="information">대학교</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="아이티대학교" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학교</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="융합공과대" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학과</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="컴퓨터공학과" readonly>
                                    </div>
                                </div>
                                <div class="category1">
                                    <div class="info_set">
                                        <div class="information">학년</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="1" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학번</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="1111111111" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학적</div>
                                        <input type="text" class="fix" name="s_adress" placeholder="재학" readonly>
                                    </div>
                                </div>
                            </div>
                            <form action="#" name="info_form">
                                <div class="category2">
                                    <div class="info_set">
                                        <div class="information">주소</div>
                                        <input type="text" class="fix wide" name="s_adress" placeholder="경남 창원시">
                                    </div>
                                    <div class="info_set">
                                        <div class="information">전화번호</div>
                                        <input type="text" class="fix narrow" name="s_phone" placeholder="010-0000-0000">
                                    </div>
                                    <div class="info_set">
                                        <div class="information">이메일</div>
                                        <input type="text" class="fix" name="s_email" placeholder="abcd@naver.com">
                                    </div>
                
                                </div>
                                <div class="category2">
                                    <div class="info_set">
                                        <div class="information">은행</div>
                                        <select class="fix narrow" name="s_adress">
                                            <option value="nh">농협</option>
                                            <option value="kb">국민</option>
                                            <option value="hana">하나</option>
                                            <option value="woori">우리</option>
                                            <option value="kakao">카카오</option>
                                        </select>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">계좌번호</div>
                                        <input type="text" class="fix wide" name="s_account" placeholder="1111-111111-111">
                                    </div>
                                    <div class="info_set">
                                        <div class="information">예금주</div>
                                        <input type="text" class="fix" name="s_account" placeholder="김재학생">
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