package arc.mirim.domain;

import java.util.Date;

public class MemberVO {
    private int mIdx;
    private String id;
    private String pwd;
    private String name;
    private String email;
    private String phone;
    private int travelNum;
    private Date joinDate;
    
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getTravelNum() {
		return travelNum;
	}
	public void setTravelNum(int travelNum) {
		this.travelNum = travelNum;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mIdx=" + mIdx + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", phone=" + phone + ", travelNum=" + travelNum + ", joinDate=" + joinDate + "]";
	}
}