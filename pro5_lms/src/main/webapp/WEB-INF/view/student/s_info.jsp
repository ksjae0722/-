<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.StudentDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	int sid = (int) request.getAttribute("s_id");
	String s_id = String.valueOf(sid);
	StudentDTO stu_dto = (StudentDTO) request.getAttribute("dto");
	
	String check = (String) request.getAttribute("check");
	//System.out.println(check);
	
	if(check!=null){
		if(check.equals("1")){
%>
			<script type="text/javascript">
				alert("수정되었습니다");
			</script>
<%
		}
	}
%>	onclick="update_info()"
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_info.css">
    <script type="text/javascript">
    	function update_info(){
    		if(isNaN(document.getElementById("s_phone").value)){
    			alert("숫자만 입력해주세요!");
    			document.getElementById("s_phone").focus();
    			return false;
    		}
    		if(document.getElementById("s_phone").value==""||!(document.getElementById("s_phone").value.length==11||document.getElementById("s_phone").value.length==10)){
				alert("전화번호 10~11자리를 입력해주세요!");
				document.getElementById("s_phone").focus();
				return false;
			}
			
			var text = document.getElementById("s_email").value;

		    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		    if (regEmail.test(text) === false) {
		        alert("올바른 형식의 이메일이 아닙니다.");
		        document.getElementById("s_email").focus();
		      	return false;
		    }
    		document.s_infos.submit();
    	}
    </script>
</head>
<body>
     <!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "http://localhost:8080/pro5_lms/student/s_main.so"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a><%=session.getAttribute("s_name") %></a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1" checked>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">학적 관리</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_info.so">기본 정보 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container enrolment">
                <ul>
                    <input type="checkbox" name="box" id="box2">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box2">수강 신청</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_subject.so">수강 신청</a></li>
                    <li><a href="http://localhost:8080/pro5_lms/student/s_schedule.so">시간표 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container test">
                <ul>
                    <input type="checkbox" name="box" id="box3">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box3">시험 응시</label>
                    </div>
                   
                    <li><a href="http://localhost:8080/pro5_lms/student/s_exam.so">시험 응시</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container gradecheck">
                <ul>
                    <input type="checkbox" name="box" id="box4">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box4">성적 조회</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_inquiry.so">성적 조회</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--nav 끝-->
    <!--틀 시작-->
    <section id="main">
        <!--배너 시작-->
        <div class ="banner">
            <input type="button" value="로그아웃" onClick="location.href='http://localhost:8080/pro5_lms/member/logout.do'">
        </div>
        <!--배너 끝-->
    <!--기본 틀 안에 내용 작성-->
        <div class ="container">
            <!--프레임 시작 // class명(frame)은 페이지에 맞게 수정-->
            <div class="frame">
                <form action = "modify_process.so" name = "s_infos">
                    <div class="frame_top">
                        <div class="title">기본 정보 조회</div>
                        <!--수정은 기본 display-none 필요하면 사용-->
                        <div class="title_sub">
                        	<input type="button"  name="sub" value="수정" onclick="update_info()">
                        </div>
                    </div>

                    <div class="frame_bottom">
                        <div class="info_top">
                            <div class="info_top_left">
                                <div class="info_pic">
                                    <img src="../resource/images/info.jpg" alt="img">
                                </div>
                                <div class="info_student">
                                    <p class="info_name"><%=stu_dto.getS_name() %></p>
                                    <p class="info_number"><%=stu_dto.getS_id() %></p>
                                </div>
                            </div>
                            <div class="info_top_right">
                                <a href="http://localhost:8080/pro5_lms/member/changepw.do">비밀번호 변경</a>
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
                                        <input type="text" class="fix" name="s_college" placeholder="<%=stu_dto.getS_college() %>" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학과</div>
                                        <input type="text" class="fix" name="d_name" placeholder="<%=stu_dto.getD_name() %>" readonly>
                                    </div>
                                </div>
                                <div class="category1">
                                    <div class="info_set">
                                        <div class="information">학년</div>
                                        <input type="text" class="fix" name="s_grade" placeholder="<%=stu_dto.getS_grade() %>" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학번</div>
                                        <input type="text" class="fix" name="s_id" placeholder="<%=stu_dto.getS_id() %>" readonly>
                                    </div>
                                    <div class="info_set">
                                        <div class="information">학적</div>
                                        <input type="text" class="fix" name="s_state" placeholder="<%=stu_dto.getS_state() %>" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="category2">
                                <div class="info_set">
                                    <div class="information">주소</div>
                                    <input type="text" class="fix wide" name="s_address" value="<%=stu_dto.getS_address() %>">
                                </div>
                                <div class="info_set">
                                    <div class="information">전화번호</div>
                                    <input type="text" class="fix narrow" id="s_phone" name="s_phone" value="<%=stu_dto.getS_pNumber() %>">
                                </div>
                                <div class="info_set">
                                    <div class="information">이메일</div>
                                    <input type="text" class="fix" id="s_email" name="s_email" value="<%=stu_dto.getS_email() %>">
                                </div>
            
                            </div>
                            <div class="category2">
                                <div class="info_set">
                                    <div class="information">은행</div>
                                    <input type="text" class="fix narrow" name="s_account1" value="<%=stu_dto.getS_account1() %>">
                                </div>
                                <div class="info_set">
                                    <div class="information">계좌번호</div>
                                    <input type="text" class="fix wide" name="s_account2" value="<%=stu_dto.getS_account2() %>">
                                </div>
                                <div class="info_set">
                                    <div class="information">예금주</div>
                                    <input type="text" class="fix" name="s_account3" value="<%=stu_dto.getS_account3()%>">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--프레임 끝-->    
        </div>
    <!--기본 틀 안에 내용 작성 끝-->
    </section>
    <!--틀 끝-->
</body>
</html>