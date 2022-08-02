package controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import config.AppCtx;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.PersonalDAO;
import mvc.model.PersonalDTO;
import mvc.model.QuestionDAO;
import mvc.model.QuestionDTO;
import mvc.model.Remember;
import mvc.model.StudentDTO;
import mvc.model.applicationDAO;
import mvc.model.calendarDAO;
import mvc.model.calendarDTO;
import mvc.model.lectureDTO;
import mvc.model.notice_boardDAO;
import mvc.model.notice_boardDTO;
import mvc.model.scoreDTO;

@Controller
@RequestMapping("/professor")
public class PersonalController
	{
	AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
	private applicationDAO a_dao;
	private BoardDAO b_dao;
	private calendarDAO c_dao;
	private notice_boardDAO nb_dao;
	private PersonalDAO p_dao;
	private QuestionDAO q_dao;
	
	@RequestMapping("/p_main") // 寃뚯떆�뙋 �씠�뒋�엳�쓬 �굹以묒뿉 瑗� �솗�씤�븷 寃�
	public String p_main(Model model, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "CpageNum", required = false) String c_PageNum, @RequestParam(value = "nbPageNum", required = false) String nb_PageNum, @RequestParam(value = "subjects", required = false) String subjects, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		b_dao = ctx.getBean("boardDAO", BoardDAO.class);
		ArrayList<String> sub_list;
		sub_list = b_dao.getmySubject(p_id);
		model.addAttribute("ssubject", sub_list);
		
		ArrayList<BoardDTO> b_list;
		int b_pageNum = 1;
		int b_limit = 10; // �븳�럹�씠吏��뿉 10媛� 異쒕젰
		if (PageNum != null)
			{
			b_pageNum = Integer.parseInt(PageNum);
			}
		int b_TotalOfPost = b_dao.getListCount(subjects);
		b_list = b_dao.getBoardList(b_pageNum, b_limit, subjects);
		int b_total_page;
		if (b_TotalOfPost == 0)
			{
			b_total_page = 1;
			}
		else if (b_TotalOfPost % b_limit == 0)
			{
			b_total_page = b_TotalOfPost / b_limit;
			Math.floor(b_total_page);
			}
		else
			{
			b_total_page = b_TotalOfPost / b_limit;
			Math.floor(b_total_page);
			b_total_page = b_total_page + 1;
			}
		model.addAttribute("pageNum", b_pageNum);
		model.addAttribute("total_page", b_total_page);
		model.addAttribute("TotalOfPost", b_TotalOfPost);
		model.addAttribute("boardlist", b_list);
		
		c_dao = ctx.getBean("calendarDAO", calendarDAO.class);
		ArrayList<calendarDTO> c_list;
		int c_pageNum = 1;
		int c_limit = 4; // �븳�럹�씠吏��뿉 10媛� 異쒕젰
		if (c_PageNum != null)
			{
			c_pageNum = Integer.parseInt(c_PageNum);
			}
		int c_totalofcalendar = c_dao.getListCount();
		c_list = c_dao.getCallist(c_pageNum, c_limit);
		int c_totalpage;
		if (c_totalofcalendar == 0)
			{
			c_totalpage = 1;
			}
		else if (c_totalofcalendar % c_limit == 0)
			{
			c_totalpage = c_totalofcalendar / c_limit;
			Math.floor(c_totalpage);
			}
		else
			{
			c_totalpage = c_totalofcalendar / c_limit;
			Math.floor(c_totalpage);
			c_totalpage = c_totalpage + 1;
			}
		model.addAttribute("CpageNum", c_pageNum);
		model.addAttribute("Ctotalpage", c_totalpage);
		model.addAttribute("callist", c_list);
		
		nb_dao = ctx.getBean("notice_boardDAO", notice_boardDAO.class);
		ArrayList<notice_boardDTO> nb_list;
		int nb_pageNum = 1;
		int nb_limit = 4; // �븳�럹�씠吏��뿉 10媛� 異쒕젰
		if (nb_PageNum != null)
			{
			nb_pageNum = Integer.parseInt(nb_PageNum);
			}
		int nb_totalofcalendar = nb_dao.getListCount();
		nb_list = nb_dao.getBoardList(nb_pageNum, nb_limit);
		int nb_totalpage;
		if (nb_totalofcalendar == 0)
			{
			nb_totalpage = 1;
			}
		else if (nb_totalofcalendar % nb_limit == 0)
			{
			nb_totalpage = nb_totalofcalendar / nb_limit;
			Math.floor(nb_totalpage);
			}
		else
			{
			nb_totalpage = nb_totalofcalendar / nb_limit;
			Math.floor(nb_totalpage);
			nb_totalpage = nb_totalpage + 1;
			}
		model.addAttribute("nbPageNum", nb_pageNum);
		model.addAttribute("nbtotalpage", nb_totalpage);
		model.addAttribute("nbArr", nb_list);
		
		return "professor/p_main";
		}
	
	@RequestMapping("/p_info")
	public String p_info(Model model, HttpSession session)
		{
		p_dao = ctx.getBean("personalDAO", PersonalDAO.class);
		PersonalDTO p_dto = new PersonalDTO();
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		p_dto = p_dao.getinfo(p_id);
		/* model.addAttribute("name", remember.getName()); */
		model.addAttribute("p_id", p_id);
		model.addAttribute("p_dto", p_dto);
		
		return "professor/p_info";
		}
	
	@RequestMapping("/modify_process")
	public String modify_process(Model model, @RequestParam(value = "p_adress") String p_adress, @RequestParam(value = "p_phone") String p_phone, @RequestParam(value = "p_email") String p_email, HttpSession session)
		{
		p_dao = ctx.getBean("personalDAO", PersonalDAO.class);
		Remember remember = (Remember) session.getAttribute("remember");
		String id = remember.getId();
		model.addAttribute("check", "1");
		p_dao.update(p_adress, p_phone, p_email, id);
		
		return "professor/p_info";
		}
	
	@RequestMapping("/p_lecture")
	public String p_lecture(Model model, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		b_dao = ctx.getBean("boardDAO", BoardDAO.class);
		ArrayList<String> sub_list;
		sub_list = b_dao.getmySubject(p_id);
		model.addAttribute("ssubject", sub_list);
		
		a_dao = ctx.getBean("applicationDAO", applicationDAO.class);
		ArrayList<String> sbDTO = sub_list;
		Map<String, Integer> cmap = new HashMap<>();
		for (int i = 0; i < sbDTO.size(); i++)
			{
			cmap.put(sbDTO.get(i), a_dao.getCount(sbDTO.get(i)));
			}
		model.addAttribute("cmap", cmap);
		
		return "professor/p_lecture";
		}
	
	@RequestMapping("/p_popup_lecture")
	public String p_popup_lecture(Model model, @RequestParam(value = "subject_name") String subject_name)
		{
		a_dao = ctx.getBean("applicationDAO", applicationDAO.class);
		ArrayList<StudentDTO> stuArr = a_dao.get_Stu_list(subject_name);
		
		model.addAttribute("subject_name", subject_name);
		model.addAttribute("stuArr", stuArr);
		
		return "professor/p_popup_lecture";
		}
	
	@RequestMapping("/p_exam")
	public String p_exam(Model model, @RequestParam(value = "subject_name", required = false) String subject_name, HttpServletRequest request, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		b_dao = ctx.getBean("boardDAO", BoardDAO.class);
		ArrayList<String> sub_list;
		sub_list = b_dao.getmySubject(p_id);
		model.addAttribute("ssubject", sub_list);
		
		Enumeration enu = request.getParameterNames();
		ArrayList<String> arr = new ArrayList<String>();
		while (enu.hasMoreElements())
			{
			String ans = (String) enu.nextElement();
			arr.add(ans);
			}
		String ans = "";
		for (int i = 0; i < arr.size() - 1; i++)
			{
			ans = ans + request.getParameter(arr.get(i));
			}
		System.out.println(ans);
		
		q_dao = ctx.getBean("questionDAO", QuestionDAO.class);
		q_dao.updateAnswer(ans, subject_name);
		q_dao.insertAnswer(ans, subject_name);
		
		return "professor/p_exam";
		}
	
	@RequestMapping("/p_popup_exam")
	public String p_popup_exam(Model model, @RequestParam(value = "subject") String sub_name)
		{
		q_dao = ctx.getBean("questionDAO", QuestionDAO.class);
		
		ArrayList<QuestionDTO> q_dto_list = q_dao.getExam(sub_name);
		
		model.addAttribute("sub_name", sub_name);
		model.addAttribute("queDTO_list", q_dto_list);
		
		return "professor/p_popup_exam";
		}
	
	@RequestMapping("/p_score")
	public String p_score(Model model, @RequestParam(value = "subject", required = false) String listfirst, @RequestParam(value = "student", required = false) String s_id, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		b_dao = ctx.getBean("boardDAO", BoardDAO.class);
		ArrayList<String> sub_list;
		sub_list = b_dao.getmySubject(p_id);
		model.addAttribute("ssubject", sub_list);
		
		if (listfirst == null)
			{
			ArrayList<String> mylist = sub_list;
			listfirst = mylist.get(0);
			}
		
		a_dao = ctx.getBean("applicationDAO", applicationDAO.class);
		ArrayList<StudentDTO> st_list = a_dao.getStudentList(listfirst);
		model.addAttribute("st_list", st_list);
		p_dao = ctx.getBean("personalDAO", PersonalDAO.class);
		String suballday = p_dao.getstudyday(listfirst);
		model.addAttribute("suballday", suballday);
		
		lectureDTO lecdto = p_dao.getlec(listfirst, s_id);
		model.addAttribute("lecdto", lecdto);
		
		model.addAttribute("subject", listfirst);
		model.addAttribute("student", s_id);
		
		return "professor/p_score";
		}
	
	@RequestMapping("/getScore")
	public String getScore(Model model, @RequestParam(value = "subject", required = false) String sub_name, @RequestParam(value = "student", required = false) String s_id)
		{
		String[] sid = s_id.split(",");
		q_dao = ctx.getBean("questionDAO", QuestionDAO.class);
		String Answer = q_dao.AnswerSheet(sub_name, sid[1]);
		String correct = q_dao.CorrectSheet(sub_name);
		String[] compare = new String[correct.length()];
		int point = 0;
		if (!Answer.equals(""))
			{
			for (int i = 0; i < correct.length(); i++)
				{
				if (correct.charAt(i) == Answer.charAt(i))
					{
					compare[i] = "1";
					point += 5;
					}
				else
					{
					compare[i] = "2";
					}
				}
			scoreDTO scDTO = new scoreDTO();
			scDTO.setAnswer(Answer);
			scDTO.setCompare(compare);
			scDTO.setCorrect(correct);
			scDTO.setPoint(point);
			model.addAttribute("scDTO", scDTO);
			}
		
		model.addAttribute("subject", sub_name);
		model.addAttribute("student", sid[0]);
		
		return "professor/p_score";
		}
	
	@RequestMapping("/calculator")
	public String calculator(Model model, @RequestParam(value = "subject") String sub_name, @RequestParam(value = "student") String s_id, @RequestParam(value = "lec_score") int score, @RequestParam(value = "absence") int absence, @RequestParam(value = "point") String lec_point)
		{
		p_dao = ctx.getBean("personalDAO", PersonalDAO.class);
		double total;
		if (!lec_point.equals("F") || absence < 4)
			{
			total = (score * 0.8) + (20 - absence * 5);
			if (total >= 95)
				{
				lec_point = "A+";
				}
			else if (total >= 90)
				{
				lec_point = "A";
				}
			else if (total >= 85)
				{
				lec_point = "B+";
				}
			else if (total >= 80)
				{
				lec_point = "B";
				}
			else if (total >= 75)
				{
				lec_point = "C+";
				}
			else if (total >= 70)
				{
				lec_point = "C";
				}
			else if (total >= 65)
				{
				lec_point = "D+";
				}
			else if (total >= 60)
				{
				lec_point = "D";
				}
			else {
				lec_point = "F";
				}
			}
		lectureDTO lec_dto = p_dao.getlec(sub_name, s_id);
		if (lec_dto.getLec_score() == null)
			{
			p_dao.putScore(sub_name, s_id, lec_point, absence);
			}
		else
			{
			p_dao.updateScore(sub_name, s_id, lec_point, absence);
			}
		model.addAttribute("msg", "1");
		
		q_dao = ctx.getBean("questionDAO", QuestionDAO.class);
		String Answer = q_dao.AnswerSheet(sub_name, s_id);
		String correct = q_dao.CorrectSheet(sub_name);
		String[] compare = new String[correct.length()];
		int point = 0;
		if (!Answer.equals(""))
			{
			for (int i = 0; i < correct.length(); i++)
				{
				if (correct.charAt(i) == Answer.charAt(i))
					{
					compare[i] = "1";
					point += 5;
					}
				else
					{
					compare[i] = "2";
					}
				}
			scoreDTO scDTO = new scoreDTO();
			scDTO.setAnswer(Answer);
			scDTO.setCompare(compare);
			scDTO.setCorrect(correct);
			scDTO.setPoint(point);
			model.addAttribute("scDTO", scDTO);
			}
		
		model.addAttribute("subject", sub_name);
		model.addAttribute("student", s_id);
		
		return "professor/p_score";
		}
	}