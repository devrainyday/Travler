package arc.mirim.domain;

public class travelCntVO {
	private int tcIdx;
	private String title;
	private int cnt;
	private int sum;
	
	public int getTcIdx() {
		return tcIdx;
	}
	public void setTcIdx(int tcIdx) {
		this.tcIdx = tcIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	@Override
	public String toString() {
		return "travelCntVO [tcIdx=" + tcIdx + ", title=" + title + ", cnt=" + cnt + ", sum=" + sum + "]";
	}	
}