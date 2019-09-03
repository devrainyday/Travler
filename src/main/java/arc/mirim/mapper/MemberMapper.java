package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.MemberVO;
import arc.mirim.domain.SigninDTO;

public interface MemberMapper {
	// MEMBER

	@Select("SELECT * FROM MEMBER")
	public List<MemberVO> memberGetAll();
	
    @Select("SELECT * FROM MEMBER WHERE id=#{id}")
    public MemberVO memberGet(String id);
    
    @Select("SELECT * FROM MEMBER WHERE id=#{id} AND pwd=#{pwd}")
    public SigninDTO signin(SigninDTO dto);
    
    @Select("SELECT COUNT(*) FROM MEMBER WHERE id=#{id}")
    public int signupChk(String id);
    
    @Insert("INSERT INTO MEMBER (id, pwd, name, email, phone) "
    		+ "VALUES (#{id}, #{pwd}, #{name}, #{email}, #{phone})")
    public void signup(MemberVO vo);
    
    @Update("UPDATE MEMBER SET name=#{name}, email=#{email}, phone=#{phone} "
			+ "WHERE WHERE id=#{id}")
	public void memberModify(MemberVO vo);
    
    @Update("UPDATE MEMBER SET pwd=#{pwd} WHERE id=#{id}")
	public void pwdModify(String id, String pwd);
    
    @Delete("DELETE MEMBER WHERE id = #{id}")
    public void memberRemove(String id);
}