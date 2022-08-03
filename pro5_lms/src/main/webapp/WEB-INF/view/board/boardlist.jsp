<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./boardlist.css">
</head>
<body>
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
	    <div>
	        <section id = "banner">
	            <input type="button" value="로그아웃">
	        </section>
	    
	        <section id = "main">
	            <div class = "container"><!--기본틀-->
	                <div class="incontain">
	                    <div class="p-contain">
	                        <p>게시판</p>
	                    </div>
	                    <div class="posts">
	                        <div class="table">
	                            <ul class="first">
	                                <li class="td"><p>번호</p></li>
	                                <li class="td"><p>작성자</p></li>
	                                <li class="td"><p>제목</p></li>
	                                <li class="td"><p>과목</p></li>
	                                <li class="td"><p>작성일</p></li>
	                            </ul>
	                            <ul class="tr">
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>김교수</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>2020-05-10</p></li>
	                            </ul>
	                            <ul class="tr">
	                                <li class="td"><p>2</p></li>
	                                <li class="td"><p>김교수</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>2020-05-21</p></li>
	                            </ul>
	                            <ul class="tr">
	                                <li class="td"><p>3</p></li>
	                                <li class="td"><p>김교수</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>2020-05-21</p></li>
	                            </ul>
	                            <ul class="tr">
	                                <li class="td"><p>4</p></li>
	                                <li class="td"><p>최여진</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>1</p></li>
	                                <li class="td"><p>2020-05-21</p></li>
	                            </ul>
	                        </div>
	                        <div class="pages">
	                            <div class="left"><a href="#"><i class="fa-solid fa-angle-left"></i></a></div>
	                            <div class="number"><a href="#">1</a></div>
	                            <div class="number"><a href="#">2</a></div>
	                            <div class="number"><a href="#">3</a></div>
	                            <div class="number"><a href="#">4</a></div>
	                            <div class="number"><a href="#">5</a></div>
	                            <div class="number"><a href="#">6</a></div>
	                            <div class="number"><a href="#">7</a></div>
	                            <div class="number"><a href="#">8</a></div>
	                            <div class="number"><a href="#">9</a></div>
	                            <div class="number"><a href="#">10</a></div>
	                            <div class="right"><a href="#"><i class="fa-solid fa-angle-right"></i></a></div>
	                        </div>
	                        <div class="bottom">
	                            <div></div>
	                            <a href="post.html">글쓰기</a>
	                        </div>                        
	                    </div>
	                </div>
	            </div>
	        </section>
	    </div>
</body>
</html>