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

public class applicationDAO {
	private JdbcTemplate jdbcTemplate;
	
	public applicationDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	
	public int getCount(String sub_name)
		{
		Integer results = jdbcTemplate.queryForObject("select count(*) from application where sub_name=?", Integer.class, sub_name);
		
		return results;
		}
	
	public ArrayList<StudentDTO> getStudentList(String listfirst)
		{
		List<ArrayList<StudentDTO>> results
		= jdbcTemplate.query
			("select * from student where s_id in (select s_id from application where sub_name=?)",
			new RowMapper<ArrayList<StudentDTO>>()
				{
				@Override
				public ArrayList<StudentDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					ArrayList<StudentDTO> st_list = new ArrayList<StudentDTO>();
					
					do
						{
						StudentDTO StudentDTO = new StudentDTO();
						StudentDTO.setS_id(rs.getInt("s_id"));
						StudentDTO.setS_name(rs.getString("s_name"));
						st_list.add(StudentDTO);
						} while (rs.next());
					
					return st_list;
					}
				},
			listfirst
			);
		
		return results.isEmpty() ? null : results.get(0);
		}
	
	public ArrayList<StudentDTO> get_Stu_list(String subject_name)
		{
		ArrayList<Integer> stuId = new ArrayList<Integer>();
		ArrayList<StudentDTO> stuArr = new ArrayList<StudentDTO>();
		
		jdbcTemplate.query
			("select * from application where sub_name=?",
			new RowMapper<ArrayList<Integer>>()
				{
				@Override
				public ArrayList<Integer> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					do
						{
						int s_id = rs.getInt("s_id");
						stuId.add(s_id);
						} while(rs.next());
					
					return stuId;
					}
				},
			subject_name
			);
		
		for(int i = 0; i < stuId.size(); i++)
			{
			jdbcTemplate.query
				("select * from student where s_id=?",
				new RowMapper<ArrayList<StudentDTO>>()
					{
					@Override
					public ArrayList<StudentDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						StudentDTO stuDTO = new StudentDTO();
						stuDTO.setS_id(rs.getInt("s_id"));
						stuDTO.setS_name(rs.getString("s_name"));
						stuDTO.setD_name(rs.getString("d_name"));
						stuDTO.setS_grade(rs.getInt("s_grade"));
						
						stuArr.add(stuDTO);
						
						return stuArr;
						}
					},
				stuId.get(i)
				);
			}
		
		return stuArr;
		}
}
