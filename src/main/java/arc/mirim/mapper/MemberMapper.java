package arc.mirim.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.MemberVO;
import arc.mirim.domain.SigninDTO;

public interface MemberMapper {
	// MEMBER

    @Select("SELECT * FROM MEMBER WHERE id=#{signinId}")
    public Boolean checkSignup(String signinId);
    
    @Select("SELECT * FROM MEMBER WHERE id=#{signinId} AND pwd=#{signinPwd}")
    public MemberVO signin(SigninDTO dto);
    
    @Insert("INSERT INTO MEMBER (mIdx, id, pwd, name, email, phone) "
    		+ "VALUES (MSEQUENCE.nextval, #{signupId}, #{signupPwd}, #{signupName}, #{signupEmail}, #{signupPhone})")
    public void registerMember(MemberVO vo);
    
    @Update("UPDATE MEMBER SET travelNum=#{travel_num} WHERE id = #{userId}")
    public void updateMemberTravelNum(int idx);
    
    @Delete("DELETE MEMBER WHERE id = #{userId}")
    public void deleteMember(String userId);
}