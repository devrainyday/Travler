package arc.mirim.domain;

public class festivalNumVO {
	private int fIdx;
	private String title;
	
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
	
	@Override
	public String toString() {
		return "festivalNumVO [fIdx=" + fIdx + ", title=" + title + "]";
	}
}
