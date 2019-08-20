package arc.mirim.domain;

import java.util.Date;

public class FestivalVO {
	private int fIdx;
	private String title;
	private String explain;
	private Date startDay;
	private Date endDay;
	private int charge;
	private String host;
	private String address;
	private String latitude;
	private String longitude;
	private String phone;
	private String site;
	
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
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
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
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	@Override
	public String toString() {
		return "festivalVO [fIdx=" + fIdx + ", title=" + title + ", explain=" + explain + ", startDay="
				+ startDay + ", endDay=" + endDay + ", charge=" + charge + ", host=" + host + ", address=" + address
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", phone=" + phone + ", site=" + site + "]";
	}
}