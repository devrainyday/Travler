package arc.mirim.domain;

public class courseNumVO {
	private int tcIdx;
	private String title;
	
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
	
	@Override
	public String toString() {
		return "courseNumVO [tcIdx=" + tcIdx + ", title=" + title + "]";
	}
}
