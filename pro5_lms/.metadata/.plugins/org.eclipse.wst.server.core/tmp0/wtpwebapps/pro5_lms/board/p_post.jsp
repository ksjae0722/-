<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 과목별 게시글 상세보기</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./p_post.css">
</head>
<script language = "JavaScript">
    function func()
        {
        if (confirm("정말로 삭제하시겠습니까?"))
            {
            document.form.button.submit()
            }
            
        else
            {
            return false
            }
        }
</script>
<body>
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
                <div class = "abc">
                    <p>상세보기</p>
                </div>
                <div class = "title">
                    <div class = "title_title">
                        <p>--------------------제목---------------</p>
                    </div>
                    <div class = "title_sub">
                        <div class = "sub sub1">
                            <div class = "right"><p>등록일</p></div>
                            <div class = "left"><p>2022.07.22</p></div>
                        </div>
                        <div class = "sub sub2">
                            <div class = "right"><p>과목</p></div>
                            <div class = "left"><p>꿈을 비추는 네개의 거울</p></div>
                        </div>
                        <div class = "sub sub3">
                            <div class = "right"><p>연락처</p></div>
                            <div class = "left"><p>010-1234-5678</p></div>
                        </div>
                    </div>
                </div>
                <div class = "contents">
                    <div class = "contents_text">
                        <p>
                            교육혁신처에서는 학습환경 변화에 따른 학습법을 습득하여 자기주도적 학습능력을 강화하기 위하여 2022학년도 1차 맞춤형 학습법 특강을 안내합니다.<br>
                            <br>
                            <br>
                            1. 참여 및 신청방법<br>
                            &nbsp;&nbsp;가. 교육대상: 경상국립대 재학생 (구, 경남과기대 재학생 포함)&nbsp;&nbsp;&nbsp;&nbsp;※수료생 및 졸업유예생 신청 가능<br>
                            &nbsp;&nbsp;나. 모집인원: 선착순 100명<br>
                            &nbsp;&nbsp;다. 신청기간: 2022년 5월 16일 (월) 10:00 ~ 5월 27일 (금) 18:00<br>
                            &nbsp;&nbsp;라. 운영기간: 2022년 5월 23일 (월) ~ 6월 5일<br>
                            &nbsp;&nbsp;마. 신청방법: 학생역량관리시스템 (http://nerum.gnu.ac.kr) → 교육활동 → 비교과영역 (개인) → 신청<br>
                            &nbsp;&nbsp;바. 교육형태: 비대면 콘텐츠 시청<br>
                            <br>
                            2. 이수혜택<br>
                            &nbsp;&nbsp;가. 경상국립대학교 재학생 역량점수 0.2점 부여<br>
                            &nbsp;&nbsp;나. 구, 경남과학기술대학교 재학생 비교과인증(졸업인증) 포인트 3점 부여<br>
                            <br>
                            3. 수료안내<br>
                            &nbsp;&nbsp;가. 특강 수강 이후 학생역량관리시스템을 통한 학습보고서 제출<br>
                            &nbsp;&nbsp;나. 특강 수강 이후 사후만족도 조사 설문지 제출<br>
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 학습보고서 및 만족도 조사 설문지 미제출시 수료처리 불가 (만족도 조사 미참여 시 수료 취소될 수 있습니다.)
                        </p>
                    </div>
                    <div class = "contents_file">
                        <div class = "right"><p>첨부파일</p></div>
                        <div class = "left"><a class="btn" href="상대경로/test.pdf" download><i class="fa-solid fa-circle-down"></i>PDF 다운로드</a></div>
                    </div>
                </div>
                <div class = "buttons">
                    <div class = "form_container">
                        <form action="" name = "form"><input type="submit" value = "수정"></form>
                        <form action=""><input type="button" value = "삭제" name = "button" onclick = "func()"></form>
                    </div>
                    <div class = "a_container">
                        <a href=""><p>목록</p></a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>