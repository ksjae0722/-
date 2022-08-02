package mvc.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.*;

public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
		doPost(request, response);
		}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		//System.out.println(command);
		//System.out.println(contextPath);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		/*메인화면 이동*/
		if(command.equals("/student/s_main.so"))
			{
	         getCalen(request); //학사일정
	         getmySubjectlist(request); //내과목
	         requestBoardList(request); //과목별게시판
	         getNotice(request); //공지사항
	         RequestDispatcher rd = request.getRequestDispatcher("./s_main.jsp");
	         rd.forward(request, response);
			}
		/*s_info로 이동*/
		else if(command.equals("/student/s_info.so")) {
			getdto(request);
			RequestDispatcher rd = request.getRequestDispatcher("./s_info.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/student/modify_process.so")) {
			modify(request);
			RequestDispatcher rd = request.getRequestDispatcher("/student/s_info.so");
			rd.forward(request, response);
		}
		/*s_subject(수강신청)로 이동*/
		else if(command.equals("/student/s_subject.so")) {
			RequestgetMajor(request);
			getSubject(request);
			getmySubjectlist(request);
			RequestDispatcher rd = request.getRequestDispatcher("./s_subject.jsp");
			rd.forward(request, response);
		}
		
		/*수강신청 과목담기*/
		else if(command.equals("/student/subjectProcess.so")) {
			int number = RequestsubProcess(request);
			if(number==5) {
				setmySubject(request);
				RequestDispatcher rd = request.getRequestDispatcher("/student/s_subject.so?type="+number);
				rd.forward(request, response);	
			}
			else {
				response.sendRedirect("http://localhost:8080/pro5_lms/student/s_subject.so?type="+number);
			}
		}
		
		/*수강신청 삭제*/
		else if(command.equals("/student/deleteProcess.so")) {
			//System.out.println("여기까지 오는지 확인");
			RequestdeleteProcess(request);
			RequestDispatcher rd = request.getRequestDispatcher("/student/s_subject.so?type=4");
			rd.forward(request, response);	
		}
		
		/*s_schedule로 이동*/
		else if(command.equals("/student/s_schedule.so")) {
			getmySubjectlist(request);
			getweekMap(request);
			RequestDispatcher rd = request.getRequestDispatcher("./s_schedule.jsp");
			rd.forward(request, response);
		}
		/*s_exam로 이동*/
		else if(command.equals("/student/s_exam.so")) {
			ArrayList<ssubjectDTO> mySubList = getmySubjectlist(request);
			isTest(mySubList, request);
			
			Enumeration enu = request.getParameterNames();
			ArrayList<String> arr = new ArrayList<String>();
			while(enu.hasMoreElements())
				{
				String ans = (String)enu.nextElement();
				arr.add(ans);
				}
			String ans = "";
			for(int i = 0; i < arr.size()-1; i++)
				{
				ans = ans + request.getParameter(arr.get(i));
				}
			
			updateAnswer(ans, request);
			
			stu_getAnswer(request, mySubList);
			RequestDispatcher rd = request.getRequestDispatcher("./s_exam.jsp");
			rd.forward(request, response);
		}
		
		/*s_popup_exam로 이동*/
		else if(command.equals("/student/s_popup_exam.so"))
			{
			getQuestion(request);
			RequestDispatcher rd = request.getRequestDispatcher("./s_popup_exam.jsp");
			rd.forward(request, response);
			}
		
		/*s_inquiry로 이동*/
		else if(command.equals("/student/s_inquiry.so")) {
			inquiry(request);
			getisuhakjum(request);
			calculatetotal(request);
			RequestDispatcher rd = request.getRequestDispatcher("./s_inquiry.jsp");
			rd.forward(request, response);
		}	
		
		/*main 페이지 - s_post로 이동*/
		else if(command.equals("/student/s_post.so")) {
			RequestDispatcher rd = request.getRequestDispatcher("./s_post.jsp");
			rd.forward(request, response);
		}		
		
	}
	/*info - db에서 data가져오기*/
	public void getdto(HttpServletRequest request) {
		
		StudentDAO dao = StudentDAO.getInstance();
		StudentDTO stu_dto = new StudentDTO();
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		//System.out.println(s_id+"session에서 아이디 가져오는지 확인");
		
		stu_dto = dao.getinfo(s_id);
		//System.out.println(stu_dto.getS_email()+"db에서 가져오는지 확인");
		
		request.setAttribute("s_id", s_id);
		request.setAttribute("dto", stu_dto);
		
	}
	
	// 공지사항 가져와서 메인에 보여주기
		public void getNotice(HttpServletRequest request) {
			notice_boardDAO nbDAO = notice_boardDAO.getInstance();
			ArrayList<notice_boardDTO> nbArr = new ArrayList<notice_boardDTO>();

			int nbPageNum = 1;
			int limit = 4;

			if (request.getParameter("nbPageNum") != null) {
				nbPageNum = Integer.parseInt(request.getParameter("nbPageNum"));
			}

			int totalOfNotice = nbDAO.getListCount();

			nbArr = nbDAO.getBoardList(nbPageNum, limit);

			int totalpage;

			if (totalOfNotice == 0) {
				totalpage = 1;
			}

			else if (totalOfNotice % limit == 0) {
				totalpage = totalOfNotice / limit;
				Math.floor(totalpage);
			}

			else {
				totalpage = totalOfNotice / limit;
				Math.floor(totalpage);
				totalpage = totalpage + 1;
			}

			request.setAttribute("nbPageNum", nbPageNum);
			request.setAttribute("nbtotalpage", totalpage);
			request.setAttribute("nbArr", nbArr);
		}
	
	/*info - data 업데이트*/
	public void modify(HttpServletRequest request) {
		
		//System.out.println("확인");
		HttpSession session = request.getSession();
		String s_id = (String) session.getAttribute("s_id");
		String s_address = request.getParameter("s_address");
		String s_phone = request.getParameter("s_phone");
		String s_email = request.getParameter("s_email");
		String s_account1 = request.getParameter("s_account1");
		String s_account2 = request.getParameter("s_account2");
		String s_account3 = request.getParameter("s_account3");

		request.setAttribute("check", "1");
		
		StudentDAO dao = StudentDAO.getInstance();
		dao.update(s_address, s_phone, s_email, s_account1, s_account2, s_account3, s_id);
	}
	
	/*subject - 수강신청 과목정보 가져오기*/
	public void getSubject(HttpServletRequest request) {

		StudentDAO dao = StudentDAO.getInstance();
		ArrayList<ssubjectDTO> sublist = new ArrayList<ssubjectDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		int TotalOfSubject;
		
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String major = request.getParameter("sel_sub");
		
		if(major==null) {
			major = "major_all";
		} //페이지 넘길때 null일 수 있으므로 
		
		String namecode = request.getParameter("code");
		
		if(namecode==null) {
			TotalOfSubject = dao.s_getListCount(major);
			sublist = dao.s_getSubjectList(pageNum, limit, major);
		}
		else {
			TotalOfSubject = dao.s_searchListCount(namecode);
			//System.out.println("namecode들고가서 몇개들고오는지: " + TotalOfSubject );
			sublist = dao.searchSubjectList(pageNum, limit, namecode);
		}

		int total_page;
		
		if(TotalOfSubject==0) {
			total_page=1;
		}
		else if(TotalOfSubject % limit == 0) {
			total_page = TotalOfSubject/limit;
			Math.floor(total_page);
		}
		else {
			 total_page =TotalOfSubject/limit;
			 Math.floor(total_page);
			 total_page =  total_page + 1;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page); 
		request.setAttribute("TotalOfSubject", TotalOfSubject); //전체 과목 수
		request.setAttribute("sublist", sublist);
		request.setAttribute("searchmajor", major);
		
	}
	
	/*모든 학과 들고오기*/
	public void RequestgetMajor(HttpServletRequest request) {
		
		StudentDAO dao = StudentDAO.getInstance();
		ArrayList<departmentDTO> majorlist = dao.getMajor();
		
		request.setAttribute("majorlist", majorlist);
	}
	
	/*수강신청 처리*/
	public int RequestsubProcess(HttpServletRequest request) {
		//System.out.println("1");
		int number=5;
		
		
		String sub_code = request.getParameter("subject"); //선택과목 고유코드
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		
		StudentDAO dao = StudentDAO.getInstance(); 
		ssubjectDTO subjectDTO = dao.getssubjectDTO(sub_code); //선택과목 DTO
		StudentDTO s_DTO = dao.getinfo(s_id); //학생정보 DTO 
		
		String day; //요일
		String[] classtime; //수강신청한 과목들의 수업시간
		String[] subjecttime = subjectDTO.getSub_classtime().split(","); //선택과목 수업시간 분리
		ArrayList<String[]> time = new ArrayList<String[]>(); 
		ArrayList<ssubjectDTO> list = null; //수강신청한 과목(DTO)들의 arraylist
		
		int count = dao.countmySubject(s_id); //수강신청한 과목 갯수세는 함수
		
		//1. 과목 최대수강인원 비교
		int numOfstudent = dao.numberOfstudent(sub_code);
		numOfstudent = numOfstudent+1;
		
		if(numOfstudent>subjectDTO.getSub_max()) {
			number = 3;
			return number;
		}

		//* 수강신청이 되어있지않은 경우
		if(count==0) {
			return number;
		}

		list = dao.mySubject(s_id);
		
		//2. 내 최대학점과 비교
		int sub_hakjum = subjectDTO.getSub_hakjum();
		int s_hakjum = s_DTO.getS_max();
		int hakjum = sub_hakjum + s_hakjum;
		
		if(hakjum>18) {
			number = 1;
			return number;
		}

		//4. 요일비교
		for(int i=0; i<list.size(); i++) {
			day = list.get(i).getSub_day();
			if(day.equals(subjectDTO.getSub_day())) {
				classtime = list.get(i).getSub_classtime().split(",");
				time.add(classtime);
			}
		}

		if(time.size()==0) {
			return number;
		}
		
		//5. 시간비교
		for(int i=0; i<time.size(); i++) {
			for(int j=0; j<time.get(i).length; j++) {
				String compare = (time.get(i))[j];

				if(compare.equals(subjecttime[0])) {
					number = 2;
					return number;
				}
				else if(compare.equals(subjecttime[1])) {
					number = 2;
					return number;
				}
				else if(compare.equals(subjecttime[2])){
					number = 2;
					return number;
				}
			}
		}
		return number;
	}	
	
	/*선택한 과목 수강신청에 넣기*/
	public void setmySubject(HttpServletRequest request) {
		String sub_code = request.getParameter("subject"); //선택과목 고유코드
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		
		StudentDAO dao = StudentDAO.getInstance();
		QuestionDAO queDAO = QuestionDAO.getInstance();
		
		ssubjectDTO subjectDTO = dao.getssubjectDTO(sub_code); //선택과목 DTO
		String s_name = subjectDTO.getSub_name(); //선택과목 이름
		StudentDTO s_DTO = dao.getinfo(s_id); //학생정보 DTO 
		
		int sub_hakjum = subjectDTO.getSub_hakjum();
		int s_hakjum = s_DTO.getS_max();
		int hakjum = sub_hakjum + s_hakjum;
		
		dao.plusSubject(sub_code, s_id, s_name);
		dao.updatehakjum(hakjum, s_id);
		queDAO.insertStuDabjiList(s_name, s_id);
	}
	
	/*내 수강과목 가져오기*/
	public ArrayList<ssubjectDTO> getmySubjectlist(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		
		StudentDAO dao = StudentDAO.getInstance();
		ArrayList<ssubjectDTO> mylist = dao.mySubject(s_id);
		request.setAttribute("mylist", mylist);
		return mylist;
	}

	/*선택한 과목 수강신청에서 삭제하기*/
	public void RequestdeleteProcess(HttpServletRequest request) {
		String sub_code = request.getParameter("subject"); //선택과목 고유코드
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		
		StudentDAO dao = StudentDAO.getInstance();
		QuestionDAO queDAO = QuestionDAO.getInstance();
		
		ssubjectDTO subjectDTO = dao.getssubjectDTO(sub_code); //선택과목 DTO
		String sub_name = subjectDTO.getSub_name();
		StudentDTO s_DTO = dao.getinfo(s_id); //학생정보 DTO
		String s_name = subjectDTO.getSub_name(); //선택과목 이름
		
		int sub_hakjum = subjectDTO.getSub_hakjum();
		int s_hakjum = s_DTO.getS_max();
		int hakjum = s_hakjum-sub_hakjum;
		
		dao.deleteSubject(sub_code, s_id);
		dao.updatehakjum(hakjum, s_id);
		queDAO.deleteStuDabjiList(s_name, s_id);
		//시험 성적 처리에서 삭제
		dao.deletelecture(s_id, sub_name);
		
	}

	/*시간표 출력 전처리*/
	public void getweekMap(HttpServletRequest request) {
		Map<String, ssubjectDTO> tmap = new HashMap<>();
		ArrayList<ssubjectDTO> mylist = (ArrayList<ssubjectDTO>) request.getAttribute("mylist");
		
		for(int i=0; i<mylist.size(); i++) {
			ssubjectDTO dto = mylist.get(i);
			String day = dto.getSub_day();
			int hakjum = dto.getSub_hakjum();
			int start = dto.getSub_time();
			
			for(int j=start; j<start+hakjum; j++) {
				tmap.put(day+j, dto);
			}
		}
		
		request.setAttribute("tmap", tmap);
	}
	
	/*해당 과목 문제 가져오기*/
	public void getQuestion(HttpServletRequest request)
		{
		String sub_name = request.getParameter("subject");
		
		ArrayList<QuestionDTO> queDTO_list = new ArrayList<QuestionDTO>();
		QuestionDAO queDAO = QuestionDAO.getInstance();
		
		queDTO_list = queDAO.getExam(sub_name);
		
		request.setAttribute("sub_name", sub_name);
		request.setAttribute("queDTO_list", queDTO_list);
		}
	
	/* 시험이 출제되었는지 확인 */
	public void isTest(ArrayList<ssubjectDTO> mySubList, HttpServletRequest request)
		{
		QuestionDAO queDAO = QuestionDAO.getInstance();
		
		ArrayList<QuestionDTO> isTest_List = queDAO.isTest(mySubList);
		
		request.setAttribute("isTest_List", isTest_List);
		}
	
	/*제출 답안 저장*/
	public void updateAnswer(String ans, HttpServletRequest request)
		{
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid);
		
		String subject_name = request.getParameter("subject_name");
		QuestionDAO queDAO = QuestionDAO.getInstance();
		//System.out.println(ans);
		//System.out.println(subject_name);
		
		queDAO.stu_insertAnswer(ans, subject_name, s_id);
		}
	
	/*이미 답안을 제출했는지 확인*/
	public void stu_getAnswer(HttpServletRequest request, ArrayList<ssubjectDTO> mySubList)
		{
		QuestionDTO queDTO;
		QuestionDAO queDAO = QuestionDAO.getInstance();
		ArrayList<QuestionDTO> queDTO_List = new ArrayList<QuestionDTO>();
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid);

		for(int i=0; i < mySubList.size(); i++)
			{
			ssubjectDTO subDTO = mySubList.get(i);
			String subject_name = subDTO.getSub_name();
			queDTO = queDAO.stu_getAnswer(subject_name, s_id);
			
			queDTO_List.add(queDTO);
			}
		
		request.setAttribute("queDTO_List", queDTO_List);
		}
	
	/*main페이지 - 게시글 DB에서 불러오기*/
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
	      
		int pageNum = 1;
		int limit = 10; //한페이지에 10개 출력
	  
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
	  
		String subjects = request.getParameter("subjects");
	  
	  
		int TotalOfPost = dao.getListCount(subjects);
	  
		boardlist = dao.getBoardList(pageNum, limit, subjects);
	  
	  
		int total_page;
	  
	  
		if(TotalOfPost==0) {
			total_page=1;
		}
		else if(TotalOfPost % limit == 0) {
			total_page = TotalOfPost/limit;
			Math.floor(total_page);
		}
		else {
			total_page =TotalOfPost/limit;
			Math.floor(total_page);
			total_page =  total_page + 1;
		}
	  
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
	}

	/*DB에서 calendar 어레이스트 가져오기*/
	public void getCalen(HttpServletRequest request) {
	      
		calendarDAO dao = calendarDAO.getInstance();
	        
		ArrayList<calendarDTO> callist = new ArrayList<calendarDTO>();
	         
	         
		int CpageNum = 1;
	         
		int limit = 4;
	         
	         
		if(request.getParameter("CpageNum")!=null) {
            CpageNum=Integer.parseInt(request.getParameter("CpageNum"));
        }
         
         
		int totalofcalendar = dao.getListCount();        
		//System.out.println(totalofcalendar+"캘린더 총 갯수 확인");
    	callist = dao.getCallist(CpageNum,limit);
		//System.out.println(callist.get(2).getCal_contents()+"캘린더 들고오는지 확인");
         
        int Ctotalpage;
        if(totalofcalendar==0)
        	Ctotalpage=1;
        else if(totalofcalendar % limit == 0) {
        	Ctotalpage = totalofcalendar/limit;
        	Math.floor(Ctotalpage);
        }
        else {
        	Ctotalpage =totalofcalendar/limit;
            Math.floor(Ctotalpage);
            Ctotalpage =  Ctotalpage + 1;
        } 
        request.setAttribute("CpageNum", CpageNum);
        request.setAttribute("Ctotalpage", Ctotalpage);
        //request.setAttribute("totalofcalendar", totalofcalendar);
        request.setAttribute("callist", callist);
	}   

	/*성적조회 페이지 - 내 성적 들고오기*/
	public void inquiry(HttpServletRequest request) {
		StudentDAO dao = StudentDAO.getInstance();
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid);
		
		ArrayList<lectureDTO> scorelist = dao.inquirylist(s_id);
		//System.out.println(scorelist.get(0).getSub_name());
		request.setAttribute("scorelist", scorelist);
	}

	/*성적조회 페이지 - 이수구분 들고오기*/
	public void getisuhakjum(HttpServletRequest request) {
		StudentDAO dao = StudentDAO.getInstance();
		
		ArrayList<lectureDTO> scorelist = (ArrayList<lectureDTO>) request.getAttribute("scorelist");
		ArrayList<ssubjectDTO> isuhakjum = new ArrayList<ssubjectDTO>();
		
		for(int i=0; i<scorelist.size(); i++) {
			String subject = scorelist.get(i).getSub_name();
			ssubjectDTO dto = dao.isuhakjumlist(subject);
			isuhakjum.add(dto);
		}
		
		request.setAttribute("isuhakjum", isuhakjum);
	}
	
	/*성적조회 페이지 - 학점, 평점계산*/
	public void calculatetotal(HttpServletRequest request) {
		ArrayList<lectureDTO> scorelist = (ArrayList<lectureDTO>) request.getAttribute("scorelist");
		ArrayList<ssubjectDTO> isuhakjum = (ArrayList<ssubjectDTO>) request.getAttribute("isuhakjum");
		int totalhakjum=0; //총 신청학점
		int gethakjum=0; //총 취득학점
		float finalscore=0; //총 평점
		float average=0;
		
		//총 신청학점
		for(int i=0; i<isuhakjum.size(); i++) {
			totalhakjum += isuhakjum.get(i).getSub_hakjum();
		}
		
		//총 취득학점
		for(int i=0; i<scorelist.size(); i++) {
			if(!scorelist.get(i).getLec_score().equals("F")) {
				if(scorelist.get(i).getSub_name().equals(isuhakjum.get(i).getSub_name())) {
					gethakjum += isuhakjum.get(i).getSub_hakjum();
				}
			}
		}
		
		int count=0;
		//평균평점
		for(int i=0; i<scorelist.size(); i++) {
			String score = scorelist.get(i).getLec_score();
			if(score.equals("A+")) {
				finalscore += 4.5;
			}else if(score.equals("A")) {
				finalscore += 4.0;
			}else if(score.equals("B+")) {
				finalscore += 3.5;
			}else if(score.equals("B")) {
				finalscore += 3.0;
			}else if(score.equals("C+")) {
				finalscore += 2.5;
			}else if(score.equals("C")) {
				finalscore += 2.0;
			}else if(score.equals("D+")) {
				finalscore += 1.5;
			}else if(score.equals("D+")) {
				finalscore += 1.0;
			}else if(score.equals("F")) {
				count++;
			}
		}
		
		// 총학점/(과목수-F학점과목수)
		average = (float) finalscore/(scorelist.size()-count);
		
		
		
//		System.out.println(totalhakjum);
//		System.out.println(gethakjum);
//		System.out.println(finalscore);
//		System.out.println(average);
		
		request.setAttribute("totalhakjum", totalhakjum);
		request.setAttribute("gethakjum", gethakjum);
		request.setAttribute("average", average);
	}
	/*수강과목 요일별로 담기*///============>삭제예정
//	public void getWeekSubList(HttpServletRequest request) {
//
//		ArrayList<ssubjectDTO> mylist = (ArrayList<ssubjectDTO>) request.getAttribute("mylist");
//		//System.out.println("리스트가져오는지 확인:"+mylist.get(0).getSub_name());
//		
//		StudentDAO dao = StudentDAO.getInstance();
//		
//		ArrayList<ssubjectDTO> MonList = dao.lineupWeek(mylist, "월요일");
//		
////		for(int i=0; i<MonList.size(); i++) {
////			System.out.println(MonList.get(i).getSub_name());
////		}
//		
//		request.setAttribute("MonList", MonList);
//		
//	}
}
