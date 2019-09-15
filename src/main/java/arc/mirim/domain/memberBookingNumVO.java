package arc.mirim.domain;

public class memberBookingNumVO {
	private String mId;
	private int num;
	private String l;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getL() {
		return l;
	}
	public void setL(String l) {
		this.l = l;
	}
	
	@Override
	public String toString() {
		return "memberBookingNumVO [mId=" + mId + ", num=" + num + ", l=" + l + "]";
	}
	
	
}