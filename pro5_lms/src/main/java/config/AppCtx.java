package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import mvc.model.*;

@Configuration
public class AppCtx
	{
	@Bean(destroyMethod = "close")
	public DataSource dataSource()
		{
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/pro5_lms?characterEncoding = utf8");
		ds.setUsername("root");
		ds.setPassword("1234");
		ds.setInitialSize(5);
		ds.setMaxActive(10);
		
		return ds;
		}
	
	@Bean
	public applicationDAO applicationDAO()
		{
		return new applicationDAO(dataSource());
		}
	
	@Bean
	public BoardDAO boardDAO()
		{
		return new BoardDAO(dataSource());
		}
	
	@Bean
	public calendarDAO calendarDAO()
		{
		return new calendarDAO(dataSource());
		}
	
	@Bean
	public MemberDAO memberDAO()
		{
		return new MemberDAO(dataSource());
		}
	
	@Bean
	public notice_boardDAO notice_boardDAO()
		{
		return new notice_boardDAO(dataSource());
		}
	
	@Bean
	public PersonalDAO personalDAO()
		{
		return new PersonalDAO(dataSource());
		}
	
	@Bean
	public QuestionDAO questionDAO()
		{
		return new QuestionDAO(dataSource());
		}
	
	@Bean
	public StudentDAO studentDAO()
		{
		return new StudentDAO(dataSource());
		}
	}