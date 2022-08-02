package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import config.AppCtx;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.PersonalDAO;
import mvc.model.QuestionDAO;
import mvc.model.QuestionDTO;
import mvc.model.Remember;
import mvc.model.StudentDAO;
import mvc.model.StudentDTO;
import mvc.model.applicationDAO;
import mvc.model.calendarDAO;
import mvc.model.calendarDTO;
import mvc.model.departmentDTO;
import mvc.model.lectureDTO;
import mvc.model.notice_boardDAO;
import mvc.model.notice_boardDTO;
import mvc.model.ssubjectDTO;

@Controller
@RequestMapping("/student")
public class StudentController
	{
	AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
	private applicationDAO a_dao;
	private BoardDAO b_dao;
	private calendarDAO c_dao;
	private notice_boardDAO nb_dao;
	private QuestionDAO q_dao;
	private StudentDAO s_dao;
	
	@RequestMapping("/s_main")
	public String s_main(Model model, HttpSession session, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "CpageNum", required = false) String c_PageNum, @RequestParam(value = "nbPageNum", required = false) String nb_PageNum, @RequestParam(value = "subjects", required = false) String subjects)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String s_id = remember.getId();
		
		getCalen(model, c_PageNum); //학사일정
		getmySubjectlist(model, s_id); //내과목
		requestBoardList(model, PageNum, subjects); //과목별게시판
		getNotice(model, nb_PageNum); //공지사항
		
		return "board/s_main";
		}
	
	@RequestMapping("/s_info")
	public String s_info(Model model, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String s_id = remember.getId();
		
		getdto(model, s_id);
		
		return "board/s_info";
		}
	
	@RequestMapping("/modify_process")
	public String modify_process(Model model, HttpSession session, @RequestParam(value = "s_address") String s_address, @RequestParam(value = "s_phone") String s_phone, @RequestParam(value = "s_email") String s_email, @RequestParam(value = "s_account1") String s_account1, @RequestParam(value = "s_account2") String s_account2, @RequestParam(value = "s_account3") String s_account3)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String s_id = remember.getId();
		
		modify(model, s_id, s_address, s_phone, s_email, s_account1, s_account2, s_account3);
		getdto(model, s_id);
		
		return "board/s_info";
		}
	
	@RequestMapping("/s_subject")
	public String s_subject(Model model, HttpSession session, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "sel_sub", required = false) String sel_sub, @RequestParam(value = "code", required = false) String code)
		{
		RequestgetMajor(model);
		getSubject(model, PageNum, sel_sub, code);
		getmySubjectlist(request);
		
		return "board/s_subject";
		}
	
	
	
	/*info - db에서 data가져오기*/
	public void getdto(Model model, String sid)
		{
		int s_id = Integer.parseInt(sid);
		
		StudentDTO stu_dto = s_dao.getinfo(s_id);
		
		model.addAttribute("s_id", s_id);
		model.addAttribute("dto", stu_dto);
		}
	
	// 공지사항 가져와서 메인에 보여주기
		public void getNotice(Model model, String nb_pageNum)
			{
			int nbPageNum = 1;
			int limit = 4;

			if (nb_pageNum != null)
				{
				nbPageNum = Integer.parseInt(nb_pageNum);
				}

			int totalOfNotice = nb_dao.getListCount();

			ArrayList<notice_boardDTO> nbArr = nb_dao.getBoardList(nbPageNum, limit);

			int totalpage;

			if (totalOfNotice == 0)
				{
				totalpage = 1;
				}

			else if (totalOfNotice % limit == 0)
				{
				totalpage = totalOfNotice / limit;
				Math.floor(totalpage);
				}

			else
				{
				totalpage = totalOfNotice / limit;
				Math.floor(totalpage);
				totalpage = totalpage + 1;
				}

			model.addAttribute("nbPageNum", nbPageNum);
			model.addAttribute("nbtotalpage", totalpage);
			model.addAttribute("nbArr", nbArr);
			}
	
	/*info - data 업데이트*/
	public void modify(Model model, String s_id, String s_address, String s_phone, String s_email, String s_account1, String s_account2, String s_account3)
		{
		model.addAttribute("check", "1");
		
		s_dao.update(s_address, s_phone, s_email, s_account1, s_account2, s_account3, s_id);
		}
	
	/*subject - 수강신청 과목정보 가져오기*/
	public void getSubject(Model model, String PageNum, String sel_sub, String code)
		{
		int pageNum = 1;
		int limit = 5;
		int TotalOfSubject;
		
		if(PageNum!=null)
			{
			pageNum=Integer.parseInt(PageNum);
			}
		
		if(sel_sub==null)
			{
			sel_sub = "major_all";
			} //페이지 넘길때 null일 수 있으므로 
		
		ArrayList<ssubjectDTO> sublist;
		
		if(code==null)
			{
			TotalOfSubject = s_dao.s_getListCount(sel_sub);
			sublist = s_dao.s_getSubjectList(pageNum, limit, sel_sub);
			}
		
		else
			{
			TotalOfSubject = s_dao.s_searchListCount(code);
			sublist = s_dao.searchSubjectList(pageNum, limit, code);
			}

		int total_page;
		
		if(TotalOfSubject==0)
			{
			total_page=1;
			}
		
		else if(TotalOfSubject % limit == 0)
			{
			total_page = TotalOfSubject/limit;
			Math.floor(total_page);
			}
		else
			{
			total_page =TotalOfSubject/limit;
			Math.floor(total_page);
			total_page =  total_page + 1;
			}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page); 
		request.setAttribute("TotalOfSubject", TotalOfSubject); //전체 과목 수
		request.setAttribute("sublist", sublist);
		request.setAttribute("searchmajor", sel_sub);
		
	}
	
	/*모든 학과 들고오기*/
	public void RequestgetMajor(Model model)
		{
		ArrayList<departmentDTO> majorlist = s_dao.getMajor();
		
		model.addAttribute("majorlist", majorlist);
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
	public ArrayList<ssubjectDTO> getmySubjectlist(Model model, String sid)
		{
		int s_id = Integer.parseInt(sid); 
		
		ArrayList<ssubjectDTO> mylist = s_dao.mySubject(s_id);
		model.addAttribute("mylist", mylist);
		
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
	public void requestBoardList(Model model, String PageNum, String subjects)
		{
		int pageNum = 1;
		int limit = 10; //한페이지에 10개 출력
	  
		if(PageNum!=null)
			{
			pageNum=Integer.parseInt(PageNum);
			}

		int TotalOfPost = b_dao.getListCount(subjects);

		ArrayList<BoardDTO> boardlist = b_dao.getBoardList(pageNum, limit, subjects);

		int total_page;

		if(TotalOfPost==0)
			{
			total_page=1;
			}
		
		else if(TotalOfPost % limit == 0)
			{
			total_page = TotalOfPost/limit;
			Math.floor(total_page);
			}
		
		else
			{
			total_page =TotalOfPost/limit;
			Math.floor(total_page);
			total_page =  total_page + 1;
			}
	  
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("total_page", total_page);
		model.addAttribute("boardlist", boardlist);
		}

	/*DB에서 calendar 어레이스트 가져오기*/
	public void getCalen(Model model, String c_PageNum)
		{
		int CpageNum = 1;
		int limit = 4;
			 
		if(c_PageNum!=null)
			{
			CpageNum=Integer.parseInt(c_PageNum);
			}
		
		int totalofcalendar = c_dao.getListCount();
		ArrayList<calendarDTO> callist = c_dao.getCallist(CpageNum,limit);
		 
		int Ctotalpage;
		
		if(totalofcalendar==0)
			{
			Ctotalpage=1;
			}
		
		else if(totalofcalendar % limit == 0)
			{
			Ctotalpage = totalofcalendar/limit;
			Math.floor(Ctotalpage);
			}
		
		else
			{
			Ctotalpage =totalofcalendar/limit;
			Math.floor(Ctotalpage);
			Ctotalpage =  Ctotalpage + 1;
			}
		
		model.addAttribute("CpageNum", CpageNum);
		model.addAttribute("Ctotalpage", Ctotalpage);
		model.addAttribute("callist", callist);
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
	}