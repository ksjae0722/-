package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.*;

public class PersonalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 커맨드 패턴의 .do만을 추출하기 위하여 문자열 전처리
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		// System.out.println(command);

		// 글자 깨지지않기 위해
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		/* 메인화면 이동 */
		if (command.equals("/professor/p_main.per")) {
			getSubject(request); //내과목
			requestBoardList(request); //과목별게시판
			getCalen(request); //학사일정
			getNotice(request); //공지사항
			RequestDispatcher rd = request.getRequestDispatcher("./p_main.jsp");
			rd.forward(request, response);
		}

		/* p_info로 이동 : db에서 교직원 정보 가져옴 */
		else if (command.equals("/professor/p_info.per")) {
			getdto(request);
			RequestDispatcher rd = request.getRequestDispatcher("./p_info.jsp");
			rd.forward(request, response);
		}

		/* p_info : 개인정보 수정 */
		else if (command.equals("/professor/modify_process.per")) {
			modify(request);
			RequestDispatcher rd = request.getRequestDispatcher("/professor/p_info.per");
			rd.forward(request, response);
		}

		/* p_lecture로 이동 */
		else if (command.equals("/professor/p_lecture.per")) {
			getSubject(request);
			getCountStu(request);
			RequestDispatcher rd = request.getRequestDispatcher("/professor/p_lecture.jsp");
			rd.forward(request, response);
		}
		
		/* p_popup_lecture로 이동*/
		else if (command.equals("/professor/p_popup_lecture.per"))
			{
			get_Stu_list(request);
			RequestDispatcher rd = request.getRequestDispatcher("/professor/p_popup_lecture.jsp");
			rd.forward(request, response);
			}

		/* p_exam로 이동 */
		else if (command.equals("/professor/p_exam.per")) {
			getSubject(request);
			Enumeration enu = request.getParameterNames();
			ArrayList<String> arr = new ArrayList<String>();
			while (enu.hasMoreElements()) {
				String ans = (String) enu.nextElement();
				arr.add(ans);
			}
			String ans = "";
			for (int i = 0; i < arr.size() - 1; i++) {
				ans = ans + request.getParameter(arr.get(i));
			}
			// System.out.println(ans);
			updateAnswer(ans, request);

			RequestDispatcher rd = request.getRequestDispatcher("./p_exam.jsp");
			rd.forward(request, response);
		}

		// p_popup_exam으로 이동
		else if (command.equals("/professor/p_popup_exam.per")) {
			getQuestion(request);
			RequestDispatcher rd = request.getRequestDispatcher("./p_popup_exam.jsp");
			rd.forward(request, response);
		}

		/* p_score로 이동 */
		else if (command.equals("/professor/p_score.per")) {
			getSubject(request);
			String listfirst = request.getParameter("subject");
			if (request.getParameter("subject") == null) {
				ArrayList<String> mylist = (ArrayList<String>) request.getAttribute("ssubject");
				listfirst = mylist.get(0);
			}
			getStudent(request, listfirst);
			String s_id = request.getParameter("student");
			getLecture(request, listfirst, s_id);
			RequestDispatcher rd = request.getRequestDispatcher("./p_score.jsp?subject=" + listfirst + "&student=" + s_id);
			rd.forward(request, response);
		}

		/* p_score : 성적처리정보 불러오기 */
		else if (command.equals("/professor/getScore.per")) {
			// System.out.println(request.getParameter("subject"));
			// System.out.println(request.getParameter("student"));
			String sub_name = request.getParameter("subject");
			String s_id = request.getParameter("student");
			getAnswer(request, sub_name, s_id);
			RequestDispatcher rd = request
					.getRequestDispatcher("/professor/p_score.per?subject=" + sub_name + "&student=" + s_id);
			rd.forward(request, response);
		}

		/* p_score : 학점계산 */
		else if (command.equals("/professor/calculator.per")) {
			calculate(request);
			String sub_name = request.getParameter("subject");
			String s_id = request.getParameter("student");
			RequestDispatcher rd = request
					.getRequestDispatcher("/professor/getScore.per?subject=" + sub_name + "&student=" + s_id);
			rd.forward(request, response);
		}
	}

	/* info 페이지 - db에서 data 가져오기 */
	public void getdto(HttpServletRequest request) {

		PersonalDAO dao = PersonalDAO.getInstance();
		PersonalDTO per_dto = new PersonalDTO();

		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("p_id");

		per_dto = dao.getinfo(p_id);

		request.setAttribute("p_id", p_id);
		request.setAttribute("dto", per_dto);

	}

	/* info 페이지 - data 업데이트 */
	public void modify(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("p_id");
		String p_adress = request.getParameter("p_adress");
		String p_phone = request.getParameter("p_phone");
		String p_email = request.getParameter("p_email");
		request.setAttribute("check", "1");

		PersonalDAO dao = PersonalDAO.getInstance();
		dao.update(p_adress, p_phone, p_email, p_id);
	}

	/* main 페이지 - 게시글 DB에서 불러오기 */
	public void requestBoardList(HttpServletRequest request) {

		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();

		int pageNum = 1;
		int limit = LISTCOUNT; // 한페이지에 10개 출력

		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		String subjects = request.getParameter("subjects");

		int TotalOfPost = dao.getListCount(subjects);
		boardlist = dao.getBoardList(pageNum, limit, subjects);

		int total_page;

		if (TotalOfPost == 0) {
			total_page = 1;
		} else if (TotalOfPost % limit == 0) {
			total_page = TotalOfPost / limit;
			Math.floor(total_page);
		} else {
			total_page = TotalOfPost / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("TotalOfPost", TotalOfPost);
		request.setAttribute("boardlist", boardlist);
	}

	/* 내 과목 DB에서 가져오기 */
	public void getSubject(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("p_id");
		ArrayList<String> sub_list = new ArrayList<String>();

		BoardDAO dao = BoardDAO.getInstance();

		sub_list = dao.getmySubject(p_id);
		// System.out.println(sub_list.get(0)+"과목 가져오는지 확인");
		request.setAttribute("ssubject", sub_list);
	}

	/* db에서 calendar 어레이스트 가져오기 */
	public void getCalen(HttpServletRequest request) {
		calendarDAO dao = calendarDAO.getInstance();
		ArrayList<calendarDTO> callist = new ArrayList<calendarDTO>();

		int CpageNum = 1;
		int limit = 4;

		if (request.getParameter("CpageNum") != null) {
			CpageNum = Integer.parseInt(request.getParameter("CpageNum"));
		}

		int totalofcalendar = dao.getListCount();
		// System.out.println(totalofcalendar+"캘린더 총 갯수 확인");
		callist = dao.getCallist(CpageNum, limit);
		// System.out.println(callist.get(2).getCal_contents()+"캘린더 들고오는지 확인");

		int totalpage;
		if (totalofcalendar == 0)
			totalpage = 1;
		else if (totalofcalendar % limit == 0) {
			totalpage = totalofcalendar / limit;
			Math.floor(totalpage);
		} else {
			totalpage = totalofcalendar / limit;
			Math.floor(totalpage);
			totalpage = totalpage + 1;
		}

		request.setAttribute("CpageNum", CpageNum);
		request.setAttribute("Ctotalpage", totalpage);
		// request.setAttribute("totalofcalendar", totalofcalendar);
		request.setAttribute("callist", callist);
	}

	/* 시험출제페이지 : 문제 불러오기 */
	public void getQuestion(HttpServletRequest request) {
		String sub_name = request.getParameter("subject");

		ArrayList<QuestionDTO> queDTO_list = new ArrayList<QuestionDTO>();
		QuestionDAO queDAO = QuestionDAO.getInstance();

		queDTO_list = queDAO.getExam(sub_name);

		request.setAttribute("sub_name", sub_name);
		request.setAttribute("queDTO_list", queDTO_list);
	}

	/* 시험출제페이지 : 문제 답 업데이트 */
	public void updateAnswer(String ans, HttpServletRequest request) {
		String subject_name = request.getParameter("subject_name");
		QuestionDAO queDAO = QuestionDAO.getInstance();
		// System.out.println(ans);
		// System.out.println(subject_name);

		queDAO.updateAnswer(ans, subject_name);
		queDAO.insertAnswer(ans, subject_name);
	}

	/* 수강신청현황 페이지 : 과목별 학생 수 가져옴 */
	public void getCountStu(HttpServletRequest request) {
		ArrayList<String> sbDTO = (ArrayList<String>) request.getAttribute("ssubject");
		applicationDAO dao = applicationDAO.getInstance();
		Map<String, Integer> cmap = new HashMap<>();

		for (int i = 0; i < sbDTO.size(); i++) {
			cmap.put(sbDTO.get(i), dao.getCount(sbDTO.get(i)));
		}
		request.setAttribute("cmap", cmap);
		// System.out.println(sbDTO.get(1));
		// System.out.println(cmap.get(sbDTO.get(1)));

		/*
		 * for(int i=0; i<sbDTO.size(); i++) {
		 * System.out.println(sbDTO.get(i)+":"+cmap.get(sbDTO.get(i)));
		 * 
		 * }
		 */
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

	// *성적산출 페이지 : 과목별 학생 수강신청테이블에서 가져오기, 수업일수가져오기*/
	public void getStudent(HttpServletRequest request, String listfirst) {
		applicationDAO apDAO = applicationDAO.getInstance();
		ArrayList<StudentDTO> st_list = apDAO.getStudentList(listfirst);
		request.setAttribute("st_list", st_list);
		PersonalDAO dao = PersonalDAO.getInstance();
		String suballday = dao.getstudyday(listfirst);
		request.setAttribute("suballday", suballday);
	}

	/* 성적산출 페이지 : 답안지들고와서 비교하기 */
	public void getAnswer(HttpServletRequest request, String sub_name, String s_id) {
		QuestionDAO qDAO = QuestionDAO.getInstance();
		String Answer = qDAO.AnswerSheet(sub_name, s_id);
		String correct = qDAO.CorrectSheet(sub_name);
		String[] compare = new String[correct.length()];
		int point = 0;
		if (!Answer.equals("")) {
			for (int i = 0; i < correct.length(); i++) {
				if (correct.charAt(i) == Answer.charAt(i)) {
					compare[i] = "1";
					point += 5;
				} else {
					compare[i] = "2";
				}
			}
			scoreDTO scDTO = new scoreDTO();
			scDTO.setAnswer(Answer);
			scDTO.setCompare(compare);
			scDTO.setCorrect(correct);
			scDTO.setPoint(point);

			request.setAttribute("scDTO", scDTO);

			// System.out.println(Answer);
		}
	}

	/* 성적산출 페이지 : 강의테이블에서 강의정보 들고오기 */
	public void getLecture(HttpServletRequest request, String sub_name, String s_id) {
		PersonalDAO dao = PersonalDAO.getInstance();
		lectureDTO lecdto = dao.getlec(sub_name, s_id);
		request.setAttribute("lecdto", lecdto);

	}

	/* 성적산출 페이지 : 계산 */
	public void calculate(HttpServletRequest request) {
		PersonalDAO dao = PersonalDAO.getInstance();
		String sub_name = request.getParameter("subject");
		String s_id = request.getParameter("student");
		int score = Integer.valueOf(request.getParameter("lec_score"));
		int absence = Integer.valueOf(request.getParameter("absence"));
		double total;
		String lec_point = request.getParameter("point");

		if (!lec_point.equals("F") || absence < 4) {
			total = (score * 0.8) + (20 - absence * 5);

			if (total >= 95) {
				lec_point = "A+";
			} else if (total >= 90) {
				lec_point = "A";
			} else if (total >= 85) {
				lec_point = "B+";
			} else if (total >= 80) {
				lec_point = "B";
			} else if (total >= 75) {
				lec_point = "C+";
			} else if (total >= 70) {
				lec_point = "C";
			} else if (total >= 65) {
				lec_point = "D+";
			} else if (total >= 60) {
				lec_point = "D";
			} else {
				lec_point = "F";
			}
		}

		lectureDTO lec_dto = dao.getlec(sub_name, s_id);
		if (lec_dto.getLec_score() == null) {
			dao.putScore(sub_name, s_id, lec_point, absence);
		} else {
			dao.updateScore(sub_name, s_id, lec_point, absence);
		}
		request.setAttribute("msg", "1");
	}
	
	public void get_Stu_list(HttpServletRequest request)
		{
		String subject_name = request.getParameter("subject_name");
		
		applicationDAO appDAO = applicationDAO.getInstance();
		
		ArrayList<StudentDTO> stuArr = appDAO.get_Stu_list(subject_name);
		
		request.setAttribute("subject_name", subject_name);
		request.setAttribute("stuArr", stuArr);
		}
}