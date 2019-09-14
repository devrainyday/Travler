package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;
import arc.mirim.mapper.AdminMapper;

public interface AdminService {
	public List<memberInfoVO> memberInfoGetAll();
	public List<SecessionVO> secessionInfoGetAll();
	public List<memberBookingNumVO> memberBookingNumGet();
}
