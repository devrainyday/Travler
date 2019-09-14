package arc.mirim.domain;

import java.util.Date;

public class memberInfoVO {
	 private String id;
     private String name;
     private String email;
     private String phone;
     private Date joinDate;
     
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
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "memberInfoVO [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", joinDate="
				+ joinDate + ", getId()=" + getId() + ", getName()=" + getName() + ", getEmail()=" + getEmail()
				+ ", getPhone()=" + getPhone() + ", getJoinDate()=" + getJoinDate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
     
}
