package arc.mirim.domain;

import java.util.Date;

public class SecessionVO {
	private int sIdx;
	private String id;
	private String name;
	private Date secessionDate;
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getSecessionDate() {
		return secessionDate;
	}
	public void setSecessionDate(Date secessionDate) {
		this.secessionDate = secessionDate;
	}
	
	@Override
	public String toString() {
		return "SecessionVO [sIdx=" + sIdx + ", id=" + id + ", name=" + name + ", secessionDate="
				+ secessionDate + "]";
	}
}