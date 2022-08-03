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

import mvc.model.*;

public class StudentDAO
	{
	int index;
	
	private JdbcTemplate jdbcTemplate;

	public StudentDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	/* info 페이지에서 정보 가져오기 */
	public StudentDTO getinfo(int s_id)
		{
		List<StudentDTO> results
		= jdbcTemplate.query
			("select * from student where s_id=?",
			new RowMapper<StudentDTO>()
				{
				@Override
				public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					StudentDTO s_dto = new StudentDTO();
					s_dto.setS_id(rs.getInt("s_id"));
					s_dto.setS_name(rs.getString("s_name"));
					s_dto.setS_college(rs.getNString("s_college"));
					s_dto.setS_grade(rs.getInt("s_grade"));
					s_dto.setD_name(rs.getString("d_name"));
					s_dto.setS_email(rs.getString("s_email"));
					s_dto.setS_state(rs.getString("s_state"));
					s_dto.setS_address(rs.getString("s_address"));
					s_dto.setS_pNumber(rs.getString("s_pNumber"));
					s_dto.setS_account1(rs.getString("s_account1"));
					s_dto.setS_account2(rs.getString("s_account2"));
					s_dto.setS_account3(rs.getString("s_account3"));
					s_dto.setS_max(rs.getInt("s_max"));
					
					return s_dto;
					}
				},
			s_id
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* info페이지에서 수정:정보 업데이트 */
	public void update(String s_address, String s_pNumber, String s_email, String s_account1, String s_account2, String s_account3, String s_id)
		{
		jdbcTemplate.update("update student set s_address=?, s_pNumber=?, s_email=?, s_account1=?, s_account2=?, s_account3=? where s_id=?", s_address, s_pNumber, s_email, s_account1, s_account2, s_account3, s_id);
		}

	/* 수강신청페이지 : 과목의 총갯수, 선택학과의 총갯수 가져오기 */
	public int s_getListCount(String sel_sub)
		{
		int results;
		
		if (sel_sub == null || sel_sub.equals("major_all"))
			{
			results = jdbcTemplate.queryForObject("select count(*) from ssubject", Integer.class);
			}
		
		else
			{
			results = jdbcTemplate.queryForObject("select count(*) from ssubject where d_name=?", Integer.class, sel_sub);
			}
		
		return results;
		}

	/* 수강신청페이지 : 검색과목 몇개인지 들고오기 */
	public int s_searchListCount(String code)
		{
		int results;
		
		if (code.charAt(0) == 'S' || code.charAt(0) == 's')
			{
			results = jdbcTemplate.queryForObject("select count(*) from ssubject where sub_code=?", Integer.class, code);
			}
		
		else
			{
			results = jdbcTemplate.queryForObject("select count(*) from ssubject where sub_name like '%" + code + "%'", Integer.class);
			}
		
		return results;
		}

	/* 수강신청페이지 : 검색 과목DTO DB에서 가져오기 */
	public ArrayList<ssubjectDTO> searchSubjectList(int page, int limit, String code)
		{
		int TotalOfSubject = s_searchListCount(code);
		int start = (page - 1) * limit;
		index = start + 1;
		
		ArrayList<ssubjectDTO> list = new ArrayList<ssubjectDTO>();
		List<ArrayList<ssubjectDTO>> results;
		
		if (code.charAt(0) == 'S' || code.charAt(0) == 's')
			{
			results
			= jdbcTemplate.query
				("select * from ssubject where sub_code=?",
				new RowMapper<ArrayList<ssubjectDTO>>()
					{
					@Override
					public ArrayList<ssubjectDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						do
							{
							ssubjectDTO s_dto = new ssubjectDTO();

							s_dto.setD_name(rs.getString("d_name"));
							s_dto.setP_id(rs.getString("p_id"));
							s_dto.setP_name(rs.getString("p_name"));
							s_dto.setSub_allday(rs.getInt("sub_allday"));
							s_dto.setSub_code(rs.getString("sub_code"));
							s_dto.setSub_day(rs.getString("sub_day"));
							s_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
							s_dto.setSub_isu(rs.getString("sub_isu"));
							s_dto.setSub_name(rs.getString("sub_name"));
							s_dto.setSub_time(rs.getInt("sub_time"));
							s_dto.setSub_room(rs.getInt("sub_room"));
							s_dto.setSub_classtime(rs.getString("sub_classtime"));

							list.add(s_dto);
							
							if(index < (start + limit) && index<=TotalOfSubject)
								{
								index++;
								}
							else
								{
								break;
								}
							} while(rs.absolute(index));
						
						return list;
						}
					},
				code
				);
			}
		
		else
			{
			results
			= jdbcTemplate.query
				("select * from ssubject where sub_name like '%" + code + "%'",
				new RowMapper<ArrayList<ssubjectDTO>>()
					{
					@Override
					public ArrayList<ssubjectDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						do
							{
							ssubjectDTO s_dto = new ssubjectDTO();

							s_dto.setD_name(rs.getString("d_name"));
							s_dto.setP_id(rs.getString("p_id"));
							s_dto.setP_name(rs.getString("p_name"));
							s_dto.setSub_allday(rs.getInt("sub_allday"));
							s_dto.setSub_code(rs.getString("sub_code"));
							s_dto.setSub_day(rs.getString("sub_day"));
							s_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
							s_dto.setSub_isu(rs.getString("sub_isu"));
							s_dto.setSub_name(rs.getString("sub_name"));
							s_dto.setSub_time(rs.getInt("sub_time"));
							s_dto.setSub_room(rs.getInt("sub_room"));
							s_dto.setSub_classtime(rs.getString("sub_classtime"));

							list.add(s_dto);
							
							if(index < (start + limit) && index<=TotalOfSubject)
								{
								index++;
								}
							else
								{
								break;
								}
							} while(rs.absolute(index));
						
						return list;
						}
					}
				);
			}
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* 수강신청페이지 : 학과불러오기 */
	public ArrayList<departmentDTO> getMajor()
		{
		List<ArrayList<departmentDTO>> results
		= jdbcTemplate.query
			("select * from department",
			new RowMapper<ArrayList<departmentDTO>>()
				{
				@Override
				public ArrayList<departmentDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					ArrayList<departmentDTO> majorlist = new ArrayList<departmentDTO>();
					
					do
						{
						departmentDTO d_dto = new departmentDTO();

						d_dto.setD_code(rs.getString("d_code"));
						d_dto.setD_name(rs.getString("d_name"));

						majorlist.add(d_dto);
						} while(rs.next());
					
					return majorlist;
					}
				}
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* 수강신청페이지 : 선택학과나 모든 과목DTO DB에서 가져오기 */
	public ArrayList<ssubjectDTO> s_getSubjectList(int page, int limit, String sel_sub)
		{
		int TotalOfSubject = s_getListCount(sel_sub);
		int start = (page - 1) * limit;
		index = start + 1;
		ArrayList<ssubjectDTO> list = new ArrayList<ssubjectDTO>();
		
		List<ArrayList<ssubjectDTO>> results;
		
		if ((sel_sub == null) || (sel_sub.equals("major_all")))
			{
			results
			= jdbcTemplate.query
				("select * from ssubject",
				new RowMapper<ArrayList<ssubjectDTO>>()
					{
					@Override
					public ArrayList<ssubjectDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{	
						do
							{
							ssubjectDTO s_dto = new ssubjectDTO();
							s_dto.setD_name(rs.getString("d_name"));
							s_dto.setP_id(rs.getString("p_id"));
							s_dto.setP_name(rs.getString("p_name"));
							s_dto.setSub_allday(rs.getInt("sub_allday"));
							s_dto.setSub_code(rs.getString("sub_code"));
							s_dto.setSub_day(rs.getString("sub_day"));
							s_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
							s_dto.setSub_isu(rs.getString("sub_isu"));
							s_dto.setSub_name(rs.getString("sub_name"));
							s_dto.setSub_time(rs.getInt("sub_time"));
							s_dto.setSub_room(rs.getInt("sub_room"));
							s_dto.setSub_classtime(rs.getString("sub_classtime"));
							s_dto.setSub_max(rs.getInt("sub_max"));

							list.add(s_dto);
							
							if(index < (start + limit) && index<=TotalOfSubject)
								{
								index++;
								}
							else
								{
								break;
								}
							} while(rs.absolute(index));
						
						return list;
						}
					}
				);
			}
		
		else
			{
			results
			= jdbcTemplate.query
				("select * from ssubject",
				new RowMapper<ArrayList<ssubjectDTO>>()
					{
					@Override
					public ArrayList<ssubjectDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						do
							{
							ssubjectDTO s_dto = new ssubjectDTO();
							s_dto.setD_name(rs.getString("d_name"));
							s_dto.setP_id(rs.getString("p_id"));
							s_dto.setP_name(rs.getString("p_name"));
							s_dto.setSub_allday(rs.getInt("sub_allday"));
							s_dto.setSub_code(rs.getString("sub_code"));
							s_dto.setSub_day(rs.getString("sub_day"));
							s_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
							s_dto.setSub_isu(rs.getString("sub_isu"));
							s_dto.setSub_name(rs.getString("sub_name"));
							s_dto.setSub_time(rs.getInt("sub_time"));
							s_dto.setSub_room(rs.getInt("sub_room"));
							s_dto.setSub_classtime(rs.getString("sub_classtime"));
							s_dto.setSub_max(rs.getInt("sub_max"));

							list.add(s_dto);
							
							if(index < (start + limit) && index<=TotalOfSubject)
								{
								index++;
								}
							else
								{
								break;
								}
							} while(rs.absolute(index));
						
						return list;
						}
					},
				sel_sub
				);
			}
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* 수강신청페이지 : 해당과목 DB에서 가져오기 */
	public ssubjectDTO getssubjectDTO(String sub_code)
		{
		List<ssubjectDTO> results
		= jdbcTemplate.query
			("select * from ssubject where sub_code=?",
			new RowMapper<ssubjectDTO>()
				{
				@Override
				public ssubjectDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					ssubjectDTO ss_dto = new ssubjectDTO();
					ss_dto.setD_name(rs.getString("d_name"));
					ss_dto.setP_id(rs.getString("p_id"));
					ss_dto.setP_name(rs.getString("p_name"));
					ss_dto.setSub_allday(rs.getInt("sub_allday"));
					ss_dto.setSub_code(rs.getString("sub_code"));
					ss_dto.setSub_day(rs.getString("sub_day"));
					ss_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
					ss_dto.setSub_isu(rs.getString("sub_isu"));
					ss_dto.setSub_name(rs.getString("sub_name"));
					ss_dto.setSub_time(rs.getInt("sub_time"));
					ss_dto.setSub_room(rs.getInt("sub_room"));
					ss_dto.setSub_classtime(rs.getString("sub_classtime"));
					ss_dto.setSub_max(rs.getInt("sub_max"));
					
					return ss_dto;
					}
				},
			sub_code
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* 수강신청페이지:학생 최대학점 업데이트 / 학점 더하거나 학점 빼기*/
	public void updatehakjum(int hakjum, int s_id)
		{
		jdbcTemplate.update("update student set s_max=? where s_id=?", hakjum, s_id);
		}

	/* 수강신청페이지 : 해당과목 수강인원 */
	public int numberOfstudent(String sub_code)
		{
		int results = jdbcTemplate.queryForObject("select count(*) from application where sub_code=?", Integer.class, sub_code);
		
		return results;
		}

	/* 수강신청페이지 : 수강신청한 과목 DB에 넣기 */
	public void plusSubject(String sub_code, int s_id, String sub_name)
		{
		jdbcTemplate.update("insert into application(s_id, sub_name, sub_code) values(?,?,?)", s_id, sub_name, sub_code);
		}

	/* 수강신청페이지 : 내 수강신청 리스트 */
	public ArrayList<ssubjectDTO> mySubject(int s_id)
		{
		ArrayList<ssubjectDTO> list = new ArrayList<ssubjectDTO>();
		
		List<ArrayList<ssubjectDTO>> results
		= jdbcTemplate.query
			("select * from ssubject where sub_name in(select sub_name from application where s_id=?) order by sub_time",
			new RowMapper<ArrayList<ssubjectDTO>>()
				{
				@Override
				public ArrayList<ssubjectDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					do
						{
						ssubjectDTO subject = new ssubjectDTO();

						subject.setD_name(rs.getString("d_name"));
						subject.setP_id(rs.getString("p_id"));
						subject.setP_name(rs.getString("p_name"));
						subject.setSub_allday(rs.getInt("sub_allday"));
						subject.setSub_code(rs.getString("sub_code"));
						subject.setSub_day(rs.getString("sub_day"));
						subject.setSub_hakjum(rs.getInt("sub_hakjum"));
						subject.setSub_isu(rs.getString("sub_isu"));
						subject.setSub_name(rs.getString("sub_name"));
						subject.setSub_time(rs.getInt("sub_time"));
						subject.setSub_room(rs.getInt("sub_room"));
						subject.setSub_classtime(rs.getString("sub_classtime"));
						subject.setSub_max(rs.getInt("sub_max"));

						list.add(subject);
						} while(rs.next());
					
					return list;
					}
				},
			s_id
			);
		
		return results.isEmpty() ? null : results.get(0);
		}

	/* 수강신청페이지 : 내 수강과목 갯수 확인하기 */
	public int countmySubject(int s_id)
		{
		int results = jdbcTemplate.queryForObject("select count(*) from application where s_id = ?", Integer.class, s_id);
		
		return results;
		}

	/* 수강신청페이지 : 선택한 과목 수강신청에서 삭제*/
	public void deleteSubject(String sub_code, int s_id)
		{
		jdbcTemplate.update("delete from application where s_id=? and sub_code=?", s_id, sub_code);
		}
	
	/*수강신청페이지 : 삭제한 과목 성적처리에서 삭제*/
	public void deletelecture(int s_id, String sub_name)
		{
		jdbcTemplate.update("delete from lecture where s_id=? and sub_name=?", s_id, sub_name);
		}
	
	/* 시간표페이지 : 내 수강신청 리스트를 요일별로 정렬*/
	public ArrayList<ssubjectDTO> lineupWeek(ArrayList<ssubjectDTO> mylist, String day){
		ArrayList<ssubjectDTO> weeklist = new ArrayList<ssubjectDTO>();
		
		for(int i=0; i<mylist.size(); i++) {
			ssubjectDTO dto = mylist.get(i);
			String sub_day = dto.getSub_day();
			if(sub_day.equals(day)) {
				weeklist.add(dto);
			}
		}
		return weeklist;
	}

	/* 성적조회페이지 : 성적조회 목록 가져오기*/
	public ArrayList<lectureDTO> inquirylist(int s_id)
		{
		ArrayList<lectureDTO> l_dto_list = new ArrayList<lectureDTO>();
		
		List<ArrayList<lectureDTO>> results
		= jdbcTemplate.query
			("select * from lecture where s_id = ?",
			new RowMapper<ArrayList<lectureDTO>>()
				{
				@Override
				public ArrayList<lectureDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					do
						{
						lectureDTO l_dto = new lectureDTO();
						l_dto.setS_id(rs.getInt("s_id"));
						l_dto.setSub_name(rs.getString("sub_name"));
						l_dto.setLec_score(rs.getString("lec_score"));
						l_dto.setLec_no_date(rs.getInt("lec_no_date"));
						l_dto.setLec_year(rs.getInt("lec_year"));
						l_dto.setLec_semester(rs.getInt("lec_semester"));
						
						l_dto_list.add(l_dto);
						} while(rs.next());
					
					return l_dto_list;
					}
				},
			s_id
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	/* 성적조회페이지 : 과목(이수구분, 학점)들고오기 */
	public ssubjectDTO isuhakjumlist(String subject)
		{
		List<ssubjectDTO> results
		= jdbcTemplate.query
			("select * from ssubject where sub_name=?",
			new RowMapper<ssubjectDTO>()
				{
				@Override
				public ssubjectDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					ssubjectDTO ss_dto = new ssubjectDTO();
					
					ss_dto.setSub_isu(rs.getString("sub_isu"));
					ss_dto.setSub_hakjum(rs.getInt("sub_hakjum"));
					ss_dto.setSub_name(rs.getString("sub_name"));
					
					return ss_dto;
					}
				},
			subject
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	
	/*
	 * 수강신청페이지 : 중복수강신청확인하기=====>삭제예정 public int checkSubject(String sub_code, int
	 * s_id) { Connection conn = null; PreparedStatement pstmt = null; ResultSet rs
	 * = null;
	 * 
	 * int x = 0;
	 * 
	 * String sql;
	 * 
	 * try { conn = DBConn.getConnection(); sql =
	 * "select count(*) from application where sub_code=? and s_id=? "; pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, sub_code); pstmt.setInt(2,
	 * s_id);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { x = rs.getInt(1); } }catch(Exception ex) {
	 * System.out.println("checkSubject() 에러: " + ex); }finally { try { if(rs !=
	 * null) rs.close(); if(pstmt != null) pstmt.close(); if(conn != null)
	 * conn.close(); }catch(Exception ex) { throw new
	 * RuntimeException(ex.getMessage()); } } return x; }
	 */
}