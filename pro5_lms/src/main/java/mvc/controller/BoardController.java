package mvc.controller;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.util.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartRequest;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.PersonalDAO;
import mvc.model.PersonalDTO;
import mvc.model.StudentDAO;
import mvc.model.ssubjectDTO;

public class BoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
		doPost(request, response);
		}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//.go 추출
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		//글자 깨지지않기 위해
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		/*교수 : 게시판 목록 DB에서 가져오기*/
		if(command.equals("/board/ListAction1.go")){
			getSubject(request);
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_boardlist.go");
			rd.forward(request, response);
		}
		
		/*학생 : 게시판 목록 DB에서 가져오기*/
		if(command.equals("/board/ListAction2.go")){
			//String pageNum = request.getParameter("pageNum");
			//System.out.println(pageNum);
			getstudentsubjectlist(request);
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/s_boardlist.go");
			rd.forward(request, response);
		}
		
		/*교수 : 게시판 목록 - 화면*/
		else if(command.equals("/board/p_boardlist.go")){
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_boardlist.jsp");
			rd.forward(request, response);	
		}
		
		/*학생 : 게시판 목록 - 화면*/
		else if(command.equals("/board/s_boardlist.go")){
			RequestDispatcher rd = request.getRequestDispatcher("/board/s_boardlist.jsp");
			rd.forward(request, response);	
		}
		
		
		/*교수만 : 글쓰기페이지로 이동*/
		else if(command.equals("/board/p_write.go")){
			getSubject(request); //내 과목 가져오기
			getPersonalInfo(request); //내 정보 가져오기
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_write.jsp");
			rd.forward(request, response);	
		}
		
		/*교수만 : 작성글 업로드*/
		else if(command.equals("/board/p_postupload.go")){
			setPost(request); //작성글 업로드
			RequestDispatcher rd = request.getRequestDispatcher("/board/ListAction1.go");
			rd.forward(request, response);
		}
		
		/*교수 : 게시판 글 상세보기*/
		else if(command.equals("/board/p_post.go")) {
			requestPost(request); //db에서 게시글 상세내용 가져오기
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_post.jsp");
			rd.forward(request, response);
			//System.out.println("글 상세보기 확인");
		}
		
		/*학생 : 게시판 글 상세보기*/
		else if(command.equals("/board/s_post.go")) {
			requestPost(request); //db에서 게시글 상세내용 가져오기
			RequestDispatcher rd = request.getRequestDispatcher("/board/s_post.jsp");
			rd.forward(request, response);
			//System.out.println("글 상세보기 확인");
		}
		
		/*교수, 학생 : 파일다운로드*/
		else if(command.equals("/board/download.go")) {
			//System.out.println(request.getParameter("po_filename"));
			file_down(request, response);
		}
		
		/*교수 : 글 삭제*/
		else if(command.equals("/board/DeleteAction.go")){
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/ListAction1.go");
			rd.forward(request, response);
		}
		
		/*교수만 : 글 수정화면으로 이동*/
		else if(command.equals("/board/editWrite.go")) {
			getSubject(request); //내 과목 가져오기
			getPersonalInfo(request); //내 정보 가져오기
			requestPost(request); //작성글 상세정보 가져오기

			RequestDispatcher rd = request.getRequestDispatcher("/board/p_editwrite.jsp");
			rd.forward(request, response);
		}
		
		/*교수만 : 수정글 db에 업데이트*/
		else if(command.equals("/board/p_postupdate.go")) {
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_post.go");
			rd.forward(request, response);
		}
	}
	
	/*게시판 목록(게시글 Arraylist) DB에서 가져오기*/
	public void requestBoardList(HttpServletRequest request) {
		
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT; //한페이지에 10개 출력
		
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String subjects = request.getParameter("subjects");
		
		if(subjects==null){
			subjects = "sub_all";
		} // 페이지 넘길때 null방지
		
		int TotalOfPost = dao.getListCount(subjects);
		//System.out.println("검색한과목 게시글 갯수"+TotalOfPost);
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
		request.setAttribute("TotalOfPost", TotalOfPost);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("search", subjects);
	}
	
	/*교수(내) 과목 DB에서 가져오기*/
	public void getSubject(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("p_id");
		ArrayList<String> sub_list = new ArrayList<String>();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		sub_list = dao.getmySubject(p_id);
		//System.out.println(sub_list.get(0)+"과목 가져오는지 확인");
		request.setAttribute("ssubject", sub_list);
	}
	
	/*학생(내) 과목 DB에서 가져오기*/
	public void getstudentsubjectlist(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("s_id");
		int s_id = Integer.parseInt(sid); 
		
		StudentDAO dao = StudentDAO.getInstance();
		ArrayList<ssubjectDTO> mylist = dao.mySubject(s_id);
		request.setAttribute("mylist", mylist);
	}
	
	/*교수(내) 정보 PersonalDAO에서 가져오기*/
	public void getPersonalInfo(HttpServletRequest request) {
		
		PersonalDAO dao = PersonalDAO.getInstance();
		PersonalDTO dto = new PersonalDTO();
		
		HttpSession session = request.getSession();
		String p_id = (String) session.getAttribute("p_id");
		
		dto = dao.getinfo(p_id);
		
		request.setAttribute("p_id", p_id);
		request.setAttribute("dto", dto);
		
	}
	
	
	/*작성글 DB에 저장하기*/
	public void setPost(HttpServletRequest request) {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String realFolder = request.getSession().getServletContext().getRealPath("resource/upload");
		int maxSize = 10 * 1024 * 1024;
		
		try{ //파일 업로드 안할 수도 있으니까 예외처리
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String filename = multi.getFilesystemName("filename");
			String realname = multi.getOriginalFileName("filename");
			String contents = multi.getParameter("summernote");
			contents = contents.replace("\r\n", "<br>");
			
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
			String write_day = formatter.format(new java.util.Date());

			BoardDTO board = new BoardDTO();
			
			board.setP_id(multi.getParameter("id"));
			board.setSub_name(multi.getParameter("select_subject"));
			board.setPo_subject(multi.getParameter("title"));
			board.setP_oNumber(multi.getParameter("phonenum"));
			board.setP_name(multi.getParameter("p_name"));
			board.setPo_filename(filename);
			board.setN_contents(contents);
			board.setPo_date(write_day);
			board.setPo_realname(realname);
			
			dao.insertBoard(board);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	/*게시글 상세페이지 DB에서 가져오기*/
	public void requestPost(HttpServletRequest request) {

		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num", num); 	 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);
	}

	/*첨부된 파일 다운로드 할 수 있게 하기*/
	public void file_down(HttpServletRequest request, HttpServletResponse response) {
		
		//다운로드 할 파일 명
		String filename = request.getParameter("po_filename");
		String realname = request.getParameter("po_realname");
		
		//파일이 있는 절대경로
		String folder = request.getServletContext().getRealPath("resource/upload");
		
		//파일의 절대경로
		String filePath = folder + "/" + filename;
		
		try {
			//파일 경로를 이용하여 파일 생성, 파일의 크기만큼 바이트 배열 만듦
			File file = new File(filePath);
			byte b[] = new byte[(int) file.length()];
			
			//page의 ContentType등을 동적으로 바꾸기 위해 초기화
			response.reset();
			response.setContentType("application/octet-stream");
			
			//한글 인코딩
			//String encoding = new String(filename.getBytes("utf-8"));
			//String encoding = new String(filename.getBytes("euc-kr"),"8859_1");
			String encoding = new String(realname.getBytes("euc-kr"),"8859_1");
			
			//파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
			response.setHeader("Content-Disposition", "atachement;filename="+ encoding);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			
			//파일이 있을 경우
			if(file.isFile()) {
				FileInputStream fInputSt = new FileInputStream(file);
				ServletOutputStream sOutputSt = response.getOutputStream();
				
				//파일을 읽어서 클라이언트에 저장
				int readNum =0;
				while((readNum = fInputSt.read(b)) != -1) {
					sOutputSt.write(b, 0, readNum);
				}
				
				sOutputSt.close();
				fInputSt.close();
				
			}
		}catch(Exception e) {
			System.out.println("file_down Exception : " + e.getMessage());
		}

	}
	
	/*글 삭제*/
	public void requestBoardDelete(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
	}
	
	/*글 수정*/
	public void requestBoardUpdate(HttpServletRequest request) {
		

		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String realFolder = request.getSession().getServletContext().getRealPath("resource/upload");
		int maxSize = 10 * 1024 * 1024;
		
		try{ //파일 업로드 안할 수도 있으니까 예외처리
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String filename = multi.getFilesystemName("filename");
			String realname = multi.getOriginalFileName("filename");
			String contents = multi.getParameter("summernote");
			contents = contents.replace("\r\n", "<br>");
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
			String write_day = formatter.format(new java.util.Date());

			BoardDTO board = new BoardDTO();
			
			board.setPo_num(num);
			board.setSub_name(multi.getParameter("select_subject"));
			board.setPo_subject(multi.getParameter("title"));
			board.setPo_filename(filename);
			board.setN_contents(contents);
			board.setPo_date(write_day);
			board.setPo_realname(realname);
			
			dao.updateBoard(board);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}

	
