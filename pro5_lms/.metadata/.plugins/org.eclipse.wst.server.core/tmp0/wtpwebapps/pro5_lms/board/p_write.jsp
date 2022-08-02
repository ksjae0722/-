<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성 화면</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./p_write.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
	<script language = "JavaScript">
    function func()
        {
        if (confirm("작성을 취소하시겠습니까?"))
            {
            window.location.href="main_professor.html";            
            }

        else
            {
            return false
            }
        }

    function asdf()
    {
        if(document.form.summernote.value=="")
        {
            alert("내용을 입력해주세요");
        }        
        else
        {
            document.form.submit.submit()
        }
    }
</script>
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
                <div class="part">
                    <h2>게시판 글쓰기</h2>                    
                    <form action="#" class="post-form" name="form">
                        <div class="post">                
                            <div class="title">
                                <input type="text" name="title" placeholder="제목을 입력하세요" required>
                            </div>
                            <div class="contents">
                                <textarea id="summernote" name="summernote"></textarea>
                                <script>
                                    $(document).ready(function() {

                                        var toolbar = [
                                                // 글꼴 설정
                                                ['fontname', ['fontname']],
                                                // 글자 크기 설정
                                                ['fontsize', ['fontsize']],
                                                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                                                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                                // 글자색
                                                ['color', ['forecolor','color']],
                                                // 표만들기
                                                ['table', ['table']],
                                                // 글머리 기호, 번호매기기, 문단정렬
                                                ['para', ['ul', 'ol', 'paragraph']],
                                                // 줄간격
                                                ['height', ['height']],
                                                // 그림첨부, 링크만들기, 동영상첨부
                                                ['insert',['picture','link','video']],
                                                // 코드보기, 확대해서보기, 도움말
                                                ['view', ['codeview','fullscreen', 'help']]
                                            ];

                                        var setting = {
                                                height : 600,
                                                minHeight : null,
                                                maxHeight : null,
                                                focus : true,
                                                lang : 'ko-KR',
                                                placeholder:"내용을 입력하세요",
                                                toolbar : toolbar,
                                                callbacks : { // 이미지를 첨부하는 부분
                                                onImageUpload : function(files, editor,
                                                welEditable) {
                                                for (var i = files.length - 1; i >= 0; i--) {
                                                uploadSummernoteImageFile(files[i],
                                                this);
                                                        }
                                                    }
                                                }
                                            };

                                            $('#summernote').summernote(setting);
                                            });
                                </script>
                            </div>
                        </div>
                        <div class="btns">
                            <a href="boardlist.jsp" class="btn-list">목록</a>
                            <a class="btn-reset" onclick="func()">취소</a>
                            <input type="button" class="btn-submit" name="submit" value="게시" onclick="asdf()">
                        </div>
                    </form>
                </div>            
            </div>
        </section>
    </div>
</body>
</html>