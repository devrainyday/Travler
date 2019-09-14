package arc.mirim.domain;

public class memberBookingNumVO {
	private String mId;
	private int num;
	private int totalCharge;
	
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
	public int getTotalCharge() {
		return totalCharge;
	}
	public void setTotalCharge(int totalCharge) {
		this.totalCharge = totalCharge;
	}
	
	@Override
	public String toString() {
		return "memberBookingNumVO [mId=" + mId + ", num=" + num + ", totalCharge=" + totalCharge + "]";
	}
}