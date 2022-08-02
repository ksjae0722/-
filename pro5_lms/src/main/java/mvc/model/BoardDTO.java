package mvc.model;

public class BoardDTO {
	private int po_num; //글번호
	private String po_subject; // 글제목
	private String po_date; // 등록일
	private String sub_name; //과목명
	private String p_oNumber; //연락처
	private String n_contents; //글내용
	private String p_name; //작성자
	private String p_id; //직번
	private String po_filename; //파일이름
	private String po_realname; //파일원본이름
	
	
	public String getPo_realname() {
		return po_realname;
	}
	public void setPo_realname(String po_realname) {
		this.po_realname = po_realname;
	}
	public int getPo_num() {
		return po_num;
	}
	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}
	public String getPo_subject() {
		return po_subject;
	}
	public void setPo_subject(String po_subject) {
		this.po_subject = po_subject;
	}
	public String getPo_date() {
		return po_date;
	}
	public void setPo_date(String po_date) {
		this.po_date = po_date;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getP_oNumber() {
		return p_oNumber;
	}
	public void setP_oNumber(String p_oNumber) {
		this.p_oNumber = p_oNumber;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getPo_filename() {
		return po_filename;
	}
	public void setPo_filename(String po_filename) {
		this.po_filename = po_filename;
	}
	
	
	
	

}
