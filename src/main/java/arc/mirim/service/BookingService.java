package arc.mirim.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.BookingVO;

public interface BookingService {
	public List<BookingVO> bookingGetAll();
	public BookingVO bookingGet(int idx);
	public List<BookingVO> bookingGetByMember(String id);
	public void bookingRegister(BookingVO vo);
	public void bookingCancel(int idx);
	public BookingVO bookingGetByMemberandNum(String mId, int tItemNum);
}
