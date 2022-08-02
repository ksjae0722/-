package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.BoardController;
import controller.MemberController;
import controller.PersonalController;
import controller.StudentController;
import controller.notice_boardController;

@Configuration
public class ControllerConfig
	{
	@Bean
	public BoardController boardController()
		{
		return new BoardController();
		}
	
	@Bean
	public MemberController memberController()
		{
		return new MemberController();
		}
	
	@Bean
	public notice_boardController notice_boardController()
		{
		return new notice_boardController();
		}
	
	@Bean
	public PersonalController personalController()
		{
		return new PersonalController();
		}
	
	@Bean
	public StudentController studentController()
		{
		return new StudentController();
		}
	}