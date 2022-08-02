package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.AppCtx;
import mvc.model.MemberDAO;

public class MemberController extends HttpServlet
	{
	ApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
		doPost(request, response);
		}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//커맨드 패턴의 .do만을 추출하기 위하여 문자열 전처리
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		//System.out.println(command);
		//System.out.println(contextPath);
		
		//글자 깨지지않기 위해
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		/*1. 회원가입*/
		if(command.equals("/member/join.do"))
			{
			//System.out.println("컨트롤러 동작확인");
			RequestDispatcher rd = request.getRequestDispatcher("./join.jsp");
			rd.forward(request, response);
			}
		
		/*2. 주민등록번호로 학번/직번 조회*/
		else if(command.equals("/member/join_chkprocess.do")){
			String[] num = juminToid(request);
			
			//일치하는 정보 & 비밀번호 없으면 회원가입
			if(num[2].equals("0")) {
				RequestDispatcher rd = request.getRequestDispatcher("./join.jsp");
				rd.forward(request, response);
			}
			
			//비밀번호가 존재(회원정보가 있으면)하면 실행
			if(num[2].equals("1")) {
				PrintWriter out = response.getWriter();
				
				response.setContentType("text/html; charset=utf-8");
				out.println("<script>alert('회원정보가 존재합니다. 로그인페이지로 이동합니다.'); location.href='./login.jsp';</script>");
				
				out.flush();
			}
			
			//일치하는 회원정보가 없으면 실행
			if(num[3].equals("2")) {
				RequestDispatcher rd = request.getRequestDispatcher("./join.jsp");
				rd.forward(request, response);
			}
			
		}
		
		/*3. 회원가입 : 비밀번호 db 업데이트*/
		else if(command.equals("/member/join_process.do"))
			{
			pwupdate(request);
			response.sendRedirect("./login.jsp?num=1");
			}
		
		/*4. 로그인*/
		else if(command.equals("/member/login_process.do")){
			
			String[] IdNum = login(request);
			//System.out.println(IdPwNum[0]+"아이디확인");
			//System.out.println(IdPwNum[3]);
			if (IdNum[2].equals("1")){
				HttpSession session = request.getSession();
	            session.setAttribute("p_id", IdNum[0]);
	            session.setAttribute("p_name", IdNum[1]);
	           
	            response.sendRedirect("http://localhost:8080/pro5_lms/professor/p_main.per?num=1");
	            return;
			}
			
			if (IdNum[2].equals("2")){
				HttpSession session = request.getSession();
	            session.setAttribute("s_id", IdNum[0]);
	            session.setAttribute("s_name", IdNum[1]);
	            response.sendRedirect("http://localhost:8080/pro5_lms/student/s_main.so?num=1");
	            return;
			}
			
			if(IdNum[2].equals("3")){
				response.sendRedirect("./login.jsp?IdPwNum="+IdNum[2]);
				return;
			}
		}
		
		/*5. 비밀번호 변경(info > 변경페이지로 이동)*/
		else if(command.equals("/member/changepw.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("./changepw.jsp");
			rd.forward(request, response);	
		}
		
		/*6. 비밀번호 변경(process)*/
		else if(command.equals("/member/pwprocess.do")) {
			int chknum = changepw(request);
			
			if(chknum==0) {
				RequestDispatcher rd = request.getRequestDispatcher("./changepw.jsp");
				rd.forward(request, response);
			}
			
			if(chknum==2) {
				response.sendRedirect("http://localhost:8080/pro5_lms/member/login.jsp?num=2");
				return;
			}
		}
		
		/*7. 로그아웃*/
		else if(command.equals("/member/logout.do")) {
			logout(request);
			response.sendRedirect("http://localhost:8080/pro5_lms/member/login.jsp?num=3");
			return;
		}
	}
	
	/*주민등록번호로 학번/직번 조회*/
	public String[] juminToid(HttpServletRequest request){
		MemberDAO dao = MemberDAO.getInstance();
		String jumin1 = request.getParameter("join_jumin1");
		String jumin2 = request.getParameter("join_jumin2");
		
		String[] NameId = dao.get_NameId(jumin1, jumin2);
		
		//일치하는 회원정보가 없으면
		if(NameId[0]==null && NameId[1]==null && NameId[2]==null && NameId[3]==null){ 
			NameId[2]="2";
			NameId[3]="2";
		}

		//System.out.println("juminToid : " + NameId[3]);

		request.setAttribute("name", NameId[0]);
		request.setAttribute("id", NameId[1]);
		request.setAttribute("jumin1", jumin1);
		request.setAttribute("jumin2", jumin2);
		request.setAttribute("num", NameId[3]); //일치하는 회원정보가 없으면
		
		return NameId; 
			
		//System.out.println(NameId[0]); //이름
		//System.out.println(NameId[1]); //학번or직번
	
	}
	
	/*회원가입 : 비밀번호 db 업데이트*/
	public void pwupdate(HttpServletRequest request)
		{
		MemberDAO dao = MemberDAO.getInstance();
		
		String id = request.getParameter("join_id");
		String pw = request.getParameter("join_pw");
	
		dao.update_pw(id, pw);
		}
	
	/*로그인*/
	public String[] login(HttpServletRequest request)
		{
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		
		MemberDAO dao = MemberDAO.getInstance();
		String[] IdPwNum = dao.login(id, pw);
		request.setAttribute("login_id", IdPwNum[0]);
		request.setAttribute("login_name", IdPwNum[1]);
		
		return IdPwNum;
		}
	
	/*비밀번호 변경*/
	public int changepw(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw_before");
		String pw_new = request.getParameter("pw_new");
		int chknum = 0;
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int x = dao.checkpw(id, pw); //비밀번호 일치여부체크

		if(x==0) {
			request.setAttribute("pwchknum", "0");
		}
		
		else {
			dao.changepasswd(id, pw_new);
			
			HttpSession session = request.getSession();
			
			//세션삭제
			session.removeAttribute("p_id");
			session.removeAttribute("s_id");
			
			chknum = 2;
		}
		
		return chknum;
		
	}
	
	/*로그아웃*/
	public void logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("p_id");
		session.removeAttribute("s_id");
	}
	
}
