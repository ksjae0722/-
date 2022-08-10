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

public class notice_boardDAO
	{
	int index;
	
	private JdbcTemplate jdbcTemplate;
	
	public notice_boardDAO(DataSource dataSource)
		{
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}

	//공지사항 테이블 레코드 개수
	public int getListCount(String items, String text)
		{
		Integer results;
		
		if (items == null && text == null)
			{
			results = jdbcTemplate.queryForObject("select count(*) from notice", Integer.class);
			}
		
		else
			{
			results = jdbcTemplate.queryForObject("select count(*) from notice where " + items + " like '%" + text + "%'", Integer.class);
			}
		
		return results;
		}
	
	//공지사항 전체글 가져오기
	public ArrayList<notice_boardDTO> getBoardList(int pageNum, int limit, String items, String text)
		{
		ArrayList<notice_boardDTO> list = new ArrayList<notice_boardDTO>();
		
		int total_record = getListCount();
		int end = (pageNum -1) * limit;
		index = total_record-end;
		
		List<ArrayList<notice_boardDTO>> results;
		if(items != null && text != null)
			{
			results = jdbcTemplate.query
				("select * from notice order by n_num desc",
				new RowMapper<ArrayList<notice_boardDTO>>()
					{
					@Override
					public ArrayList<notice_boardDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						do
							{
							if (rs.getInt("n_num") != index)
								{
								continue;
								}
						
							notice_boardDTO nbDTO = new notice_boardDTO();
							nbDTO.setN_num(rs.getInt("n_num"));
							nbDTO.setN_subject(rs.getString("n_subject"));
							nbDTO.setN_date(rs.getString("n_date"));
							nbDTO.setP_department(rs.getString("p_department"));
							nbDTO.setP_oNumber(rs.getString("p_oNumber"));
							nbDTO.setN_contents(rs.getString("n_contents"));
							nbDTO.setP_name(rs.getString("p_name"));
							nbDTO.setP_id(rs.getString("p_id"));
							
							list.add(nbDTO);
							
							if(index > total_record-end-9)
								{
								index--;
								}
							else
								{	
								break;
								}
							} while(rs.next());
						
						return list;
						}
					}
				);
			}
		
		else
			{
			results
			= jdbcTemplate.query
				("select * from notice where " + items + " like '%" + text + "%' order by n_num desc",
				new RowMapper<ArrayList<notice_boardDTO>>()
					{
					@Override
					public ArrayList<notice_boardDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
						{
						do
							{
							if (rs.getInt("n_num") != index)
								{
								continue;
								}
						
							notice_boardDTO nbDTO = new notice_boardDTO();
							nbDTO.setN_num(rs.getInt("n_num"));
							nbDTO.setN_subject(rs.getString("n_subject"));
							nbDTO.setN_date(rs.getString("n_date"));
							nbDTO.setP_department(rs.getString("p_department"));
							nbDTO.setP_oNumber(rs.getString("p_oNumber"));
							nbDTO.setN_contents(rs.getString("n_contents"));
							nbDTO.setP_name(rs.getString("p_name"));
							nbDTO.setP_id(rs.getString("p_id"));
							
							list.add(nbDTO);
							
							if(index > total_record-end-9)
								{
								index--;
								}
							else
								{	
								break;
								}
							} while(rs.next());
						
						return list;
						}
					}
				);
			}
		
		return results.isEmpty() ? list : results.get(0);
		}
	
	/*새 글 작성 시 데이터 집어넣기*/
	public void insertBoard(notice_boardDTO nbDTO)
		{
		jdbcTemplate.update("insert into notice(n_subject, n_date, p_department, p_oNumber, n_filename, n_realname, n_contents, p_name, p_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", nbDTO.getN_subject(), nbDTO.getN_date(), nbDTO.getP_department(), nbDTO.getP_oNumber(), nbDTO.getN_filename(), nbDTO.getN_realname(), nbDTO.getN_contents(), nbDTO.getP_name(), nbDTO.getP_id());
		}
	
	/*제목 클릭 시 해당글 가져오기*/
	public notice_boardDTO getClick_title(int n_num)
		{
		List<notice_boardDTO> results
		= jdbcTemplate.query
			("select * from notice where n_num = ?",
			new RowMapper<notice_boardDTO>()
				{
				@Override
				public notice_boardDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					notice_boardDTO nb_dto = new notice_boardDTO();
					nb_dto.setN_subject(rs.getString("n_subject"));
					nb_dto.setN_date(rs.getString("n_date"));
					nb_dto.setP_department(rs.getString("p_department"));
					nb_dto.setP_oNumber(rs.getString("p_oNumber"));
					nb_dto.setN_filename(rs.getString("n_filename"));
					nb_dto.setN_realname(rs.getString("n_realname"));
					nb_dto.setN_contents(rs.getString("n_contents"));
					nb_dto.setP_id(rs.getString("p_id"));
					
					return nb_dto;
					}
				},
			n_num
			);
		
		return results.isEmpty() ? null:results.get(0);
		}
	
	public notice_boardDTO editform(int n_num)
		{
		List<notice_boardDTO> results
		= jdbcTemplate.query
			("select * from notice where n_num = ?",
			new RowMapper<notice_boardDTO>()
				{
				@Override
				public notice_boardDTO mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					notice_boardDTO nb_dto = new notice_boardDTO();
					nb_dto.setN_subject(rs.getString("n_subject"));
					nb_dto.setP_department(rs.getString("p_department"));
					String contents = rs.getString("n_contents");
					contents = contents.replace("<br>", "\r\n");
					nb_dto.setN_contents(contents);
					
					return nb_dto;
					}
				},
			n_num
			);
		
		return results.isEmpty() ? null:results.get(0);
		}
	
	public void update_editnotice(int n_num, String title, String contents, String write_day, String savefile, String fileRealName)
		{
		jdbcTemplate.update("update notice set n_subject=?, n_date=?, n_contents=?, n_filename=?, n_realname=? where n_num=?", title, write_day, contents, savefile, fileRealName, n_num);
		}
	
	public void deleteDAO(int n_num)
		{
		jdbcTemplate.update("delete from notice where n_num=?", n_num);
		}
	
	//main에서 4개씩 보여주기
	public int getListCount()
		{
		Integer results = jdbcTemplate.queryForObject("select count(*) from notice", Integer.class);
		
		return results;
		}
	
	public ArrayList<notice_boardDTO> getBoardList(int pageNum, int limit)
		{
		ArrayList<notice_boardDTO> list = new ArrayList<notice_boardDTO>();
		
		int total_record = getListCount();
		int end = (pageNum -1) * limit;
		index = total_record-end;
		
		List<ArrayList<notice_boardDTO>> results
		= jdbcTemplate.query
			("select * from notice order by n_num desc",
			new RowMapper<ArrayList<notice_boardDTO>>()
				{
				@Override
				public ArrayList<notice_boardDTO> mapRow(ResultSet rs, int rowNum) throws SQLException
					{
					do
						{
						if (rs.getInt("n_num") != index)
							{
							continue;
							}
					
						notice_boardDTO nbDTO = new notice_boardDTO();
						nbDTO.setN_num(rs.getInt("n_num"));
						nbDTO.setN_subject(rs.getString("n_subject"));
						nbDTO.setN_date(rs.getString("n_date"));
						nbDTO.setP_department(rs.getString("p_department"));
						nbDTO.setP_oNumber(rs.getString("p_oNumber"));
						nbDTO.setN_contents(rs.getString("n_contents"));
						nbDTO.setP_name(rs.getString("p_name"));
						nbDTO.setP_id(rs.getString("p_id"));
						
						list.add(nbDTO);
						
						if(index > total_record-end-3)
							{
							index--;
							}
						else
							{	
							break;
							}
						} while(rs.next());
					
					return list;
					}
				}
			);
		
		return results.isEmpty() ? list : results.get(0);
		}
	}