package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;
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

}
