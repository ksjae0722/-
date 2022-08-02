package mvc.model;

public class ssubjectDTO {
	private String sub_name;
	private String sub_code;
	private String sub_isu;
	private int sub_hakjum;
	private String p_name;
	private String p_id;
	private String sub_day;
	private int sub_time; //시작시간
	private int sub_allday;
	private String d_name;
	private int sub_room;
	private String sub_classtime; // 시작시간 ~ 끝시간까지 ,로 구분하여 string
	private int sub_max;
	
	

	public int getSub_max() {
		return sub_max;
	}
	public void setSub_max(int sub_max) {
		this.sub_max = sub_max;
	}
	public int getSub_room() {
		return sub_room;
	}
	public void setSub_room(int sub_room) {
		this.sub_room = sub_room;
	}
	public String getSub_classtime() {
		return sub_classtime;
	}
	public void setSub_classtime(String sub_classtime) {
		this.sub_classtime = sub_classtime;
	}
	
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getSub_code() {
		return sub_code;
	}
	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}
	public String getSub_isu() {
		return sub_isu;
	}
	public void setSub_isu(String sub_isu) {
		this.sub_isu = sub_isu;
	}
	public int getSub_hakjum() {
		return sub_hakjum;
	}
	public void setSub_hakjum(int sub_hakjum) {
		this.sub_hakjum = sub_hakjum;
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
	public String getSub_day() {
		return sub_day;
	}
	public void setSub_day(String sub_day) {
		this.sub_day = sub_day;
	}
	public int getSub_time() {
		return sub_time;
	}
	public void setSub_time(int sub_time) {
		this.sub_time = sub_time;
	}
	public int getSub_allday() {
		return sub_allday;
	}
	public void setSub_allday(int sub_allday) {
		this.sub_allday = sub_allday;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	
	
}
