package mvc.model;

public class QuestionDTO
	{
	private int ex_code;
	private String sub_name;
	private int ex_num;
	private String ex_contents;
	private int ex_ans;
	private String anslist;
	private int s_id;
	
	public int getEx_code()
		{
		return ex_code;
		}
	
	public void setEx_code(int ex_code)
		{
		this.ex_code = ex_code;
		}
	
	public String getSub_name()
		{
		return sub_name;
		}
	
	public void setSub_name(String sub_name)
		{
		this.sub_name = sub_name;
		}
	
	public int getEx_num()
		{
		return ex_num;
		}
	
	public void setEx_num(int ex_num)
		{
		this.ex_num = ex_num;
		}
	
	public String getEx_contents()
		{
		return ex_contents;
		}
	
	public void setEx_contents(String ex_contents)
		{
		this.ex_contents = ex_contents;
		}
	
	public int getEx_ans()
		{
		return ex_ans;
		}
	
	public void setEx_ans(int ex_ans)
		{
		this.ex_ans = ex_ans;
		}

	public String getAnslist()
		{
		return anslist;
		}

	public void setAnslist(String anslist)
		{
		this.anslist = anslist;
		}

	public int getS_id()
		{
		return s_id;
		}

	public void setS_id(int s_id)
		{
		this.s_id = s_id;
		}
	}
