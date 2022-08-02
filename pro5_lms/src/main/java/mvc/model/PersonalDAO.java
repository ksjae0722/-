package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import mvc.database.DBConn;

public class PersonalDAO
	{
	private JdbcTemplate jdbcTemplate;
	
	public PersonalDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	/*info페이지에서 정보 가져오기*/
	public PersonalDTO getinfo(String p_id)
		{
		List<PersonalDTO> results
		= jdbcTemplate.query
			("select * from personal where p_id=?",
			new RowMapper<PersonalDTO>()
				{
				@Override
				public PersonalDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					PersonalDTO dto = new PersonalDTO();
					dto.setP_id(rs.getString("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_college(rs.getString("p_college"));
					dto.setP_department(rs.getString("p_department"));
					dto.setP_major(rs.getString("p_major"));
					dto.setP_office(rs.getString("p_office"));
					dto.setP_oNumber(rs.getString("p_oNumber"));
					dto.setP_email(rs.getString("p_email"));
					
					return dto;
					}
				},
			p_id
			);
		
		return results.isEmpty() ? null : results.get(0);
		}
	
	/*info페이지에서 수정 : 정보 업데이트*/
	public void update(String p_adress, String p_phone, String p_email, String p_id)
		{
		jdbcTemplate.update("update personal set p_office=?, p_oNumber=?, p_email=? where p_id=?", p_adress, p_phone, p_email, p_id);
		}

	/*과목 수업일수 들고오기*/
	public String getstudyday(String sub_name)
		{
		List<String> results
		= jdbcTemplate.query
			("select * from ssubject where sub_name=?",
			new RowMapper<String>()
				{
				@Override
				public String mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					String suballday = String.valueOf(rs.getInt("sub_allday"));
					
					return suballday;
					}
				},
			sub_name
			);
		
		return results.isEmpty() ? null : results.get(0);
		}

	/*강의테이블들고오기*/
	public lectureDTO getlec(String sub_name, String s_id)
		{
		int sid = -1;
		if (s_id != null)
			{
			sid = Integer.valueOf(s_id);
			}
		
		List<lectureDTO> results
		= jdbcTemplate.query
			("select * from lecture where sub_name=? and s_id=?",
			new RowMapper<lectureDTO>()
				{
				@Override
				public lectureDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					lectureDTO l_dto = new lectureDTO();
					l_dto.setLec_no_date(rs.getInt("lec_no_date"));
					l_dto.setLec_score(rs.getString("lec_score"));
					
					return l_dto;
					}
				},
			sub_name, sid
			);
		
		return results.isEmpty() ? null:results.get(0);
		}

	/*강의테이블에 넣기*/
	public void putScore(String sub_name, String s_id, String lec_point, int absence)
		{
		Calendar ld = Calendar.getInstance();
		int year = ld.get(Calendar.YEAR);
		int month = ld.get(Calendar.MONTH)+1;
		int semester = 0;
		
		if(month>=3&&month<=6)
			{
			semester = 1;
			}
		
		else if(month>=9&&month<=12)
			{
			semester = 2;
			}
		
		int sid = Integer.valueOf(s_id);
		
		jdbcTemplate.update("insert into lecture (s_id, sub_name, lec_score, lec_no_date, lec_year, lec_semester) values(?,?,?,?,?,?)", sid, sub_name, lec_point, absence, year, semester);
		}
	
	/*강의테이블에 업데이트*/
	public void updateScore(String sub_name, String s_id, String lec_point, int absence)
		{
		int sid = Integer.valueOf(s_id);
		
		jdbcTemplate.update("update lecture set lec_score=?, lec_no_date=? where s_id = ? and sub_name=?", lec_point, absence, sid, sub_name);
		}
	}