package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import config.AppCtx;
import mvc.model.MemberDAO;
import mvc.model.Remember;

@Controller
@RequestMapping("/member")
public class MemberController
	{
	AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
	private MemberDAO dao;
	
	@PostMapping("/join_chkprocess")
	public String join_chkprocess(Model model, @RequestParam(value = "join_jumin1") String jumin1, @RequestParam(value = "join_jumin2") String jumin2, HttpServletResponse response) throws IOException
		{
		dao = ctx.getBean("memberDAO", MemberDAO.class);
		String[] NameId = dao.get_NameId(jumin1, jumin2);
		
		if (NameId == null)
		{
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>alert('주민등록번호를 확인해주세요.'); location.href='/pro5_lms/member/join';</script>");
		
		out.flush();
		}
		
		if(NameId[0]==null && NameId[1]==null && NameId[2]==null && NameId[3]==null)
			{ 
			NameId[2]="2";
			NameId[3]="2";
			}
		
		//비밀번호가 존재(회원정보가 있으면)하면 실행
		if(NameId[2].equals("1"))
			{
			PrintWriter out = response.getWriter();
			
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('회원정보가 존재합니다. 로그인페이지로 이동합니다.'); location.href='/pro5_lms/member/login';</script>");
			
			out.flush();
			}
		
		model.addAttribute("NameId", NameId);
		model.addAttribute("jumin1", jumin1);
		model.addAttribute("jumin2", jumin2);
		
		return "member/join";
		}
	
	@PostMapping("/join_process")
	public String join_process(Model model, @RequestParam(value = "join_id") String id, @RequestParam(value = "join_pw") String pw)
		{
		dao = ctx.getBean("memberDAO", MemberDAO.class);
		dao.update_pw(id, pw);
		
		model.addAttribute("num", "1");
		
		return "member/login";
		}
	
	@PostMapping("/login_process")
	public String login_process(Model model, @RequestParam(value = "id") String id, @RequestParam(value = "passwd") String pw, HttpSession session)
		{
		dao = ctx.getBean("memberDAO", MemberDAO.class);
		String[] IdPwNum = dao.login(id, pw);
		
		if (IdPwNum[2].equals("1"))
			{
			Remember remember = new Remember(IdPwNum[0], IdPwNum[1]);
			
			model.addAttribute("num", "1");
			session.setAttribute("remember", remember);

			return "redirect:http://localhost:8080/pro5_lms/professor/p_main";
			}
		
		if (IdPwNum[2].equals("2"))
			{
			Remember remember = new Remember(IdPwNum[0], IdPwNum[1]);
			
			model.addAttribute("num", "1");
			session.setAttribute("remember", remember);

			return "redirect:http://localhost:8080/pro5_lms/student/s_main";
			}
		
		if(IdPwNum[2].equals("3"))
			{
			model.addAttribute("IdPwNum", IdPwNum[2]);
			
			return "member/login";
			}
		
		return "";
		}
	
	@RequestMapping("/changepw")
	public String changepw()
		{
		return "member/changepw";
		}
	
	@RequestMapping("/pwprocess")
	public String pwprocess(Model model, @RequestParam(value = "id") String id, @RequestParam(value = "pw_before") String pw_before, @RequestParam(value = "pw_new") String pw_new, HttpSession session)
		{
		int chknum = 0;
		
		dao = ctx.getBean("memberDAO", MemberDAO.class);
		
		int exist = dao.checkpw(id, pw_before); // 비밀번호 일치여부 확인
		
		if (exist == 0)
			{
			model.addAttribute("pwchknum", "0");
			}
		
		else
			{
			dao.changepasswd(id, pw_new);
			session.invalidate();
			chknum = 2;
			}
		
		if (chknum == 0)
			{
			return "member/changepw";
			}
		
		if (chknum == 2)
			{
			model.addAttribute("num", "2");
			
			return "redirect:http://localhost:8080/pro5_lms/member/login";
			}
		
		return "";
		}
	
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session)
		{
		session.invalidate();
		model.addAttribute("num", "3");
		
		return "redirect:http://localhost:8080/pro5_lms/member/login";
		}
	}