package arc.mirim.domain;

import java.util.Date;

public class FestivalBoardVO {
	private int festivalNum;
	private int fbIdx;
	private String memberId;
	private String memberName;
	private String fComment;
	private Date boardDate;
	
	public int getFestivalNum() {
		return festivalNum;
	}
	public void setFestivalNum(int festivalNum) {
		this.festivalNum = festivalNum;
	}
	public int getFbIdx() {
		return fbIdx;
	}
	public void setFbIdx(int fbIdx) {
		this.fbIdx = fbIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
		return "FestivalBoardVO [festivalNum=" + festivalNum + ", fbIdx=" + fbIdx + ", memberId=" + memberId
				+ ", memberName=" + memberName + ", fComment=" + fComment + ", boardDate=" + boardDate + "]";
	}
}