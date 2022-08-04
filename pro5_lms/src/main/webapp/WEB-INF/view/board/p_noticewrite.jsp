<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="mvc.model.PersonalDTO"%>
<!DOCTYPE html>

<%
String p_id= (String) request.getAttribute("p_id");
PersonalDTO per_dto = (PersonalDTO) request.getAttribute("dto");
%>

<html>
<head>
	<meta charset="UTF-8">
    <title>공지사항 작성화면(view)</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/p_noticewrite.css">
</head>
	<script language = "JavaScript">
    function func()
        {
        if (confirm("작성을 취소하시겠습니까?"))
            {
            window.location.href="http://localhost:8080/pro5_lms/professor/p_main";            
            }

        else
            {
            return false
            }
        }

    function asdf()
    	{
        if(document.form.title.value=="")
	        {
        	alert("제목을 입력해주세요");
        	return false;
	        }
        
        if (document.form.summernote.value=="")
        	{
        	alert("내용을 입력해주세요");
        	return false;
	        }
        
        document.form.submit();
    	}
</script>
<body>
<!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "<c:url value='/professor/p_main'/>"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a>
				${remember.getName()}
				</a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">교원 정보</label>
                    </div>
                    
                    <li><a href="<c:url value='/professor/p_info'/>">기본 정보 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container enrolment">
                <ul>
                    <input type="checkbox" name="box" id="box2">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box2">수강 신청 현황</label>
                    </div>
                    
                    <li><a href="<c:url value='/professor/p_lecture'/>">수강 신청 현황</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container test">
                <ul>
                    <input type="checkbox" name="box" id="box3">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box3">시험 관리</label>
                    </div>
                   
                    <li><a href="<c:url value='/professor/p_exam'/>">시험 출제</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container gradecheck">
                <ul>
                    <input type="checkbox" name="box" id="box4">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box4">성적 관리</label>
                    </div>
                    
                    <li><a href="<c:url value='/professor/p_score'/>">성적 산출</a></li>
                </ul>
            </div>
        </div>
    </nav>
<!--nav 끝-->
<!--틀 시작-->
   <section id="main">
       <!--배너 시작-->
        <div class ="banner">
            <input type="button" value="로그아웃" onClick="location.href='http://localhost:8080/pro5_lms/member/logout'">
        </div>
        <!--배너 끝-->
<!--기본 틀 안에 내용 작성-->
        <div class ="container">
            <!--프레임 시작 // class명(frame)은 페이지에 맞게 수정-->
            <div class="frame">
                <div class="frame_top">
                    <div class="title">공지사항 글쓰기</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <form action="http://localhost:8080/pro5_lms/board/p_noticewrite_update" class="post-form" name="form" method="post" enctype="multipart/form-data">
                        <div class = "selector">
                            <div>
                                <input type="text" class="box number" name="p_department" placeholder="부서" value="<%=per_dto.getP_department()%>" readonly>
                                <input type="hidden" class="box number" name="p_id" value="<%= p_id %>">
                                <input type="hidden" class="box number" name="p_name" value="<%= per_dto.getP_name() %>">
                                <input type="hidden" class="box number" name="p_oNumber" value="<%= per_dto.getP_oNumber() %>">
                            </div>
                            <div class="btns">
                                <a href="http://localhost:8080/pro5_lms/board/p_noticeboardlist" class="btn-list">목록</a>
                                <a class="btn-reset" onclick="func()">취소</a>
                                <input type="button" class="btn-submit" name="submit_btn" value="게시" onclick="asdf()">
                            </div>
                        </div>
                        <div class="post">
                            <div class="title">
                                <input type="text" name="title" placeholder="제목을 입력하세요" required>
                            </div>
                            <div class="filebox">
                                <div class="boxing">
                                    <input type="file" name="filename" id="p_file">
                                </div>
                            </div>
                            <div class="contents">
                                <textarea id="summernote" name="summernote" placeholder="내용을 입력해주세요" cols = "20" hard></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--프레임 끝-->    
        </div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>