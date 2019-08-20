package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.BookingVO;

public interface BookingMapper {
	// TRAVELBOOKING
	
	@Select("SELECT * FROM TRAVELBOOKING")
	public List<BookingVO> bookingGetAll();
	
	@Select("SELECT * FROM TRAVELBOOKING WHERE bIdx=#{idx}")
	public BookingVO bookingGet(int idx);
	
	@Insert("INSERT INTO TRAVELBOOKING (tItemNum, bIdx, tTitle, mNum, mName, bState, warning) "
			+ "VALUES (#{tItemNum}, BIDX.nextval, #{tTitle}, #{mNum}, #{mName}, #{bState}, #{warning})")
	public void bookingRegister(BookingVO vo);
	
	@Delete("DELETE TRAVELBOOKING WHERE tcIdx=#{idx}")
	public void bookingRemove(int idx);
	
	@Update("UPDATE TRAVELBOOKING SET bState='cancel' WHERE bIdx=#{idx}")
	public void bookingCancel(BookingVO vo);
	
	@Update("UPDATE TRAVELBOOKING SET bState='decide' WHERE bIdx=#{idx}")
	public void bookingAccept(BookingVO vo);
}
