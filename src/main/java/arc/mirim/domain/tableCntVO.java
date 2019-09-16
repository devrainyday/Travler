package arc.mirim.domain;

public class tableCntVO {
	private String tableName;
	private int Cnt;
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getCnt() {
		return Cnt;
	}
	public void setCnt(int cnt) {
		Cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "tableCntVO [tableName=" + tableName + ", Cnt=" + Cnt + "]";
	}	
}