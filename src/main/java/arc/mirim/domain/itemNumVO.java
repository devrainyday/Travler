package arc.mirim.domain;

public class itemNumVO {
	private int num;
	private int tItemNum;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int gettItemNum() {
		return tItemNum;
	}
	public void settItemNum(int tItemNum) {
		this.tItemNum = tItemNum;
	}
	
	@Override
	public String toString() {
		return "itemNumVO [num=" + num + ", tItemNum=" + tItemNum + "]";
	}
}