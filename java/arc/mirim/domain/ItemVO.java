package arc.mirim.domain;

import java.util.Date;

public class ItemVO {
	private int tCourseNum;
	private int tiIdx;
	private Date startDay;
	private Date endDay;
	private int charge;
	private int childCharge;
	private int infantCharge;
	private int minMan;
	private int maxMan;
	private String managerMan;
	private String managerCall;
	private int hit;
	
	public int gettCourseNum() {
		return tCourseNum;
	}
	public void settCourseNum(int tCourseNum) {
		this.tCourseNum = tCourseNum;
	}
	public int getTiIdx() {
		return tiIdx;
	}
	public void setTiIdx(int tiIdx) {
		this.tiIdx = tiIdx;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public int getChildCharge() {
		return childCharge;
	}
	public void setChildCharge(int childCharge) {
		this.childCharge = childCharge;
	}
	public int getInfantCharge() {
		return infantCharge;
	}
	public void setInfantCharge(int infantCharge) {
		this.infantCharge = infantCharge;
	}
	public int getMinMan() {
		return minMan;
	}
	public void setMinMan(int minMan) {
		this.minMan = minMan;
	}
	public int getMaxMan() {
		return maxMan;
	}
	public void setMaxMan(int maxMan) {
		this.maxMan = maxMan;
	}
	public String getManagerMan() {
		return managerMan;
	}
	public void setManagerMan(String managerMan) {
		this.managerMan = managerMan;
	}
	public String getManagerCall() {
		return managerCall;
	}
	public void setManagerCall(String managerCall) {
		this.managerCall = managerCall;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "ItemVO [tCourseNum=" + tCourseNum + ", tiIdx=" + tiIdx + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", charge=" + charge + ", childCharge=" + childCharge + ", infantCharge=" + infantCharge + ", minMan="
				+ minMan + ", maxMan=" + maxMan + ", managerMan=" + managerMan + ", managerCall=" + managerCall
				+ ", hit=" + hit + "]";
	}
}