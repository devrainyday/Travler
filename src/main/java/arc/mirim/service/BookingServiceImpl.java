package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.BookingVO;
import arc.mirim.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	BookingMapper bookingMapper;
	
	@Override
	public List<BookingVO> bookingGetAll() {
		return bookingMapper.bookingGetAll();
	}

	@Override
	public BookingVO bookingGet(int idx) {
		return bookingMapper.bookingGet(idx);
	}

	@Override
	public BookingVO bookingGetByMember(String id) {
		return bookingMapper.bookingGetByMember(id);
	}

	@Override
	public void bookingRegister(BookingVO vo) {
		bookingMapper.bookingRegister(vo);
	}

	@Override
	public void bookingCancel(BookingVO vo) {
		bookingMapper.bookingCancel(vo);
	}
}