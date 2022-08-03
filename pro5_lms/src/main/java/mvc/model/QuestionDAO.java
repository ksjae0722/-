package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class QuestionDAO
	{
	private JdbcTemplate jdbcTemplate;
	
	public QuestionDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	/* DB에서 시험 문제 가져오기 / 교수, 학생 */
	public ArrayList<QuestionDTO> getExam(String sub_name)
		{
		List<ArrayList<QuestionDTO>> results
		= jdbcTemplate.query
			("select * from exam1 where sub_name=?",
			new RowMapper<ArrayList<QuestionDTO>>()
				{
				@Override
				public ArrayList<QuestionDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					ArrayList<QuestionDTO> q_dto_list = new ArrayList<QuestionDTO>();
					
					do
						{
						QuestionDTO q_dto = new QuestionDTO();
						q_dto.setSub_name(rs.getString("sub_name"));
						q_dto.setEx_num(rs.getInt("ex_num"));
						String contents = rs.getString("ex_contents");
						contents = contents.replace("<br>", "\r\n");
						q_dto.setEx_contents(contents);
						q_dto.setEx_ans(rs.getInt("ex_ans"));
						System.out.println(rs.getInt("ex_num"));
						q_dto_list.add(q_dto);
						}
					while (rs.next());

					return q_dto_list;
					}
				},
			sub_name
			);
		
		return results.isEmpty() ? null:results.get(0);
		}
	
	/* 문제 정답 업데이트 / 교수 */
	public void updateAnswer(String ans, String subject_name)
		{
		char num;
		String ans_num;
		
		for (int i = 0; i < ans.length(); i++)
			{
			num = ans.charAt(i);
			ans_num = Character.toString(num);
			
			jdbcTemplate.update("update exam1 set ex_ans=? where sub_name=? and ex_num=?", ans_num, subject_name, i+1);
			}
		}
	
	/* 정답리스트 업데이트 / 교수 */
	public void insertAnswer(String ans, String subject_name)
		{
		List<String> ans_list
		= jdbcTemplate.query
			("select * from exam2 where sub_name=?",
			new RowMapper<String>()
				{
				@Override
				public String mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					String ans_list = rs.getString("ex_ans2");
					
					return ans_list.isEmpty() ? null:ans_list;
					}
				},
			subject_name
			);

		String anslist = ans_list.isEmpty() ? null:ans_list.get(0);
		
		if (!(ans.equals("")) && anslist == null)
			{
			jdbcTemplate.update("insert into exam2(sub_name, ex_ans2) values(?,?)", subject_name, ans);
			}
		
		else
			{
			jdbcTemplate.update("update exam2 set ex_ans2=? where sub_name=?", ans, subject_name);
			}
		}
	
	/* 제출 답안 리스트 업데이트 / 학생 */
	public void stu_insertAnswer(String ans, String subject_name, int s_id)
		{
		jdbcTemplate.update("update answer set ans_answer=? where sub_name=? and s_id=?", ans, subject_name, s_id);
		}
	
	/* 수강신청 시 공백 제출 답안 리스트 생성 / 학생 */
	public void insertStuDabjiList(String s_name, int s_id)
		{
		jdbcTemplate.update("insert into answer(ans_answer, sub_name, s_id) values(?,?,?)", "", s_name, s_id);
		}
	
	/* 수강취소 시 공백 제출 답안 리스트 삭제 / 학생 */
	public void deleteStuDabjiList(String s_name, int s_id)
		{
		jdbcTemplate.update("delete from answer where sub_name=? and s_id=?", s_name, s_id);
		}
	
	/* 제출 답안이 있는지 확인 / 학생 */
	public QuestionDTO stu_getAnswer(String subject_name, int s_id)
		{
		List<QuestionDTO> results
		= jdbcTemplate.query
			("select * from answer where sub_name=? and s_id=?",
			new RowMapper<QuestionDTO>()
				{
				@Override
				public QuestionDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					QuestionDTO q_dto = new QuestionDTO();
					q_dto.setAnslist(rs.getString("ans_answer"));
					q_dto.setSub_name(rs.getString("sub_name"));
					q_dto.setS_id(rs.getInt("s_id"));
					
					return q_dto;
					}
				},
			subject_name, s_id
			);
		
		return results.isEmpty() ? null: results.get(0);
		}
	
	/* 시험응시 가능한 상태인지 */
	public ArrayList<QuestionDTO> isTest(ArrayList<ssubjectDTO> mySubList)
		{
		ArrayList<QuestionDTO> q_dto_list = new ArrayList<QuestionDTO>();
		List<ArrayList<QuestionDTO>> results = null;
		
		for (int i = 0; i < mySubList.size(); i++)
			{
			ssubjectDTO ss_dto = mySubList.get(i);
			
			results = jdbcTemplate.query
				("select * from exam2 where sub_name=?",
				new RowMapper<ArrayList<QuestionDTO>>()
					{
					@Override
					public ArrayList<QuestionDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						QuestionDTO q_dto = new QuestionDTO();
						
						if (rs.getString("sub_name").equals(null))
							{
							q_dto.setAnslist("");
							q_dto.setSub_name(ss_dto.getSub_name());
							}
						
						else
							{
							q_dto.setAnslist(rs.getString("ex_ans2"));
							q_dto.setSub_name(rs.getString("sub_name"));
							}
						
						q_dto_list.add(q_dto);
						
						return q_dto_list;
						}
					},
				ss_dto.getSub_name()
				);
			}
		
		return results.isEmpty() ? null:results.get(0);
		
		
		/*
		 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
		 * QuestionDTO queDTO = null; ArrayList<QuestionDTO> queDTO_List = new
		 * ArrayList<QuestionDTO>();
		 * 
		 * String sql;
		 * 
		 * for (int i = 0; i < mySubList.size(); i++) {
		 * 
		 * try { sql = "select * from exam2 where sub_name=?"; conn =
		 * DBConn.getConnection(); pstmt = conn.prepareStatement(sql);
		 * pstmt.setString(1, subDTO.getSub_name()); rs = pstmt.executeQuery();
		 * 
		 * while(rs.next()) { queDTO = new QuestionDTO(); if
		 * (rs.getString("sub_name").equals(null))
		 * {System.out.println(rs.getString("sub_name")); queDTO.setAnslist("");
		 * queDTO.setSub_name(subDTO.getSub_name()); }
		 * 
		 * else { queDTO.setAnslist(rs.getString("ex_ans2"));
		 * queDTO.setSub_name(rs.getString("sub_name")); }
		 * 
		 * queDTO_List.add(queDTO); } }
		 * 
		 * catch(Exception e) { System.out.println("Question : stu_getAnswer() 에러 : " +
		 * e); }
		 * 
		 * finally { try { if (rs != null) rs.close(); if (pstmt != null) pstmt.close();
		 * if (conn != null) conn.close(); }
		 * 
		 * catch (Exception e) { throw new RuntimeException(e.getMessage()); } } }
		 * 
		 * return queDTO_List;
		 */
		}
	
	/*성적산출페이지 : 답안지 들고오기*/
	public String AnswerSheet(String sub_name, String s_id)
		{
		int sid = Integer.valueOf(s_id);
		
		List<String> results
		= jdbcTemplate.query
			("select ans_answer from answer where s_id =? and sub_name=?",
			new RowMapper<String>()
				{
				@Override
				public String mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					String Answer = rs.getString("ans_answer");
					
					return Answer;
					}
				},
			sid, sub_name
			);
		
		return results.isEmpty() ? "":results.get(0);
		}
	
	/*성적산출페이지 : 정답 들고오기*/
	public String CorrectSheet(String sub_name)
		{
		List<String> results
		= jdbcTemplate.query
			("select ex_ans2 from exam2 where sub_name=?",
			new RowMapper<String>()
				{
				@Override
				public String mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					String correct = rs.getString("ex_ans2");
					
					return correct;
					}
				},
			sub_name
			);
		
		return results.isEmpty() ? null:results.get(0);
		}
	}
