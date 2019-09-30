package arc.mirim.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.cntVO;
import arc.mirim.domain.fCntVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;
import arc.mirim.domain.tableCntVO;
import arc.mirim.domain.travelCntVO;
import arc.mirim.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;

	@Override
	public List<memberInfoVO> memberInfoGetAll() {
		return adminMapper.memberInfoGetAll();
	}

	@Override
	public List<SecessionVO> secessionInfoGetAll() {
		return adminMapper.secessionInfoGetAll();
	}

	@Override
	public List<memberBookingNumVO> memberBookingNumGet() {
		return adminMapper.memberBookingNumGet();
	}


	@Override
	public List<travelCntVO> cIBCnt() {
		return adminMapper.cIBCnt();
	}
	

	@Override
	public List<Integer> courseCnt() {
		List<Integer> list = new ArrayList<Integer>();
		list.add(adminMapper.courseGet());
		list.add(adminMapper.courseGetBus());
		list.add(adminMapper.courseGetTrain());
		list.add(adminMapper.courseGetIsland());
		return list;
	}

	@Override
	public List<Integer> itemCnt() {
		List<Integer> list = new ArrayList<Integer>();
		list.add(adminMapper.travelItemCnt());
		list.add(adminMapper.ongoingTravelItemCnt());
		return list;
	}

	@Override
	public List<fCntVO> fFestivalBoardCnt() {
		return adminMapper.fFestivalBoardCnt();
	}

	@Override
	public List<cntVO> memberBookingCnt() {
		return adminMapper.memberBookingCnt();
	}

	@Override
	public List<cntVO> memberOnGoingBookingCnt() {
		return adminMapper.memberOnGoingBookingCnt();
	}

	@Override
	public List<cntVO> memberFestivalBoardCnt() {
		return adminMapper.memberFestivalBoardCnt();
	}

	@Override
	public List<String> tableNameGetAll() {
		return adminMapper.tableNameGetAll();
	}

	@Override
	public int tableCntGet(String tableName) {
		return adminMapper.tableCntGet(tableName);
	}

	@Override
	public void setMemberPwd(String id) {
		adminMapper.setMemberPwd(id);
	}
}