package mvc.model;

public class calendarDTO {
	private int cal_num; //학사일정 번호
	private String date1; //시작 날짜
	private String date2; //마지막 날짜
	private String cal_contents; //내용
	
	public int getCal_num() {
		return cal_num;
	}
	public void setCal_num(int cal_num) {
		this.cal_num = cal_num;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public String getCal_contents() {
		return cal_contents;
	}
	public void setCal_contents(String cal_contents) {
		this.cal_contents = cal_contents;
	}
	
	
}
