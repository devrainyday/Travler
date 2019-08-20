package arc.mirim.domain;

public class CourseVO {
	private int tcIdx;
	private String title;
	private String kind;
	private String startPlace;
	private String traffic;
	private String travelTerm;
	private String tCourse;
	private String tTravelPlace;
	private String tWarning;
	private String latitude;
	private String longitude;
	
	public int getTcIdx() {
		return tcIdx;
	}
	public void setTcIdx(int tcIdx) {
		this.tcIdx = tcIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getStartPlace() {
		return startPlace;
	}
	public void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getTravelTerm() {
		return travelTerm;
	}
	public void setTravelTerm(String travelTerm) {
		this.travelTerm = travelTerm;
	}
	public String gettCourse() {
		return tCourse;
	}
	public void settCourse(String tCourse) {
		this.tCourse = tCourse;
	}
	public String gettTravelPlace() {
		return tTravelPlace;
	}
	public void settTravelPlace(String tTravelPlace) {
		this.tTravelPlace = tTravelPlace;
	}
	public String gettWarning() {
		return tWarning;
	}
	public void settWarning(String tWarning) {
		this.tWarning = tWarning;
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
	
	@Override
	public String toString() {
		return "CourseVO [tcIdx=" + tcIdx + ", title=" + title + ", kind=" + kind + ", startPlace=" + startPlace
				+ ", traffic=" + traffic + ", travelTerm=" + travelTerm + ", tCourse=" + tCourse + ", tTravelPlace="
				+ tTravelPlace + ", tWarning=" + tWarning + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
}