package controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import config.AppCtx;
import mvc.controller.DefaultFileRenamePolicy;
import mvc.controller.MultipartRequest;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.PersonalDAO;
import mvc.model.PersonalDTO;
import mvc.model.Remember;
import mvc.model.StudentDAO;
import mvc.model.ssubjectDTO;

@Controller
@RequestMapping("/board")
public class BoardController
	{
	AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
	BoardDAO b_dao = ctx.getBean("boardDAO", BoardDAO.class);
	PersonalDAO p_dao = ctx.getBean("personalDAO", PersonalDAO.class);
	StudentDAO s_dao = ctx.getBean("studentDAO", StudentDAO.class);
	
	@RequestMapping("/ListAction1")
	public String listAction1(Model model, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "subjects", required = false) String subjects, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();

		getSubject(model, p_id);
		requestBoardList(model, PageNum, subjects);

		return "board/p_boardlist";
		}

	@RequestMapping("/p_write")
	public String p_write(Model model, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();

		getSubject(model, p_id);
		getPersonalInfo(model, p_id);

		return "board/p_write";
		}
	
	@RequestMapping("/p_postupload")
	public String p_postupload(HttpServletRequest request, Model model, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "subjects", required = false) String subjects, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		setPost(model, request);
		
		getSubject(model, p_id);
		requestBoardList(model, PageNum, subjects);
		
		return "board/p_boardlist";
		}
	
	@RequestMapping("/p_post")
	public String p_post(Model model, @RequestParam(value = "num") int num, @RequestParam(value = "pageNum") int pageNum, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		requestPost(model, num, pageNum);
		
		model.addAttribute("p_id", p_id);
		
		return "board/p_post";
		}
	
	@RequestMapping("/DeleteAction")
	public String DeleteAction(Model model, @RequestParam(value = "num") String num, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "subjects", required = false) String subjects, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		requestBoardDelete(num, PageNum);

		getSubject(model, p_id);
		requestBoardList(model, PageNum, subjects);
		
		return "board/p_boardlist";
		}
	
	@RequestMapping("/editWrite")
	public String editWrite(Model model, @RequestParam(value = "num") int num, @RequestParam(value = "pageNum") int pageNum, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		getSubject(model, p_id);
		getPersonalInfo(model, p_id);
		requestPost(model, num, pageNum);
		
		return "board/editWrite";
		}
	
	@RequestMapping("/p_postupdate")
	public String p_postupdate(Model model, @RequestParam(value = "num") int num, @RequestParam(value = "pageNum") int pageNum, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		requestBoardUpdate(num, pageNum);
		requestPost(model, num, pageNum);
		
		model.addAttribute("p_id", p_id);
		
		return "board/p_post";
		}
	
	
	@RequestMapping("/ListAction2")
	public String ListAction2(Model model, @RequestParam(value = "pageNum", required = false) String PageNum, @RequestParam(value = "subjects", required = false) String subjects, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String s_id = remember.getId();
		
		getstudentsubjectlist(model, s_id);
		requestBoardList(model, PageNum, subjects);
		
		return "board/s_boardlist";
		}
	
	@RequestMapping("/s_post")
	public String s_post(Model model, @RequestParam(value = "num") int num, @RequestParam(value = "pageNum") int pageNum, HttpSession session)
		{
		Remember remember = (Remember) session.getAttribute("remember");
		String p_id = remember.getId();
		
		requestPost(model, num, pageNum);
		
		model.addAttribute("p_id", p_id);
		
		return "board/s_post";
		}
	
	
	
	
	
	
	
	/*게시판 목록(게시글 Arraylist) DB에서 가져오기*/
	public void requestBoardList(Model model, String PageNum, String subjects)
		{
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = 10; //한페이지에 10개 출력
		
		if(PageNum!=null)
			{
			pageNum=Integer.parseInt(PageNum);
			}
		
		if(subjects==null)
			{
			subjects = "sub_all";
			} // 페이지 넘길때 null방지
		
		int TotalOfPost = b_dao.getListCount(subjects);
		//System.out.println("검색한과목 게시글 갯수"+TotalOfPost);
		boardlist = b_dao.getBoardList(pageNum, limit, subjects);
		
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
		model.addAttribute("TotalOfPost", TotalOfPost);
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("search", subjects);
		}
	
	/*교수(내) 과목 DB에서 가져오기*/
	public void getSubject(Model model, String p_id)
		{
		ArrayList<String> sub_list = new ArrayList<String>();
		
		sub_list = b_dao.getmySubject(p_id);

		model.addAttribute("ssubject", sub_list);
		}
	
	/*학생(내) 과목 DB에서 가져오기*/
	public void getstudentsubjectlist(Model model, String sid)
		{
		int s_id = Integer.parseInt(sid); 
		
		ArrayList<ssubjectDTO> mylist = s_dao.mySubject(s_id);
		model.addAttribute("mylist", mylist);
		}
	
	/*교수(내) 정보 PersonalDAO에서 가져오기*/
	public void getPersonalInfo(Model model, String p_id)
		{
		PersonalDTO p_dto = new PersonalDTO();
		
		p_dto = p_dao.getinfo(p_id);
		
		model.addAttribute("p_id", p_id);
		model.addAttribute("dto", p_dto);
		}
	
	
	/*작성글 DB에 저장하기*/
	public void setPost(Model model, HttpServletRequest request)
		{
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
	public void requestPost(Model model, int num, int pageNum)
		{
		BoardDTO b_dto = b_dao.getBoardByNum(num);
		
		model.addAttribute("num", num); 	 
		model.addAttribute("page", pageNum); 
		model.addAttribute("board", b_dto);
		}

	/*첨부된 파일 다운로드 할 수 있게 하기*/
	public void file_down(HttpServletRequest request, HttpServletResponse response)
		{
		//다운로드 할 파일 명
		String filename = request.getParameter("po_filename");
		String realname = request.getParameter("po_realname");
		
		//파일이 있는 절대경로
		String folder = request.getServletContext().getRealPath("resource/upload");
		
		//파일의 절대경로
		String filePath = folder + "/" + filename;
		
		try
			{
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
			if(file.isFile())
				{
				FileInputStream fInputSt = new FileInputStream(file);
				ServletOutputStream sOutputSt = response.getOutputStream();
				
				//파일을 읽어서 클라이언트에 저장
				int readNum =0;
				while((readNum = fInputSt.read(b)) != -1)
					{
					sOutputSt.write(b, 0, readNum);
					}
				
				sOutputSt.close();
				fInputSt.close();
				}
			}
		
		catch(Exception e)
			{
			System.out.println("file_down Exception : " + e.getMessage());
			}
		}
	
	/*글 삭제*/
	public void requestBoardDelete(String s_num, String s_pageNum)
		{
		int num = Integer.parseInt(s_num);
		int pageNum = Integer.parseInt(s_pageNum);
		
		b_dao.deleteBoard(num);
		}
	
	/*글 수정*/
	public void requestBoardUpdate(int num, int pageNum)
		{
		String realFolder = request.getSession().getServletContext().getRealPath("resource/upload");
		int maxSize = 10 * 1024 * 1024;
		
		try
			{ //파일 업로드 안할 수도 있으니까 예외처리
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
			
			b_dao.updateBoard(board);
			
			}
		
		catch(Exception e)
			{
			e.printStackTrace();
			}
		}
	}