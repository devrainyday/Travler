package arc.mirim.domain;

import java.util.Date;

public class BookingVO {
	private int tItemNum;
	private int bIdx;
	private String tTitle;
	private String mId;
	private String mName;
	private int totalCharge;
	private String bState;
	private Date bookingDate;
	private String warning;
	
	public int gettItemNum() {
		return tItemNum;
	}
	public void settItemNum(int tItemNum) {
		this.tItemNum = tItemNum;
	}
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String gettTitle() {
		return tTitle;
	}
	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getTotalCharge() {
		return totalCharge;
	}
	public void setTotalCharge(int totalCharge) {
		this.totalCharge = totalCharge;
	}
	public String getbState() {
		return bState;
	}
	public void setbState(String bState) {
		this.bState = bState;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	
	@Override
	public String toString() {
		return "BookingVO [tItemNum=" + tItemNum + ", bIdx=" + bIdx + ", tTitle=" + tTitle + ", mId=" + mId + ", mName="
				+ mName + ", totalCharge=" + totalCharge + ", bState=" + bState + ", bookingDate=" + bookingDate
				+ ", warning=" + warning + "]";
	}
	
}