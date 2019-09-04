package arc.mirim.domain;

public class SigninDTO {
	private int num;
    private String id;
    private String pwd;
    private String name;
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	
	@Override
	public String toString() {
		return "SigninDTO [num=" + num + ", id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}
}