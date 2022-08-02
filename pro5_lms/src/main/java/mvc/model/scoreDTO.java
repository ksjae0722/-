package mvc.model;

public class scoreDTO {
	private String Answer;
	private String correct;
	private String[] compare;
	private int point;
	
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	public String[] getCompare() {
		return compare;
	}
	public void setCompare(String[] compare) {
		this.compare = compare;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
