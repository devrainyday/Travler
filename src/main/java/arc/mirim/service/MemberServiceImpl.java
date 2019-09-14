package arc.mirim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.MemberVO;
import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.SigninDTO;
import arc.mirim.mapper.MemberMapper;
import arc.mirim.mapper.SecessionMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	SecessionMapper secessionMapper;
	
	@Override
	public List<MemberVO> memberGetAll() {
		System.out.println("Getting all member");
		return memberMapper.memberGetAll();
	}

	@Override
	public MemberVO memberGet(String id) {
		System.out.println("Get member");
		return memberMapper.memberGet(id);
	}
	
	@Autowired
	MemberService memberS;
	
	@Override
	public int memberIdChk(String id) {
		return memberMapper.signupChk(id);
	}
	
	@Override
	public SigninDTO Signin(SigninDTO dto) {
		System.out.println("signin");
		System.out.println(dto);
		return memberMapper.signin(dto);
	}

	@Override
	public void Signup(MemberVO vo) {
		System.out.println("signup");
		memberMapper.signup(vo);
		System.out.println(vo);
	}

	@Override
	public void memberRemove(String id, String name) {
		System.out.println("Remove member");
		memberMapper.memberRemove(id);
		
		secessionMapper.registerSecession(id, name);
	}

	@Override
	public void memberModify(MemberVO vo) {
		System.out.println("Modify member");
		memberMapper.memberModify(vo);
		System.out.println(vo);
	}
	
	@Override
	public void pwdModify(String id, String pwd) {
		System.out.println("Modify pwd");
		memberMapper.pwdModify(id, pwd);
	}

	@Override
	public int memberPwdChk(String id, String pwd) {
		return memberMapper.mypagePwdChk(id, pwd);
	}
}
