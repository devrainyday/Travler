package arc.mirim.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.cntVO;
import arc.mirim.domain.fCntVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;
import arc.mirim.domain.tableCntVO;
import arc.mirim.domain.travelCntVO;
import arc.mirim.mapper.AdminMapper;

public interface AdminService {
	public List<memberInfoVO> memberInfoGetAll();
	public List<SecessionVO> secessionInfoGetAll();
	public List<memberBookingNumVO> memberBookingNumGet();
	
	public List<String> tableNameGetAll();
	
	public int tableCntGet(String tableName);
	
	public List<travelCntVO> cIBCnt();
	
	public List<Integer> courseCnt();
	
	public List<Integer> itemCnt();
	
	public List<fCntVO> fFestivalBoardCnt();
	
	public List<cntVO> memberBookingCnt();
	
	public List<cntVO> memberOnGoingBookingCnt();
	
	public List<cntVO> memberFestivalBoardCnt();
}
