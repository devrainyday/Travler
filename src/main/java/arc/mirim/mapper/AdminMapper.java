package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.cntVO;
import arc.mirim.domain.fCntVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;
import arc.mirim.domain.travelCntVO;

public interface AdminMapper {
	
	@Select("SELECT object_name tableName FROM USER_OBJECTS WHERE object_type='TABLE'")
	public List<String> tableNameGetAll();
	
	@Select("SELECT COUNT(*) FROM ${table}")
	public int tableCntGet(@Param("table") String t);
	
	
	// 하나의 Course 당 Item 개수, Booking 개수, 총 예약 금액
	@Select("SELECT TC.tcIdx tcIdx, TC.title title, COUNT(TB.totalCharge) cnt, SUM(TB.totalCharge) sum " + 
			"FROM travelCourse TC, travelItem TI, travelBooking TB " + 
			"WHERE TC.tcIdx = TI.tCourseNum AND TB.tItemNum = TI.tiIdx " + 
			"GROUP BY TC.tcIdx, TC.title")
	public List<travelCntVO> cIBCnt();
	
	
	// 전체 코스 수
	@Select("SELECT COUNT(*) FROM travelCourse")
	public int courseGet();
		
	// 버스여행 코스 수
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%버스%'")
	public int courseGetBus();
	
	// 기차여행 코스 수
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%기차%'")
	public int courseGetTrain();
	
	// 섬여행 코스 수
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%도%'")
	public int courseGetIsland();

		
	// 전체 Item 수
	@Select("SELECT COUNT(*) tIcnt FROM travelItem")
	public int travelItemCnt();
	
	// 진행 중인 Item 수
	@Select("SELECT COUNT(*) tIOnGoingcnt FROM travelItem WHERE startDay > sysdate")
	public int ongoingTravelItemCnt();
	
	
	// Festival 당 FestivalBoard 개수
	@Select("SELECT F.fIdx fIdx, F.title title, COUNT(*) cnt FROM festival F, festivalBoard FB " + 
			"WHERE F.fidx = FB.festivalNum GROUP BY F.fIdx, F.title")
	public List<fCntVO> fFestivalBoardCnt();
	
	
	// Member 당 Booking 개수
	@Select("SELECT M.id id, M.name name, COUNT(*) cnt FROM member M, travelBooking TB " + 
			"WHERE M.id = TB.mid GROUP BY M.id, M.name")
	public List<cntVO> memberBookingCnt();
	
	// Member 당 ongoing인 Booking 개수
	@Select("SELECT M.id id, M.name name, COUNT(*) cnt FROM member M, travelBooking TB " + 
			"WHERE M.id = TB.mid AND TB.bState='ongoing' GROUP BY M.id, M.name")
	public List<cntVO> memberOnGoingBookingCnt();

	// Member 당 FestivalBoard 개수
	@Select("SELECT M.id id, M.name name, COUNT(*) cnt FROM member M, festivalBoard FB " + 
			"WHERE M.id = FB.memberid GROUP BY M.id, M.name")
	public List<cntVO> memberFestivalBoardCnt();
	
	@Select("SELECT * FROM memberInfo")
	public List<memberInfoVO> memberInfoGetAll();
	
	@Update("UPDATE member SET pwd='asdf1234*' WHERE id=#{id}")
	public void setMemberPwd(String id);
	
	@Select("SELECT mId, COUNT(*) num, getLevel(SUM(totalCharge)) l FROM TRAVELBOOKING WHERE bState='ongoing' GROUP BY mId")
	public List<memberBookingNumVO> memberBookingNumGet();
	
	@Select("SELECT * FROM SECESSION")
	public List<SecessionVO> secessionInfoGetAll();
}