<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강신청</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_subject.css">
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
                <div class = "title">
                    <p>수강 신청</p>
                </div>
                <div class = "tab_container">
                    <input type="radio" name="sugang" id="open_subject" checked>
                    <label for="open_subject" class = "right">개설 과목</label>
                    <input type="radio" name="sugang" id="success_list">
                    <label for="success_list" class = "left">수강 신청 내역</label>

                    <div class = "subject right">
                        <div class = "subject_title">
                            <p>개설 과목</p>
                        </div>
                        <div class = "case">
                            <div class = "major">
                                <p>학부(과)</p>
                                <select name="class" id="class">
                                    <option value="class1">생명과학과</option>
                                    <option value="class2">물리학과</option>
                                    <option value="class3">수리학과</option>
                                    <option value="class4">철학과</option>
                                    <option value="class5">영어영문학과</option>
                                </select>
                            </div>
                            <div class = "search">
                                <p>입력 검색</p>
                                <form action="">
                                    <input type="text" name = "code" class = "text" placeholder="과목명 또는 코드">
                                    <input type="submit" value="검색" class = "submit">
                                </form>
                            </div>
                        </div>
                        <div class = "head">
                            <div class = "box one">
                                <p>수강신청</p>
                            </div>
                            <div class = "box two">
                                <p>과목코드</p>
                            </div>
                            <div class = "box three">
                                <p>과목명</p>
                            </div>
                            <div class = "box four">
                                <p>이수구분</p>
                            </div>
                            <div class = "box five">
                                <p>학점</p>
                            </div>
                            <div class = "box six">
                                <p>담당교수</p>
                            </div>
                            <div class = "box seven">
                                <p>강의시간</p>
                            </div>
                        </div>
                        <div class = "sugang">
                            <div class = "ul_container con1">
                                <ul class = "ul_box one">
                                    <li><form action=""><input type="submit" value = "신청"></form></li>
                                    <li><form action=""><input type="submit" value = "신청"></form></li>
                                    <li><form action=""><input type="submit" value = "신청"></form></li>
                                    <li><form action=""><input type="submit" value = "신청"></form></li>
                                    <li><form action=""><input type="submit" value = "신청"></form></li>
                                </ul>
                                <ul class = "ul_box two">
                                    <li><p>2020010023</p></li>
                                    <li><p>2021010004</p></li>
                                    <li><p>2020011002</p></li>
                                    <li><p>2008015021</p></li>
                                    <li><p>2010016008</p></li>
                                </ul>
                                <ul class = "ul_box three">
                                    <li><p>꿈을 비추는 네개의 거울</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box four">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box five">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box six">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box seven">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                            </div>
                        </div>
                        <div class = "foot">
                            <p><i class="fa-solid fa-angle-left"></i></p>
                            <p><i class="fa-solid fa-angle-right"></i></p>
                        </div>
                    </div>

                    <div class = "subject left">
                        <div class = "subject_title">
                            <p>신청 내역</p>
                        </div>
                        <div class = "head">
                            <div class = "box one">
                                <p>수강삭제</p>
                            </div>
                            <div class = "box two">
                                <p>과목코드</p>
                            </div>
                            <div class = "box three">
                                <p>과목명</p>
                            </div>
                            <div class = "box four">
                                <p>이수구분</p>
                            </div>
                            <div class = "box five">
                                <p>학점</p>
                            </div>
                            <div class = "box six">
                                <p>담당교수</p>
                            </div>
                            <div class = "box seven">
                                <p>강의시간</p>
                            </div>
                        </div>
                        <div class = "sugang">
                            <div class = "ul_container con1">
                                <ul class = "ul_box one">
                                    <li><form action=""><input type="submit" value = "삭제"></form></li>
                                    <li><form action=""><input type="submit" value = "삭제"></form></li>
                                    <li><form action=""><input type="submit" value = "삭제"></form></li>
                                    <li><form action=""><input type="submit" value = "삭제"></form></li>
                                    <li><form action=""><input type="submit" value = "삭제"></form></li>
                                </ul>
                                <ul class = "ul_box two">
                                    <li><p>2020010023</p></li>
                                    <li><p>2021010004</p></li>
                                    <li><p>2020011002</p></li>
                                    <li><p>2008015021</p></li>
                                    <li><p>2010016008</p></li>
                                </ul>
                                <ul class = "ul_box three">
                                    <li><p>꿈을 비추는 네개의 거울</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box four">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box five">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box six">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                                <ul class = "ul_box seven">
                                    <li><p>왓 슨앤크릭</p></li>
                                    <li><p>아 이작뉴턴</p></li>
                                    <li><p>블 레즈파스칼</p></li>
                                    <li><p>아 리스토텔레스</p></li>
                                    <li><p>윌 리엄셰익스피어</p></li>
                                </ul>
                            </div>
                        </div>
                        <div class = "foot">
                            <p><i class="fa-solid fa-angle-left"></i></p>
                            <p><i class="fa-solid fa-angle-right"></i></p>
                        </div>
                        <p>* 수강 신청 기간이 끝나면 정정할 수 없습니다.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>