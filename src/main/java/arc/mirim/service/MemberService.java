package arc.mirim.service;

import java.util.List;
import java.util.Map;

import arc.mirim.domain.MemberVO;
import arc.mirim.domain.SigninDTO;

public interface MemberService {
	public List<MemberVO> memberGetAll();
	public MemberVO memberGet(String id);
	public SigninDTO Signin(SigninDTO dto);
	public int memberPwdChk(String id, String pwd);
	public int memberIdChk(String id);
	public void Signup(MemberVO vo);
	public void memberRemove(String id, String name);
	public void memberModify(MemberVO vo);
	public void pwdModify(String id, String pwd);
	public int secessionCntById(String id);
}