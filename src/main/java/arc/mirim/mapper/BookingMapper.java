package arc.mirim.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.BookingVO;

public interface BookingMapper {
	// TRAVELBOOKING
	
	@Select("SELECT * FROM TRAVELBOOKING")
	public List<BookingVO> bookingGetAll();
	
	@Select("SELECT * FROM TRAVELBOOKING WHERE bIdx=#{idx}")
	public BookingVO bookingGet(int idx);
	
	@Select("SELECT * FROM TRAVELBOOKING WHERE mId=#{id}")
	public List<BookingVO> bookingGetByMember(String id);
	
	@Select("SELECT * FROM TRAVELBOOKING WHERE mId=#{mId} AND tItemNum=#{tItemNum} AND bState='ongoing'")
	public BookingVO bookingGetByMemberandNum(@Param("mId") String mId,@Param("tItemNum") int tItemNum);
	
	@Insert("INSERT INTO TRAVELBOOKING (tItemNum, bIdx, tTitle, travelStartDay, travelEndDay, totalCharge, mId, mName, bState, warning) "
			+ "VALUES (#{tItemNum}, TBSEQUENCE.nextval, #{tTitle}, #{travelStartDay}, #{travelEndDay}, #{totalCharge}, #{mId}, #{mName}, 'ongoing', #{warning})")
	public void bookingRegister(BookingVO vo);
	
	@Update("UPDATE TRAVELBOOKING SET bState='cancel' WHERE bIdx=#{idx}")
	public void bookingCancel(int idx);
}