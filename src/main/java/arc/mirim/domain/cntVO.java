package arc.mirim.domain;

public class cntVO {
	private String id;
	private String name;
	private int cnt;
	
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "cntVO [id=" + id + ", name=" + name + ", cnt=" + cnt + "]";
	}
}
