package arc.mirim.domain;

public class fCntVO {
	private int fIdx;
	private String title;
	private int cnt;
	
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
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
	
	@Override
	public String toString() {
		return "fCntVO [fIdx=" + fIdx + ", title=" + title + ", cnt=" + cnt + "]";
	}
}