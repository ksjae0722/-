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

public class calendarDAO
	{
	int index;
	
	private JdbcTemplate jdbcTemplate;
	
	public calendarDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	public int getListCount()
		{
		Integer results = jdbcTemplate.queryForObject("select count(*) from calendar", Integer.class);
		
		return results;
		}
	
	public ArrayList<calendarDTO> getCallist(int page, int limit)
		{
		ArrayList<calendarDTO> list = new ArrayList<calendarDTO>();
		
		int totalofcalendar = getListCount();
		int start = (page -1) * limit;
		index = start + 1;

		List<ArrayList<calendarDTO>> results
		= jdbcTemplate.query
			("select * from calendar",
			new RowMapper<ArrayList<calendarDTO>>()
				{
				@Override
				public ArrayList<calendarDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					do
						{
						if (rs.getInt("cal_num") != index)
							{
							continue;
							}
						
						calendarDTO calendar = new calendarDTO();
						calendar.setCal_num(rs.getInt("cal_num"));
						calendar.setDate1(rs.getString("cal_date1"));
						calendar.setDate2(rs.getString("cal_date2"));
						calendar.setCal_contents(rs.getString("cal_contents"));
						list.add(calendar);
						
						if(index < (start + limit) && index<=totalofcalendar)
							{
							index++;
							}
						else
							{
							break;
							}
						}
					while(rs.next());
					
					return list;
					}
				}
			);
		
		return results.isEmpty() ? null : results.get(0);
		}
	}