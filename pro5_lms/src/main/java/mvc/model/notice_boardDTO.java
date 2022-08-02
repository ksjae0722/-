package mvc.model;

public class notice_boardDTO
	{
	private int n_num;
	private String n_subject;
	private String n_date;
	private String p_department;
	private String p_oNumber;
	private String n_contents;
	private String p_name;
	private String p_id;
	private String n_filename; //파일이름
	private String n_realname; //파일원본이름
	
	public int getN_num()
		{
		return n_num;
		}
	
	public void setN_num(int n_num)
		{
		this.n_num = n_num;
		}
	
	public String getN_subject()
		{
		return n_subject;
		}
	
	public void setN_subject(String n_subject)
		{
		this.n_subject = n_subject;
		}
	
	public String getN_date()
		{
		return n_date;
		}
	
	public void setN_date(String n_date)
		{
		this.n_date = n_date;
		}
	
	public String getP_department()
		{
		return p_department;
		}
	
	public void setP_department(String p_department)
		{
		this.p_department = p_department;
		}
	
	public String getP_oNumber()
		{
		return p_oNumber;
		}
	
	public void setP_oNumber(String p_oNumber)
		{
		this.p_oNumber = p_oNumber;
		}
	
	public String getN_contents()
		{
		return n_contents;
		}
	
	public void setN_contents(String n_contents)
		{
		this.n_contents = n_contents;
		}

	public String getP_name()
		{
		return p_name;
		}

	public void setP_name(String p_name)
		{
		this.p_name = p_name;
		}

	public String getP_id()
		{
		return p_id;
		}

	public void setP_id(String p_id)
		{
		this.p_id = p_id;
		}

	public String getN_filename()
		{
		return n_filename;
		}

	public void setN_filename(String n_filename)
		{
		this.n_filename = n_filename;
		}

	public String getN_realname()
		{
		return n_realname;
		}

	public void setN_realname(String n_realname)
		{
		this.n_realname = n_realname;
		}
	}