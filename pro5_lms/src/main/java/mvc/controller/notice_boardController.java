package mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.PersonalDAO;
import mvc.model.PersonalDTO;
import mvc.model.notice_boardDAO;
import mvc.model.notice_boardDTO;

public class notice_boardController extends HttpServlet
	{
	private static final long serialVersionUID = 1L;
	
	static final int LISTCOUNT = 10;
	
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
		
		
		//글자 깨지지않기 위해
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		/*교수 : 게시글 목록 가져오기*/
		if(command.equals("/board/p_noticeboardlist.notice"))
	        {
			requestNoticeBoardList(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/p_noticeboardlist.jsp");
	        rd.forward(request, response);
	        }
		
		/*학생 : 게시글 목록 가져오기*/
		if(command.equals("/board/s_noticeboardlist.notice"))
	        {
			requestNoticeBoardList(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/s_noticeboardlist.jsp");
	        rd.forward(request, response);
	        }
		
		/*새 글 작성 시 */
		else if(command.equals("/board/p_noticewrite.notice"))
			{
			getdto(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_noticewrite.jsp");
	        rd.forward(request, response);
			}
		
		/*글 저장*/
		else if(command.equals("/board/p_noticewrite_update.notice"))
	        {
			newNotice(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/p_noticeboardlist.notice");
	        rd.forward(request, response);
	        }
		
		/*교수 : 글 상세보기*/
		else if(command.equals("/board/p_notice.notice"))
	        {
			read_notice(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/p_notice.jsp");
	        rd.forward(request, response);
	        }
		
		/*학생 : 글 상세보기*/
		else if(command.equals("/board/s_notice.notice"))
	        {
			read_notice(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/s_notice.jsp");
	        rd.forward(request, response);
	        }
		
		
		/*교수, 학생 : 파일다운로드*/
		else if(command.equals("/board/download.notice"))
			{
			file_down(request, response);
			}
		
		
		/*수정하기*/
		else if(command.equals("/board/p_editnotice.notice"))
	        {
			edit_notice(request);
	        RequestDispatcher rd = request.getRequestDispatcher("/board/p_editnoticewrite.jsp");
	        rd.forward(request, response);
	        }
		
		/*수정한 내용 업로드*/
		else if(command.equals("/board/p_editnoticewrite_update.notice"))
			{
			int[] num = update_edit_notice(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_notice.notice?n_num=" + num[0] + "&pageNum=" + num[1]);
	        rd.forward(request, response);
			}
		
		/*삭제하기*/
		else if(command.equals("/board/p_deletenotice.notice"))
			{
			int pageNum = delete_notice(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/p_noticeboardlist.notice?pageNum=" + pageNum);
	        rd.forward(request, response);
			}
		}
	
	// 공지사항 게시글 가져오기
	public void requestNoticeBoardList(HttpServletRequest request)
		{
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		ArrayList<notice_boardDTO> nblist = new ArrayList<notice_boardDTO>();
		
		int pageNum=1;
		int limit=LISTCOUNT;
		
		if (request.getParameter("pageNum") != null)
			{
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
		
		String items = request.getParameter("items"); // 검색 주제
		String text = request.getParameter("text"); // 검색 내용
		
		int total_record=nbDAO.getListCount(items, text); // 글 갯수 가져오기
		nblist = nbDAO.getBoardList(pageNum, limit, items, text); // 전제 글 가져온 list
		
		int total_page; // 게시글로 인해 나와야 하는 총 페이지 수
		
		if (total_record % limit == 0)
			{
			total_page =total_record/limit;
			Math.floor(total_page);
			}
		
		else
			{
			total_page = total_record/limit;
			Math.floor(total_page);
			total_page = total_page + 1;
			}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("nblist", nblist);
		}
	
	// 글쓰기 버튼 클릭 시, 로그인 되어있는 사람의 id에 따라 부서나 과 입력해주기
	public void getdto(HttpServletRequest request) {
		
		PersonalDAO dao = PersonalDAO.getInstance();
		PersonalDTO per_dto = new PersonalDTO();
		
		HttpSession session = request.getSession(false);
		String p_id = (String) session.getAttribute("p_id");
		//System.out.println(p_id+":session에서 아이디 가져오는지 확인");
		
		per_dto = dao.getinfo(p_id);
		//System.out.println(per_dto.getP_major()+"db에서 data들고 왔는지 확인");
		
		request.setAttribute("p_id", p_id);
		request.setAttribute("dto", per_dto);
	}
	
	// 새 글 작성
	public void newNotice(HttpServletRequest request)
		{
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		
		String realFolder = request.getSession().getServletContext().getRealPath("resource/upload");
		int maxSize = 10 * 1024 * 1024;
		
		try
			{	
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
			String regist_day = formatter.format(new java.util.Date());
			
			String contents = multi.getParameter("summernote");
			contents = contents.replace("\r\n", "<br>");
			
			String filename = multi.getFilesystemName("filename");
			String realname = multi.getOriginalFileName("filename");
			
			notice_boardDTO nbDTO = new notice_boardDTO();
			nbDTO.setN_subject(multi.getParameter("title"));
			nbDTO.setN_date(regist_day);
			nbDTO.setP_department(multi.getParameter("p_department"));
			nbDTO.setP_oNumber(multi.getParameter("p_oNumber"));
			nbDTO.setN_contents(contents);
			nbDTO.setP_name(multi.getParameter("p_name"));
			nbDTO.setP_id(multi.getParameter("p_id"));
			nbDTO.setN_filename(filename);
			nbDTO.setN_realname(realname);
			
			nbDAO.insertBoard(nbDTO);
			}
		
		catch(Exception e)
			{
			e.printStackTrace();
			}
		}
	
	//제목 클릭 시 상세보기 페이지
	public void read_notice(HttpServletRequest request)
		{
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		notice_boardDTO nbDTO = new notice_boardDTO();
		nbDTO = nbDAO.getClick_title(n_num);
		
		request.setAttribute("n_num", n_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("nbDTO", nbDTO);
		}
	
	public void file_down(HttpServletRequest request, HttpServletResponse response)
		{
		//다운로드 할 파일 명
		String filename = request.getParameter("n_filename");
		String realname = request.getParameter("n_realname");
		
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
		
		catch (Exception e)
			{
			System.out.println("file_down Exception : " + e.getMessage());
			}
		}
	
	//글 수정 페이지로 이동
	public void edit_notice(HttpServletRequest request)
		{
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		notice_boardDTO nbDTO = new notice_boardDTO();
		nbDTO = nbDAO.editform(n_num);
		
		request.setAttribute("n_num", n_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("nbDTO", nbDTO);
		}
	
	//수정 버튼 눌렀을 때
	public int[] update_edit_notice(HttpServletRequest request)
		{
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		String realFolder = request.getSession().getServletContext().getRealPath("resource/upload");
		int maxSize = 10 * 1024 * 1024;
		
		int[] num = {n_num, pageNum};
		
		try
			{
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			String filename = multi.getFilesystemName("filename");
			String realname = multi.getOriginalFileName("filename");
			
			String title = multi.getParameter("title");
			String contents = multi.getParameter("summernote");
			contents = contents.replace("\r\n", "<br>");
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
			String write_day = formatter.format(new java.util.Date());
			
			nbDAO.update_editnotice(n_num, title, contents, write_day);
			}
		
		catch(Exception e)
			{
			e.printStackTrace();
			}
		
		return num;
		}
	
	// 삭제 버튼 눌렀을 때
	public int delete_notice(HttpServletRequest request)
		{
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		notice_boardDAO nbDAO = notice_boardDAO.getInstance();
		nbDAO.deleteDAO(n_num);
		
		return pageNum;
		}
	}