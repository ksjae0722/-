package mvc.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO
	{
	private JdbcTemplate jdbcTemplate;
	
	public MemberDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	/*회원가입 : 주민등록번호로 학번/직번 조회*/
	public String[] get_NameId(String jumin1, String jumin2)
		{
		List<String[]> results
		= jdbcTemplate.query
			("select s_name, s_id, s_passwd from student where s_regNumber1=? and s_regNumber2=?",
			new RowMapper<String[]>()
				{
				@Override
				public String[] mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					String[] nameId = new String[4];
					nameId[0] = rs.getString("s_name");
					nameId[1] = rs.getString("s_id");

					if(rs.getString("s_passwd")==null)
						{
						//비밀번호가 없으면
						nameId[2] = "0";
						nameId[3] = "0";
						}

					else
						{
						//비밀번호가 있으면
						nameId[2] = "1";
						nameId[3] = "1";
						}

					return nameId;
					}
				},
			jumin1, jumin2
			);
		
		if (results.isEmpty())
			{
			results
			= jdbcTemplate.query
				("select p_name, p_id, p_passwd from personal where p_regNumber1=? and p_regNumber2=?",
				new RowMapper<String[]>()
					{
					@Override
					public String[] mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						String[] nameId = new String[4];
						nameId[0] = rs.getString("p_name");
						nameId[1] = rs.getString("p_id");

						if(rs.getString("p_passwd")==null)
							{
							//비밀번호가 없으면
							nameId[2] = "0";
							nameId[3] = "0";
							}

						else
							{
							//비밀번호가 있으면
							nameId[2] = "1";
							nameId[3] = "1";
							}

						return nameId;
						}
					},
					jumin1, jumin2
				);
			}
		
		return results.isEmpty() ? null : results.get(0);
		}
	
	/*회원가입 : 비밀번호 초기 세팅*/
	public void update_pw(String id, String pw)
		{
		if (id.charAt(0)=='p')
			{
			jdbcTemplate.update("update personal set p_passwd = ? where p_id = ?", pw, id);
			}
		
		else
			{
			jdbcTemplate.update("update student set s_passwd = ? where s_id = ?", pw, id);
			}
		}
	
	/*로그인*/
	public String[] login(String id, String pw)
		{
		List<String[]> results;
		String[] IdPwNum = new String[3];
		
		if (id.charAt(0)=='p')
			{
			results
			= jdbcTemplate.query
				("select p_name from personal where p_id=? and p_passwd=?",
				new RowMapper<String[]>()
					{
					@Override
					public String[] mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						IdPwNum[0] = id;
						IdPwNum[1] = rs.getString("p_name");
						IdPwNum[2] = "1";
						
						return IdPwNum;
						}
					},
				id, pw
				);
			}
		
		else
			{
			results
			= jdbcTemplate.query
				("select s_name from student where s_id=? and s_passwd=?",
				new RowMapper<String[]>()
					{
					@Override
					public String[] mapRow(ResultSet rs, int rowNum) throws SQLException
						{ 
						IdPwNum[0] = id;
						IdPwNum[1] = rs.getString("s_name");
						IdPwNum[2] = "2";
						
						return IdPwNum;
						}
					},
				id, pw
				);
			}
		
		if(IdPwNum[0]==null && IdPwNum[1]==null && IdPwNum[2]==null)
			{
			IdPwNum[2] = "3";
			}
		
		return IdPwNum;
		}
	
	
	/*회원정보 : 비밀번호 일치여부*/
	public int checkpw(String id, String pw_before)
		{
		int results = 0;
		
		String sql;
		if(id.charAt(0)=='p')
			{
			sql = "select count(*) from personal where p_id=? and p_passwd=?";
			}
		else
			{
			sql = "select count(*) from student where s_id=? and s_passwd=?";
			}
		
		results = jdbcTemplate.queryForObject(sql, Integer.class, id, pw_before);
		
		return results;
		}
	
	/*회원정보 : 비밀번호 변경*/
	public void changepasswd(String id, String pw_new)
		{
		String sql;
		
		if(id.charAt(0)=='p')
			{
			sql = "update personal set p_passwd=? where p_id=?";
			}
		
		else
			{
			sql = "update student set s_passwd=? where s_id=?";
			}
		
		jdbcTemplate.update(sql, pw_new, id);
		}
	}


