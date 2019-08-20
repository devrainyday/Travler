package arc.mirim.domain;

import java.util.Date;

public class FestivalBoardVO {
	private int fetivalNum;
	private int fbIdx;
	private int memberNum;
	private String memberName;
	private String memberId;
	private String fComment;
	private Date boardDate;
	
	public int getFetivalNum() {
		return fetivalNum;
	}
	public void setFetivalNum(int fetivalNum) {
		this.fetivalNum = fetivalNum;
	}
	public int getfbIdx() {
		return fbIdx;
	}
	public void setfbIdx(int fbIdx) {
		this.fbIdx = fbIdx;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getfComment() {
		return fComment;
	}
	public void setfComment(String fComment) {
		this.fComment = fComment;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	
	@Override
	public String toString() {
		return "festivalBoardVO [fetivalNum=" + fetivalNum + ", fbIdx=" + fbIdx + ", memberNum="
				+ memberNum + ", memberName=" + memberName + ", memberId=" + memberId + ", fComment="
				+ fComment + ", boardDate=" + boardDate + "]";
	}
}